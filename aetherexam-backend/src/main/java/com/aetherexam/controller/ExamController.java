package com.aetherexam.controller;

import com.aetherexam.dto.ExamSubmission;
import com.aetherexam.model.*;
import com.aetherexam.repository.*;
import com.aetherexam.service.AIService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/exams")
@CrossOrigin(origins = "*", maxAge = 3600)
public class ExamController {
    @Autowired
    QuestionRepository questionRepository;

    @Autowired
    ResultRepository resultRepository;

    @Autowired
    UserRepository userRepository;

    @Autowired
    AIService aiService;

    @PostMapping("/submit")
    public ResponseEntity<?> submitExam(@RequestBody ExamSubmission submission) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = userRepository.findByUsername(username).orElseThrow();

        List<Question> questions = questionRepository.findBySubject(submission.getSubject());
        int score = 0;

        for (Question q : questions) {
            String userAnswer = submission.getAnswers().get(q.getId());
            if (userAnswer != null && userAnswer.equalsIgnoreCase(q.getCorrectOption())) {
                score++;
            }
        }

        Result result = Result.builder()
                .user(user)
                .subject(submission.getSubject())
                .score(score)
                .totalQuestions(questions.size())
                .examDate(LocalDateTime.now())
                .build();

        resultRepository.save(result);

        String aiFeedback = aiService.generateFeedback(username, score, questions.size());

        return ResponseEntity.ok(Map.of(
            "score", score,
            "total", questions.size(),
            "feedback", aiFeedback
        ));
    }

    @GetMapping("/results")
    public List<Result> getUserResults() {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = userRepository.findByUsername(username).orElseThrow();
        return resultRepository.findByUser(user);
    }
}
