package com.aetherexam.config;

import com.aetherexam.model.Question;
import com.aetherexam.model.User;
import com.aetherexam.repository.QuestionRepository;
import com.aetherexam.repository.UserRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.Arrays;

@Configuration
public class DataLoader {

    @Bean
    CommandLineRunner initDatabase(UserRepository userRepository, QuestionRepository questionRepository, PasswordEncoder encoder) {
        return args -> {
            // Seed Admin
            if (userRepository.findByUsername("admin").isEmpty()) {
                userRepository.save(new User("admin", "admin@webexam.com", encoder.encode("admin123"), "ADMIN"));
            }

            // Seed Student
            if (userRepository.findByUsername("student").isEmpty()) {
                userRepository.save(new User("student", "student@webexam.com", encoder.encode("student123"), "STUDENT"));
            }

            // Seed Java Questions
            if (questionRepository.findAll().isEmpty()) {
                questionRepository.saveAll(Arrays.asList(
                    new Question("Java", "What is the size of int data type in Java?", "8 bit", "16 bit", "32 bit", "64 bit", "32 bit"),
                    new Question("Java", "Which of these is not a keyword in Java?", "class", "interface", "void", "property", "property"),
                    new Question("Java", "Which component is used to compile, debug and execute the java programs?", "JRE", "JIT", "JDK", "JVM", "JDK"),
                    new Question("Java", "Which of these cannot be used for a variable name in Java?", "identifier & keyword", "identifier", "keyword", "none of the mentioned", "keyword"),
                    new Question("Java", "What is the extension of java code files?", ".js", ".txt", ".class", ".java", ".java"),
                    
                    new Question("Python", "Who developed Python Programming?", "Wick van Rossum", "Rasmus Lerdorf", "Guido van Rossum", "Niene Stom", "Guido van Rossum"),
                    new Question("Python", "Which type of Programming does Python support?", "object-oriented", "structured", "functional", "all of the mentioned", "all of the mentioned"),
                    new Question("Python", "Is Python case sensitive when dealing with identifiers?", "no", "yes", "machine dependent", "none of the mentioned", "yes"),
                    new Question("Python", "Which of the following is the correct extension of the Python file?", ".python", ".pl", ".py", ".p", ".py"),
                    
                    new Question("Cloud", "What is Cloud Computing?", "A way to store data on a local drive", "Storing and accessing data over the internet", "A type of weather forecasting", "None of the above", "Storing and accessing data over the internet"),
                    new Question("Cloud", "Which of these is a Cloud Service Provider?", "AWS", "Google Cloud", "Microsoft Azure", "All of the mentioned", "All of the mentioned")
                ));
            }
        };
    }
}
