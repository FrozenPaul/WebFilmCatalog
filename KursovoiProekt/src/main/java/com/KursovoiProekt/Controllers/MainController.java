package com.KursovoiProekt.Controllers;

import com.KursovoiProekt.domain.Film;
import com.KursovoiProekt.domain.Genre;
import com.KursovoiProekt.domain.User;
import com.KursovoiProekt.repos.FilmRepo;
import com.KursovoiProekt.repos.GenreRepo;
import com.KursovoiProekt.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.*;

@Controller
public class MainController {

    @Autowired
    private FilmRepo filmRepo;

    @Autowired
    private GenreRepo genreRepo;

    @Autowired
    private UserRepo userRepo;

    @GetMapping("/greeting")
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }

    @GetMapping("/")
    public String main(@AuthenticationPrincipal User user,
                       @RequestParam(required = false) String film_name,
                       Model model){
        Iterable<Film> films;
        if (film_name != null && !film_name.isEmpty()) {
            films = filmRepo.findByNameContainingOrderByName(film_name);
        }else {
            films = filmRepo.findAll();
        }
        Iterable<Genre> genres = genreRepo.findAll();
        model.addAttribute("films", films);
        model.addAttribute("genres", genres);
        model.addAttribute("filmname" , film_name);
        model.addAttribute("user",user);
        return "main";
    }

    @GetMapping("/{genre}")
    public String main(@AuthenticationPrincipal User user,
                       @PathVariable(required = false) int genre,
                       Map<String, Object> model){
        Iterable<Film> films;
        if (genre != 0 ) {
            films = filmRepo.findAllByGenreidOrderByName(genre);
        }else {
            films = filmRepo.findAll();
        }
        Iterable<Genre> genres = genreRepo.findAll();
        model.put("films", films);
        model.put("genres", genres);
        model.put("user",user);
        return "main";
    }

}