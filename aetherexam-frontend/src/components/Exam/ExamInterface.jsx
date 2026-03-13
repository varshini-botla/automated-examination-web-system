import React, { useState, useEffect } from 'react'
import { motion, AnimatePresence } from 'framer-motion'
import { useParams, useNavigate } from 'react-router-dom'
import { Clock, ArrowRight, CheckCircle, AlertCircle, Sparkles } from 'lucide-react'
import ExamService from '../../services/exam.service'

const ExamInterface = () => {
  const { subject } = useParams()
  const navigate = useNavigate()
  
  const [questions, setQuestions] = useState([])
  const [currentIdx, setCurrentIdx] = useState(0)
  const [answers, setAnswers] = useState({})
  const [timeLeft, setTimeLeft] = useState(300) // 5 mins
  const [isSubmitting, setIsSubmitting] = useState(false)
  const [result, setResult] = useState(null)

  useEffect(() => {
    const fetchData = async () => {
      try {
        const res = await ExamService.getQuestionsBySubject(subject)
        setQuestions(res.data)
      } catch (err) {
        console.error(err)
      }
    }
    fetchData()
  }, [subject])

  useEffect(() => {
    if (timeLeft <= 0) {
        handleSubmit()
        return
    }
    const timer = setInterval(() => setTimeLeft(prev => prev - 1), 1000)
    return () => clearInterval(timer)
  }, [timeLeft])

  const handleOptionSelect = (qId, option) => {
    setAnswers({ ...answers, [qId]: option })
  }

  const handleSubmit = async () => {
    setIsSubmitting(true)
    try {
      const res = await ExamService.submitExam(subject, answers)
      setResult(res.data)
    } catch (err) {
      console.error(err)
    } finally {
      setIsSubmitting(false)
    }
  }

  if (result) return <ResultView result={result} subject={subject} />

  const currentQ = questions[currentIdx]

  return (
    <div className="max-w-4xl mx-auto px-6 pt-10 pb-20">
      {/* Header with Progress & Timer */}
      <div className="flex items-center justify-between mb-12">
        <div className="glass px-6 py-2 rounded-2xl flex items-center gap-4 border-white/10">
          <Clock className={`w-5 h-5 ${timeLeft < 60 ? 'text-rose-500 animate-pulse' : 'text-aether-primary'}`} />
          <span className="text-xl font-mono font-bold tracking-tighter">
            {Math.floor(timeLeft / 60)}:{(timeLeft % 60).toString().padStart(2, '0')}
          </span>
        </div>
        
        <div className="flex flex-col items-end">
          <span className="text-sm text-slate-400 font-bold mb-1 uppercase tracking-widest">Question {currentIdx + 1} of {questions.length}</span>
          <div className="w-48 h-2 bg-white/5 rounded-full overflow-hidden border border-white/5">
            <motion.div 
              className="h-full bg-aether-primary"
              initial={{ width: 0 }}
              animate={{ width: `${((currentIdx + 1) / questions.length) * 100}%` }}
            />
          </div>
        </div>
      </div>

      {/* Question Card */}
      <AnimatePresence mode="wait">
        {currentQ && (
          <motion.div
            key={currentQ.id}
            initial={{ opacity: 0, x: 20 }}
            animate={{ opacity: 1, x: 0 }}
            exit={{ opacity: 0, x: -20 }}
            className="glass p-10 rounded-[2.5rem] border border-white/10 shadow-2xl relative overflow-hidden"
          >
             <div className="absolute top-0 right-0 p-8 text-aether-primary/10">
                <Brain size={120} />
             </div>

             <h2 className="text-2xl font-bold mb-10 leading-relaxed relative z-10">{currentQ.text}</h2>

             <div className="grid grid-cols-1 gap-4 relative z-10">
               {['option1', 'option2', 'option3', 'option4'].map((optKey) => (
                 <button
                   key={optKey}
                   onClick={() => handleOptionSelect(currentQ.id, optKey)}
                   className={`p-6 rounded-2xl border transition-all flex items-center justify-between group ${
                     answers[currentQ.id] === optKey 
                     ? 'bg-aether-primary/20 border-aether-primary ring-1 ring-aether-primary' 
                     : 'bg-white/5 border-white/5 hover:border-white/20 hover:bg-white/10'
                   }`}
                 >
                   <span className="font-semibold">{currentQ[optKey]}</span>
                   <div className={`w-6 h-6 rounded-full border-2 flex items-center justify-center transition-all ${
                     answers[currentQ.id] === optKey 
                     ? 'bg-aether-primary border-aether-primary' 
                     : 'border-slate-700'
                   }`}>
                     {answers[currentQ.id] === optKey && <div className="w-2 h-2 bg-white rounded-full" />}
                   </div>
                 </button>
               ))}
             </div>
          </motion.div>
        )}
      </AnimatePresence>

      {/* Navigation Buttons */}
      <div className="flex items-center justify-between mt-10">
        <button 
          onClick={() => setCurrentIdx(prev => Math.max(0, prev - 1))}
          disabled={currentIdx === 0}
          className="px-8 py-3 rounded-xl font-bold bg-white/5 hover:bg-white/10 transition-all disabled:opacity-20"
        >
          Previous
        </button>
        
        {currentIdx === questions.length - 1 ? (
          <button 
            onClick={handleSubmit}
            disabled={isSubmitting}
            className="px-8 py-3 rounded-xl font-bold bg-gradient-to-r from-emerald-500 to-teal-500 shadow-lg shadow-emerald-500/20 hover:scale-105 transition-all text-white"
          >
            {isSubmitting ? 'Finalizing...' : 'Submit Exam'}
          </button>
        ) : (
          <button 
            onClick={() => setCurrentIdx(prev => Math.min(questions.length - 1, prev + 1))}
            className="px-8 py-3 rounded-xl font-bold bg-aether-primary shadow-lg shadow-aether-primary/20 hover:scale-105 transition-all text-white flex items-center gap-2"
          >
            Next <ArrowRight className="w-4 h-4" />
          </button>
        )}
      </div>
    </div>
  )
}

