import { Routes, Route, Navigate } from 'react-router-dom'
import Navbar from './components/Navbar'
import LandingPage from './pages/LandingPage'
import Login from './components/Auth/Login'
import Register from './components/Auth/Register'
import StudentDashboard from './components/Dashboard/StudentDashboard'
import AdminDashboard from './components/Dashboard/AdminDashboard'
import ExamInterface from './components/Exam/ExamInterface'
import AuthService from './services/auth.service'

const PrivateRoute = ({ children }) => {
  const user = AuthService.getCurrentUser()
  return user ? children : <Navigate to="/login" />
}

function App() {
  return (
    <div className="min-h-screen text-slate-200 bg-[#020617]">
      <Navbar />
      <main className="pt-24 pb-12">
        <Routes>
          <Route path="/" element={<div className="flex items-center justify-center min-h-screen"><h1 className="text-4xl font-bold text-aether-primary animate-pulse">Zenith AI Assessment Loading...</h1></div>} />
          <Route path="/login" element={<Login />} />
          <Route path="/register" element={<Register />} />
          <Route 
            path="/dashboard" 
            element={
              <PrivateRoute>
                <StudentDashboard />
              </PrivateRoute>
            } 
          />
          <Route 
            path="/exam/:subject" 
            element={
              <PrivateRoute>
                <ExamInterface />
              </PrivateRoute>
            } 
          />
          <Route 
            path="/admin" 
            element={
              <PrivateRoute>
                <AdminDashboard />
              </PrivateRoute>
            } 
          />
        </Routes>
      </main>
    </div>
  )
}

export default App
