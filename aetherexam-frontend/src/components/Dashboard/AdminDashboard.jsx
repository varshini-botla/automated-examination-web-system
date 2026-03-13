import React, { useState } from 'react'
import { motion } from 'framer-motion'
import { PlusCircle, Database, LayoutDashboard, Send, Trash2 } from 'lucide-react'
import QuestionController from '../../services/exam.service' // Reusing services or creating new one

const AdminDashboard = () => {
  const [formData, setFormData] = useState({
    subject: 'java',
    question: '',
    option1: '',
    option2: '',
    option3: '',
    option4: '',
    correctOption: 'option1'
  })
  const [loading, setLoading] = useState(false)
  const [success, setSuccess] = useState(false)

  const handleSubmit = async (e) => {
    e.preventDefault()
    setLoading(true)
    try {
      // In a real app, this would call a dedicated QuestionService
      console.log('Adding Question:', formData)
      setSuccess(true)
      setTimeout(() => setSuccess(false), 3000)
    } catch (err) {
      console.error(err)
    } finally {
      setLoading(false)
    }
  }

  return (
    <div className="max-w-7xl mx-auto px-6">
      <div className="flex items-center gap-3 mb-10">
        <div className="p-3 bg-aether-accent/20 rounded-2xl text-aether-accent">
          <LayoutDashboard size={28} />
        </div>
        <h1 className="text-3xl font-bold italic">Admin <span className="text-slate-500">Command Center</span></h1>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
        {/* Analytics Card */}
        <div className="lg:col-span-1 space-y-6">
           <div className="glass p-8 rounded-[2rem] border border-white/5">
              <h3 className="text-sm font-bold text-slate-500 uppercase tracking-widest mb-6">Quick Stats</h3>
              <div className="space-y-4">
                 {[
                   { label: 'Total Questions', val: '245', color: 'text-aether-primary' },
                   { label: 'Active Students', val: '1.2k', color: 'text-emerald-400' },
                   { label: 'Total Exams', val: '5.8k', color: 'text-aether-accent' }
                 ].map((s, i) => (
                   <div key={i} className="flex justify-between items-center p-4 bg-white/5 rounded-2xl border border-white/5">
                      <span className="text-slate-400 font-medium">{s.label}</span>
                      <span className={`text-xl font-bold ${s.color}`}>{s.val}</span>
                   </div>
                 ))}
              </div>
           </div>
        </div>

        {/* Add Question Form */}
        <div className="lg:col-span-2">
           <div className="glass p-10 rounded-[2.5rem] border border-white/10 relative overflow-hidden">
              <div className="flex items-center gap-2 mb-8">
                <PlusCircle className="text-aether-primary" />
                <h2 className="text-2xl font-bold">Inject New Question</h2>
              </div>

              <form onSubmit={handleSubmit} className="space-y-6">
                 <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div>
                        <label className="block text-sm font-bold text-slate-500 mb-2 uppercase ml-1">Subject domain</label>
                        <select 
                          value={formData.subject}
                          onChange={(e) => setFormData({...formData, subject: e.target.value})}
                          className="w-full bg-white/5 border border-white/10 rounded-2xl p-4 outline-none focus:border-aether-primary/50 transition-all font-bold"
                        >
                          <option value="java">Java Programming</option>
                          <option value="python">Python Mastery</option>
                          <option value="cpp">C++ Excellence</option>
                          <option value="database">Database Systems</option>
                        </select>
                    </div>
                 </div>

                 <div>
                    <label className="block text-sm font-bold text-slate-500 mb-2 uppercase ml-1">Question Content</label>
                    <textarea 
                      rows="4"
                      value={formData.question}
                      onChange={(e) => setFormData({...formData, question: e.target.value})}
                      placeholder="Enter the question text here..."
                      className="w-full bg-white/5 border border-white/10 rounded-2xl p-4 outline-none focus:border-aether-primary/50 transition-all font-medium"
                    />
                 </div>

                 <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                    {['option1', 'option2', 'option3', 'option4'].map((opt, i) => (
                       <div key={i}>
                          <input 
                             type="text"
                             value={formData[opt]}
                             onChange={(e) => setFormData({...formData, [opt]: e.target.value})}
                             placeholder={`Option ${i+1}`}
                             className="w-full bg-white/5 border border-white/10 rounded-2xl p-4 outline-none focus:border-aether-primary/50 transition-all font-medium"
                          />
                       </div>
                    ))}
                 </div>

                 <div className="flex items-center gap-6 pt-4">
                    <div className="flex-1">
                        <label className="block text-sm font-bold text-slate-500 mb-2 uppercase ml-1">Correct Identity</label>
                        <select 
                          value={formData.correctOption}
                          onChange={(e) => setFormData({...formData, correctOption: e.target.value})}
                          className="w-full bg-white/5 border border-white/10 rounded-2xl p-4 outline-none focus:border-aether-primary/50 transition-all font-bold"
                        >
                          <option value="option1">Option 1</option>
                          <option value="option2">Option 2</option>
                          <option value="option3">Option 3</option>
                          <option value="option4">Option 4</option>
                        </select>
                    </div>
                    
                    <motion.button 
                      whileHover={{ scale: 1.05 }}
                      whileTap={{ scale: 0.95 }}
                      className="h-[60px] self-end px-10 rounded-2xl bg-aether-primary text-white font-bold flex items-center gap-2 shadow-lg shadow-aether-primary/30"
                    >
                      <Send size={20} />
                      {loading ? 'Processing...' : 'Deploy Question'}
                    </motion.button>
                 </div>
              </form>
              
              {success && (
                <motion.div 
                   initial={{ opacity: 0, y: 10 }}
                   animate={{ opacity: 1, y: 0 }}
                   className="mt-6 p-4 bg-emerald-500/20 border border-emerald-500/50 rounded-2xl text-emerald-400 text-center font-bold"
                >
                  Question deployed successfully to the Aether core!
                </motion.div>
              )}
           </div>
        </div>
      </div>
    </div>
  )
}

export default AdminDashboard
