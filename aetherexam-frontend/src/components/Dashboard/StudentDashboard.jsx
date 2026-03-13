import React, { useState, useEffect } from 'react'
import { motion } from 'framer-motion'
import { 
    Layout, 
    LogOut, 
    Brain, 
    BookOpen, 
    Clock, 
    Star, 
    ArrowRight, 
    Zap, 
    TrendingUp, 
    Award,
    Code2,
    Terminal,
    Cloud
} from 'lucide-react'
import { useNavigate } from 'react-router-dom'
import AuthService from '../../services/auth.service'
import { LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer, AreaChart, Area } from 'recharts'

const StudentDashboard = () => {
    const [user, setUser] = useState(null)
    const navigate = useNavigate()

    useEffect(() => {
        const currentUser = AuthService.getCurrentUser()
        if (!currentUser) {
            navigate('/login')
        } else {
            setUser(currentUser)
        }
    }, [navigate])

    const handleLogout = () => {
        AuthService.logout()
        navigate('/login')
    }

    return (
        <div className="min-h-screen bg-[#020617] text-slate-200 p-8">
            <div className="max-w-7xl mx-auto space-y-8">
                {/* Header Section */}
                <div className="flex justify-between items-end">
                    <div>
                        <h1 className="text-4xl font-bold mb-2">
                        Welcome back, <span className="text-aether-primary">{user?.username}</span>!
                        </h1>
                        <p className="text-slate-400 text-lg">Your learning progress is looking "ultra-pro" today with our Automated Examination System.</p>
                    </div>
                </div>

                {/* Stats Grid */}
                <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
                    <StatCard icon={<Zap className="text-yellow-400" />} label="Engagement" value="94%" trend="+12%" />
                    <StatCard icon={<TrendingUp className="text-emerald-400" />} label="Avg Score" value="88.5" trend="+5.2%" />
                    <StatCard icon={<Clock className="text-blue-400" />} label="Time Spent" value="24.5h" trend="+2h" />
                    <StatCard icon={<Award className="text-purple-400" />} label="Zenith Rank" value="#42" trend="Top 5%" />
                </div>

                <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
                    {/* Learning Velocity Chart */}
                    <div className="lg:col-span-2 glass rounded-[2rem] p-8 border border-white/5">
                        <h3 className="text-xl font-bold mb-6 flex items-center gap-2">
                            <TrendingUp className="text-aether-primary" /> Learning Velocity
                        </h3>
                        <div className="h-[300px] w-full">
                            <ResponsiveContainer width="100%" height="100%">
                                <AreaChart data={chartData}>
                                    <defs>
                                        <linearGradient id="colorValue" x1="0" y1="0" x2="0" y2="1">
                                            <stop offset="5%" stopColor="#22d3ee" stopOpacity={0.3}/>
                                            <stop offset="95%" stopColor="#22d3ee" stopOpacity={0}/>
                                        </linearGradient>
                                    </defs>
                                    <CartesianGrid strokeDasharray="3 3" stroke="#ffffff10" />
                                    <XAxis dataKey="name" stroke="#64748b" />
                                    <YAxis stroke="#64748b" />
                                    <Tooltip 
                                        contentStyle={{ backgroundColor: '#0f172a', border: '1px solid #ffffff10', borderRadius: '12px' }}
                                    />
                                    <Area type="monotone" dataKey="value" stroke="#22d3ee" fillOpacity={1} fill="url(#colorValue)" />
                                </AreaChart>
                            </ResponsiveContainer>
                        </div>
                    </div>

                    {/* Recent Activity */}
                    <div className="glass rounded-[2rem] p-8 border border-white/5">
                        <h3 className="text-xl font-bold mb-6">Recent Activity</h3>
                        <div className="space-y-6">
                            <ActivityItem type="Exam" title="Java Advanced" date="Today, 2:45 PM" score="92/100" />
                            <ActivityItem type="Lesson" title="Cloud Security" date="Yesterday" score="Completed" />
                            <ActivityItem type="Quiz" title="Python Data Structures" date="2 days ago" score="85/100" />
                        </div>
                    </div>
                </div>

                {/* Subject Selection */}
                <div className="space-y-6">
                    <h2 className="text-2xl font-bold">Select Your Masterclass</h2>
                    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
                        {subjects.map(subject => (
                            <SubjectCard key={subject.id} subject={subject} onClick={() => navigate(`/exam/${subject.id}`)} />
                        ))}
                    </div>
                </div>
            </div>
        </div>
    )
}

