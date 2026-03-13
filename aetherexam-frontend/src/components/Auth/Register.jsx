import React, { useState } from 'react'
import { motion } from 'framer-motion'
import { useNavigate, Link } from 'react-router-dom'
import { Mail, Lock, User, UserPlus, ArrowRight, Shield } from 'lucide-react'
import AuthService from '../../services/auth.service'

const Register = () => {
  const [formData, setFormData] = useState({
    username: '',
    email: '',
    password: '',
    role: 'student'
  })
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState(false)
  
  const navigate = useNavigate()

  const handleRegister = async (e) => {
    e.preventDefault()
    setLoading(true)
    setError('')
    try {
      await AuthService.register(
        formData.username, 
        formData.email, 
        formData.password, 
        formData.role
      )
      setSuccess(true)
      setTimeout(() => navigate('/login'), 2000)
    } catch (err) {
      setError(err.response?.data || 'Registration failed. Try again.')
    } finally {
      setLoading(false)
    }
  }

  return (
    <div className="min-h-screen flex items-center justify-center px-4 relative overflow-hidden">
      {/* Background Glows */}
      <div className="absolute top-1/4 -right-20 w-80 h-80 bg-aether-accent/20 rounded-full blur-[100px] animate-pulse" />
      <div className="absolute bottom-1/4 -left-20 w-80 h-80 bg-aether-primary/20 rounded-full blur-[100px] animate-pulse" />

      <motion.div 
        initial={{ opacity: 0, scale: 0.95 }}
        animate={{ opacity: 1, scale: 1 }}
        transition={{ duration: 0.5 }}
        className="w-full max-w-lg"
      >
        <div className="glass p-8 rounded-[2rem] border border-white/10 shadow-2xl">
          <div className="text-center mb-8">
            <h2 className="text-3xl font-bold bg-gradient-to-r from-white to-slate-400 bg-clip-text text-transparent mb-2">
              Join Automated Examination
            </h2>
            <p className="text-slate-400">Begin your advanced learning journey</p>
          </div>

          <form onSubmit={handleRegister} className="space-y-5">
            <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
              <div className="relative group">
                <User className="absolute left-4 top-1/2 -translate-y-1/2 text-slate-500 group-focus-within:text-aether-primary transition-colors w-5 h-5" />
                <input 
                  type="text" 
                  value={formData.username}
                  onChange={(e) => setFormData({...formData, username: e.target.value})}
                  placeholder="Username"
                  required
                  className="w-full bg-white/5 border border-white/10 rounded-xl py-3 pl-12 pr-4 outline-none focus:border-aether-primary/50 focus:bg-white/10 transition-all font-medium"
                />
              </div>

              <div className="relative group">
                <Mail className="absolute left-4 top-1/2 -translate-y-1/2 text-slate-500 group-focus-within:text-aether-primary transition-colors w-5 h-5" />
                <input 
                  type="email" 
                  value={formData.email}
                  onChange={(e) => setFormData({...formData, email: e.target.value})}
                  placeholder="Email Address"
                  required
                  className="w-full bg-white/5 border border-white/10 rounded-xl py-3 pl-12 pr-4 outline-none focus:border-aether-primary/50 focus:bg-white/10 transition-all font-medium"
                />
              </div>
            </div>

            <div className="relative group">
              <Lock className="absolute left-4 top-1/2 -translate-y-1/2 text-slate-500 group-focus-within:text-aether-primary transition-colors w-5 h-5" />
              <input 
                type="password" 
                value={formData.password}
                onChange={(e) => setFormData({...formData, password: e.target.value})}
                placeholder="Secure Password"
                required
                className="w-full bg-white/5 border border-white/10 rounded-xl py-3 pl-12 pr-4 outline-none focus:border-aether-primary/50 focus:bg-white/10 transition-all font-medium"
              />
            </div>

            <div className="flex bg-white/5 p-1 rounded-xl gap-1 border border-white/5">
              <button
                type="button"
                onClick={() => setFormData({...formData, role: 'student'})}
                className={`flex-1 py-3 rounded-lg flex items-center justify-center gap-2 transition-all ${formData.role === 'student' ? 'bg-aether-primary text-white shadow-lg' : 'text-slate-400 hover:text-white'}`}
              >
                <User className="w-4 h-4" />
                <span className="text-sm font-bold">Student</span>
              </button>
              <button
                type="button"
                onClick={() => setFormData({...formData, role: 'admin'})}
                className={`flex-1 py-3 rounded-lg flex items-center justify-center gap-2 transition-all ${formData.role === 'admin' ? 'bg-aether-accent text-white shadow-lg' : 'text-slate-400 hover:text-white'}`}
              >
                <Shield className="w-4 h-4" />
                <span className="text-sm font-bold">Admin</span>
              </button>
            </div>

            {error && <p className="text-rose-400 text-sm font-medium text-center">{error}</p>}
            {success && <p className="text-emerald-400 text-sm font-medium text-center">Registration successful! Redirecting...</p>}

            <motion.button 
              whileHover={{ scale: 1.02 }}
              whileTap={{ scale: 0.98 }}
              type="submit"
              disabled={loading}
              className="w-full group bg-gradient-to-r from-aether-primary to-aether-accent hover:shadow-lg hover:shadow-aether-primary/20 text-white font-bold py-3 rounded-xl flex items-center justify-center gap-2 transition-all"
            >
              {loading ? (
                <div className="w-6 h-6 border-2 border-white/20 border-t-white rounded-full animate-spin" />
              ) : (
                <>
                  <span>Create Account</span>
                  <UserPlus className="w-5 h-5 group-hover:scale-110 transition-transform" />
                </>
              )}
            </motion.button>
          </form>

          <div className="mt-8 text-center text-sm">
            <span className="text-slate-400">Already have an account? </span>
            <Link to="/login" className="text-aether-primary font-bold hover:underline">
              Sign In
            </Link>
          </div>
        </div>
      </motion.div>
    </div>
  )
}

export default Register
