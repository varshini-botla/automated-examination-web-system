import React from 'react'
import { motion } from 'framer-motion'
import { Link } from 'react-router-dom'
import { ArrowRight, Sparkles, Shield, Cpu, Zap } from 'lucide-react'

const LandingPage = () => {
  return (
    <div className="min-h-screen relative overflow-hidden">
      {/* Animated Hero Section */}
      <section className="pt-32 pb-20 px-6 relative z-10">
        <div className="max-w-6xl mx-auto text-center">
          <motion.div
            initial={{ opacity: 0, scale: 0.9 }}
            animate={{ opacity: 1, scale: 1 }}
            className="inline-flex items-center gap-2 px-6 py-2 rounded-full glass border border-aether-primary/30 text-aether-primary font-bold text-sm mb-8"
          >
            <Sparkles size={16} />
            The Future of Learning Has Arrived
          </motion.div>
          
          <motion.h1 
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            className="text-6xl md:text-8xl font-black mb-6 tracking-tight leading-[0.9]"
          >
            WEB BASED <br />
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-aether-primary via-aether-secondary to-aether-accent">AUTOMATED EXAMINATION SYSTEM</span>
          </motion.h1>

          <motion.p 
             initial={{ opacity: 0, y: 20 }}
             animate={{ opacity: 1, y: 0 }}
             transition={{ delay: 0.1 }}
             className="text-xl text-slate-400 max-w-2xl mx-auto mb-12 leading-relaxed"
          >
            Experience the world's most advanced online examination platform. 
            Powered by Gemini AI for personalized feedback and professional-grade security.
          </motion.p>

          <motion.div 
             initial={{ opacity: 0, y: 20 }}
             animate={{ opacity: 1, y: 0 }}
             transition={{ delay: 0.2 }}
             className="flex flex-col md:flex-row items-center justify-center gap-6"
          >
            <Link 
              to="/register" 
              className="px-10 py-5 rounded-2xl bg-aether-primary text-white font-black text-lg shadow-2xl shadow-aether-primary/40 hover:scale-105 transition-all flex items-center gap-3"
            >
              Get Started for Free
              <ArrowRight size={24} />
            </Link>
            <Link 
              to="/login" 
              className="px-10 py-5 rounded-2xl glass border border-white/10 text-white font-black text-lg hover:bg-white/5 transition-all"
            >
              Explore Demo
            </Link>
          </motion.div>
        </div>
      </section>

      {/* Feature Grid */}
      <section className="py-20 px-6">
        <div className="max-w-7xl mx-auto grid grid-cols-1 md:grid-cols-3 gap-8">
           {[
             { title: 'AI Insights', desc: 'Real-time feedback powered by Google Gemini.', icon: <Cpu />, color: 'text-aether-primary' },
             { title: 'Ultra Secure', desc: 'JWT stateless authentication and proctoring.', icon: <Shield />, color: 'text-emerald-400' },
             { title: 'Pro Analytics', desc: 'Deep dive into your learning velocity.', icon: <Zap />, color: 'text-yellow-400' }
           ].map((f, i) => (
             <motion.div 
               key={i}
               initial={{ opacity: 0, y: 20 }}
               whileInView={{ opacity: 1, y: 0 }}
               viewport={{ once: true }}
               className="glass p-10 rounded-[3rem] border border-white/5 flex flex-col items-start gap-6 hover:border-white/20 transition-all"
             >
                <div className={`w-16 h-16 rounded-2xl bg-white/5 flex items-center justify-center ${f.color} border border-white/5`}>
                    {React.cloneElement(f.icon, { size: 32 })}
                </div>
                <h3 className="text-2xl font-bold">{f.title}</h3>
                <p className="text-slate-400 leading-relaxed">{f.desc}</p>
             </motion.div>
           ))}
        </div>
      </section>
    </div>
  )
}

export default LandingPage
