package com.KursovoiProekt.repos;

import com.KursovoiProekt.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepo extends JpaRepository<User, Integer> {
    User findByName(String name);
}
