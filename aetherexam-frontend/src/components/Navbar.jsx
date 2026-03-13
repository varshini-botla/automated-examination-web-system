import React from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { motion } from 'framer-motion'
import { Layout, LogOut, User, ShieldCheck } from 'lucide-react'
import AuthService from '../services/auth.service'

const Navbar = () => {
  const navigate = useNavigate()
  const user = AuthService.getCurrentUser()

  const handleLogout = () => {
    AuthService.logout()
    navigate('/login')
  }

  return (
    <nav className="fixed top-0 left-0 w-full z-50 px-6 py-4">
      <div className="max-w-7xl mx-auto glass rounded-2xl px-6 py-3 flex items-center justify-between border border-white/10 shadow-2xl">
        <Link to="/" className="flex items-center gap-2 group">
          <div className="w-10 h-10 bg-aether-primary rounded-xl flex items-center justify-center shadow-lg group-hover:scale-110 transition-transform">
            <Layout className="text-white w-6 h-6" />
          </div>
          <span className="text-xl font-bold bg-gradient-to-r from-white to-aether-primary bg-clip-text text-transparent">
            Web Based Automated Examination System
          </span>
        </Link>

        <div className="flex items-center gap-6">
          {user ? (
            <>
              <div className="flex items-center gap-2 px-3 py-1.5 rounded-lg bg-white/5 border border-white/5">
                <User className="w-4 h-4 text-aether-primary" />
                <span className="text-sm font-medium">{user.username}</span>
                {user.role === 'ROLE_ADMIN' && (
                  <ShieldCheck className="w-4 h-4 text-emerald-400" />
                )}
              </div>
              <motion.button
                whileHover={{ scale: 1.05 }}
                whileTap={{ scale: 0.95 }}
                onClick={handleLogout}
                className="flex items-center gap-2 text-slate-400 hover:text-rose-400 transition-colors"
              >
                <LogOut className="w-5 h-5" />
                <span className="font-semibold text-sm">Logout</span>
              </motion.button>
            </>
          ) : (
            <div className="flex items-center gap-4">
              <Link to="/login" className="text-sm font-semibold hover:text-aether-primary transition-colors">
                Login
              </Link>
              <Link 
                to="/register" 
                className="px-5 py-2 rounded-xl bg-aether-primary text-white text-sm font-bold shadow-lg shadow-aether-primary/20 hover:bg-aether-primary/80 transition-all"
              >
                Get Started
              </Link>
            </div>
          )}
        </div>
      </div>
    </nav>
  )
}

export default Navbar
