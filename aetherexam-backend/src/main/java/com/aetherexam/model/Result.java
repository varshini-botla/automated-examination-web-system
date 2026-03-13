package com.aetherexam.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "results")
public class Result {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    private String subject;
    private int score;
    private int totalQuestions;
    private LocalDateTime examDate;

    public Result() {}

    public Result(User user, String subject, int score, int totalQuestions, LocalDateTime examDate) {
        this.user = user;
        this.subject = subject;
        this.score = score;
        this.totalQuestions = totalQuestions;
        this.examDate = examDate;
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }
    public String getSubject() { return subject; }
    public void setSubject(String subject) { this.subject = subject; }
    public int getScore() { return score; }
    public void setScore(int score) { this.score = score; }
    public int getTotalQuestions() { return totalQuestions; }
    public void setTotalQuestions(int totalQuestions) { this.totalQuestions = totalQuestions; }
    public LocalDateTime getExamDate() { return examDate; }
    public void setExamDate(LocalDateTime examDate) { this.examDate = examDate; }

    public static ResultBuilder builder() {
        return new ResultBuilder();
    }

    public static class ResultBuilder {
        private User user;
        private String subject;
        private int score;
        private int totalQuestions;
        private LocalDateTime examDate;

        public ResultBuilder user(User user) { this.user = user; return this; }
        public ResultBuilder subject(String subject) { this.subject = subject; return this; }
        public ResultBuilder score(int score) { this.score = score; return this; }
        public ResultBuilder totalQuestions(int totalQuestions) { this.totalQuestions = totalQuestions; return this; }
        public ResultBuilder examDate(LocalDateTime examDate) { this.examDate = examDate; return this; }
        public Result build() {
            return new Result(user, subject, score, totalQuestions, examDate);
        }
    }
}
