package com.KursovoiProekt.repos;

import com.KursovoiProekt.domain.Film;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface FilmRepo extends CrudRepository<Film, Integer> {

    Film findById(int id);

    List<Film> findByNameContainingOrderByName(String name);

    List<Film> findAllByGenreidOrderByName(int genre);
}