const StatCard = ({ icon, label, value, trend }) => (
    <div className="glass p-6 rounded-3xl border border-white/5 hover:border-white/10 transition-colors">
        <div className="flex items-center gap-4 mb-3">
            <div className="p-3 bg-white/5 rounded-2xl">{icon}</div>
            <span className="text-slate-400 text-sm font-medium">{label}</span>
        </div>
        <div className="flex items-end justify-between">
            <span className="text-2xl font-bold">{value}</span>
            <span className="text-emerald-400 text-xs font-mono">{trend}</span>
        </div>
    </div>
)

const ActivityItem = ({ type, title, date, score }) => (
    <div className="flex items-center justify-between group">
        <div className="flex items-center gap-4">
            <div className="w-2 h-10 bg-aether-primary/20 rounded-full group-hover:bg-aether-primary transition-all" />
            <div>
                <p className="text-xs text-slate-500 uppercase tracking-wider font-bold mb-1">{type}</p>
                <p className="font-semibold text-sm">{title}</p>
                <p className="text-[10px] text-slate-500">{date}</p>
            </div>
        </div>
        <div className="text-right">
            <p className="text-xs font-mono text-aether-primary">{score}</p>
        </div>
    </div>
)

const SubjectCard = ({ subject, onClick }) => (
    <button 
        onClick={onClick}
        className="group relative flex items-center justify-between p-6 glass rounded-3xl border border-white/5 hover:border-aether-primary/30 transition-all hover:translate-y-[-4px] text-left overflow-hidden"
    >
        <div className={`absolute top-0 right-0 w-24 h-24 bg-gradient-to-br ${subject.color} opacity-0 group-hover:opacity-10 blur-3xl transition-opacity`} />
        <div className="flex flex-col flex-1">
            <div className={`p-3 bg-gradient-to-br ${subject.color} rounded-2xl w-fit mb-4 shadow-lg shadow-black/20`}>
                {subject.icon}
            </div>
            <span className="text-white/60 text-xs font-mono mb-1">{subject.count}</span>
            <h3 className="text-xl font-bold text-white group-hover:text-aether-primary transition-colors">{subject.name}</h3>
            <p className="text-white/40 text-xs mt-2 leading-relaxed">{subject.desc}</p>
        </div>
        <ArrowRight className="text-white/20 group-hover:text-aether-primary group-hover:translate-x-1 transition-all" />
    </button>
)

const chartData = [
    { name: 'Mon', value: 30 },
    { name: 'Tue', value: 45 },
    { name: 'Wed', value: 35 },
    { name: 'Thu', value: 65 },
    { name: 'Fri', value: 55 },
    { name: 'Sat', value: 85 },
    { name: 'Sun', value: 75 },
]

const subjects = [
    { 
        id: 'java', 
        name: 'Java Advanced', 
        icon: <Code2 />, 
        color: 'from-orange-500 to-red-600', 
        count: '15 Questions',
        desc: 'Master concurrency, streams, and enterprise patterns.'
    },
    { 
        id: 'python', 
        name: 'Python Systems', 
        icon: <Terminal />, 
        color: 'from-blue-500 to-cyan-600', 
        count: '12 Questions',
        desc: 'Deep dive into automation, data structures, and AI logic.'
    },
    { 
        id: 'cloud', 
        name: 'Cloud Architecture', 
        icon: <Cloud />, 
        color: 'from-purple-500 to-indigo-600', 
        count: '10 Questions',
        desc: 'Understand scalable infrastructure and security.'
    },
    { 
        id: 'cpp', 
        name: 'C++ Excellence', 
        icon: <Star />, 
        color: 'from-purple-500 to-pink-500', 
        count: '18 Questions',
        desc: 'Systems programming and ultra-low latency.' 
    }
]

export default StudentDashboard