const ResultView = ({ result, subject, questions }) => {
    const navigate = useNavigate()
    return (
        <motion.div 
            initial={{ opacity: 0, scale: 0.9 }}
            animate={{ opacity: 1, scale: 1 }}
            className="max-w-2xl mx-auto px-6 py-20 text-center"
        >
            <div className="w-24 h-24 bg-emerald-500/20 rounded-full flex items-center justify-center mx-auto mb-8 border border-emerald-500/50">
                <CheckCircle className="text-emerald-500 w-12 h-12" />
            </div>
            <h1 className="text-4xl font-bold mb-4">Exam Completed!</h1>
            <p className="text-slate-400 mb-10">You've successfully finished the {subject} examination.</p>

            <div className="glass p-10 rounded-[3rem] border border-white/10 mb-10 overflow-hidden relative">
                <div className="absolute top-0 inset-x-0 h-2 bg-gradient-to-r from-aether-primary to-aether-secondary" />
                <div className="text-sm font-bold text-slate-500 uppercase tracking-widest mb-2">Your Performance</div>
                <div className="text-6xl font-black text-white mb-6">
                    {result.score} <span className="text-2xl text-slate-500">/ {result.total}</span>
                </div>
                
                <div className="bg-aether-primary/10 p-6 rounded-2xl border border-aether-primary/20 flex items-start gap-4 text-left">
                    <Sparkles className="text-aether-primary mt-1 shrink-0" />
                    <div>
                        <h4 className="text-aether-primary font-bold text-sm uppercase mb-1">Zenith AI Insights</h4>
                        <p className="text-sm leading-relaxed italic text-slate-200">"{result.feedback}"</p>
                    </div>
                </div>
            </div>

            <button 
                onClick={() => navigate('/dashboard')}
                className="px-12 py-4 rounded-2xl bg-white text-slate-900 font-bold hover:bg-slate-200 transition-all shadow-xl"
            >
                Back to Dashboard
            </button>
        </motion.div>
    )
}

export default ExamInterface
