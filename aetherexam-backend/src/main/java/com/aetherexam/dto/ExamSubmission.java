package com.aetherexam.dto;

import java.util.Map;

public class ExamSubmission {
    private String subject;
    private Map<Long, String> answers;

    public String getSubject() { return subject; }
    public void setSubject(String subject) { this.subject = subject; }
    public Map<Long, String> getAnswers() { return answers; }
    public void setAnswers(Map<Long, String> answers) { this.answers = answers; }
}
