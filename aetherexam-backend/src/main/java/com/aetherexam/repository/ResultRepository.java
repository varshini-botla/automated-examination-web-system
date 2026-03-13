package com.aetherexam.repository;

import com.aetherexam.model.Result;
import com.aetherexam.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface ResultRepository extends JpaRepository<Result, Long> {
    List<Result> findByUser(User user);
}
