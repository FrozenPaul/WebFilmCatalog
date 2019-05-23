package com.KursovoiProekt.repos;

import com.KursovoiProekt.domain.Message;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface MessageRepo extends CrudRepository<Message, Integer> {

    List<Message> findByFilmid( int id);

}
