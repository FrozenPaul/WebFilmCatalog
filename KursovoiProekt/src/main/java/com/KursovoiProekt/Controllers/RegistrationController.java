package com.KursovoiProekt.Controllers;

import com.KursovoiProekt.domain.Role;
import com.KursovoiProekt.domain.User;
import com.KursovoiProekt.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Collections;
import java.util.Map;

@Controller
public class RegistrationController {

    @Autowired
    private UserRepo userRepo;

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(@RequestParam String username, @RequestParam String password, Map<String, Object> model) {
        User userFromDb = userRepo.findByName(username);
        if (userFromDb != null) {
            model.put("message", "Пользователь с таким именем уже существует!");
            return "registration";
        }
        if (username.equals("") || password.equals("")){
            model.put("message", "Поля логин и пароль должны быть заполнены");
            return "registration";
        }
        User user = new User(username, password);
        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        userRepo.save(user);
        return "redirect:/login";
    }
}
