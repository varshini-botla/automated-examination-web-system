package com.aetherexam.controller;

import com.aetherexam.model.Question;
import com.aetherexam.repository.QuestionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/questions")
@CrossOrigin(origins = "*", maxAge = 3600)
public class QuestionController {
    @Autowired
    QuestionRepository questionRepository;

    @GetMapping
    public List<Question> getAllQuestions() {
        return questionRepository.findAll();
    }

    @GetMapping("/subject/{subject}")
    public List<Question> getQuestionsBySubject(@PathVariable String subject) {
        return questionRepository.findBySubject(subject);
    }

    @PostMapping
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<?> addQuestion(@RequestBody Question question) {
        questionRepository.save(question);
        return ResponseEntity.ok("Question added successfully!");
    }
}
