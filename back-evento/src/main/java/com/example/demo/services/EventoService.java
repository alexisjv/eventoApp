package com.example.demo.services;
import com.example.demo.models.Evento;
import java.util.List;

public interface EventoService {

    Evento save(Evento evento);
    List<Evento> findAll();

    Evento getEventById(Long id);

    Evento update(Evento evento, Long id);

    void delete(Long id);

    List<Evento> findNearly(Double lat, Double lng);
}
