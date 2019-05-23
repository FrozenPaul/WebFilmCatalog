package com.KursovoiProekt.repos;

import com.KursovoiProekt.domain.Genre;
import org.springframework.data.repository.CrudRepository;

public interface GenreRepo extends CrudRepository<Genre, Integer> {

    Genre findById(int id);

    Genre findByName(String name);

    Boolean existsByName(String name);
}
