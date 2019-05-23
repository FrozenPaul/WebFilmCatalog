package com.KursovoiProekt.Controllers;

import com.KursovoiProekt.domain.Film;
import com.KursovoiProekt.domain.Genre;
import com.KursovoiProekt.domain.Message;
import com.KursovoiProekt.domain.User;
import com.KursovoiProekt.repos.FilmRepo;
import com.KursovoiProekt.repos.GenreRepo;
import com.KursovoiProekt.repos.MessageRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("/film")
public class FilmController {
    @Autowired
    private MessageRepo messageRepo;

    @Autowired
    private FilmRepo filmRepo;

    @Autowired
    private GenreRepo genreRepo;

    @GetMapping("{film}")
    public String film(@PathVariable Film film , Map<String, Object> model){
        incertValuesInModel(film,model);
        model.put("imagepath",film.getImagepath());
        model.put("messages",messageRepo.findByFilmid(film.getId()));
        model.put("count",messageRepo.findByFilmid(film.getId()).size());
        return "film";
    }

    @PostMapping("{film}")
    public String addComment(@AuthenticationPrincipal User user,
                             @PathVariable Film film,
                             @RequestParam String text ,
                             Map<String, Object> model){
        Message message = new Message(text,user);
        message.setFilmid(film.getId());
        messageRepo.save(message);
        model.put("imagepath",film.getImagepath());
        incertValuesInModel(film,model);
        model.put("messages", messageRepo.findByFilmid(film.getId()));
        model.put("count",messageRepo.findByFilmid(film.getId()).size());
        return "film";
    }


    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/edit/{film}")
    public String filmEditForm(@PathVariable Film film, Model model){
        model.addAttribute("film",film);
        model.addAttribute("genre",genreRepo.findById(film.getGenreid()));
        return "filmEdit";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/edit/addFilm/form")
    public String addFilmForm(){
        return "addFilm";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("/edit/addFilm")
    public String addFilm(@RequestParam String name,
                          @RequestParam String producer,
                          @RequestParam String genreName,
                          @RequestParam String duration,
                          @RequestParam String release_year,
                          @RequestParam String country,
                          @RequestParam String description){
        if (!name.equals("") || !genreName.equals("") || !release_year.equals("") || !country.equals("")) {
            Genre genre;
            if (!genreRepo.existsByName(genreName)) {
                genre = new Genre(genreName);
                genreRepo.save(genre);
            } else {
                genre = genreRepo.findByName(genreName);
            }
            Film film = new Film(name, producer, genre.getId(), duration, release_year, country, description);

            filmRepo.save(film);
        }
        return "redirect:/film/edit/addFilm/form";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("/edit")
    public String filmSave(@RequestParam String name,
                           @RequestParam String producer,
                           @RequestParam String genreName,
                           @RequestParam String duration,
                           @RequestParam String release_year,
                           @RequestParam String country,
                           @RequestParam String description,
                           @RequestParam("filmId") Film film){
        film.setName(name);
        film.setProducer(producer);
        Genre genre;
        if (!genreRepo.existsByName(genreName)){
            genre = new Genre(genreName);
            genreRepo.save(genre);
        }else {
            genre = genreRepo.findByName(genreName);
        }
        film.setGenreid(genre.getId());
        film.setDuration(duration);
        film.setRelease_year(release_year);
        film.setCountry(country);
        film.setDescription(description);

        filmRepo.save(film);

        return "redirect:/";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("edit/delete")
    public String deleteFilm(@RequestParam("filmId") Film film, Model model){
        filmRepo.delete(film);
        return "redirect:/";
    }

    public void incertValuesInModel(Film film,Map<String, Object> model){
        model.put("name", film.getName());
        model.put("producer", film.getProducer());
        Genre genre = genreRepo.findById(film.getGenreid());
        model.put("genreid", genre.getName());
        model.put("duration", film.getDuration());
        model.put("release_year",film.getRelease_year());
        model.put("country",film.getCountry());
        model.put("description",film.getDescription());
    }
}
