package com.aetherexam.service;

import org.springframework.stereotype.Service;

@Service
public class AIService {
    public String generateFeedback(String studentName, int score, int total) {
        // This will eventually integrate with Gemini API
        double percentage = (double) score / total * 100;
        if (percentage >= 90) {
            return "Exceptional performance! You have a profound grasp of this subject. Zenith AI suggests focusing on advanced architectural patterns next.";
        } else if (percentage >= 70) {
            return "Strong logic and good understanding. To reach the next level, practice more on edge-case scenarios and optimization techniques.";
        } else if (percentage >= 50) {
            return "Solid foundation, but there's room for improvement. Focus on the core syntax and fundamental concepts that were missed in this session.";
        } else {
            return "A great starting point. Zenith AI recommends revisiting the basic documentation and trying again. Consistency is more important than immediate perfection.";
        }
    }

    public String generateQuestionSuggestion(String subject) {
        return "New Zenith AI suggested question for " + subject + " will appear here.";
    }
}
