package com.example.demo.services;
import com.example.demo.exceptions.ResourceNotFoundException;
import com.example.demo.models.Evento;
import com.example.demo.repositories.EventoRepository;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.beans.Transient;
import java.util.ArrayList;
import java.util.List;

@Service
public class EventoServiceImpl implements EventoService{

    private EventoRepository eventoRepository;

    public EventoServiceImpl(EventoRepository eventoRepository) {
        this.eventoRepository = eventoRepository;
    }

    @Override
    public Evento save(Evento evento) {
        return eventoRepository.save(evento);
    }

    @Override
    public List<Evento> findAll() {
        return eventoRepository.findAll();
    }

    @Override
    public Evento getEventById(Long id) {
        return eventoRepository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("Evento", "id", id)
        );
    }

    @Override
    public Evento update(Evento evento, Long id) {
        Evento existingEvent = eventoRepository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("Evento", "id", id)
        );
        existingEvent.setName(evento.getName());
        eventoRepository.save(existingEvent);
        return existingEvent;
    }

    @Override
    public void delete(Long id) {
        eventoRepository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("Evento", "id", id)
        );
        eventoRepository.deleteById(id);
    }

    @Override
    public List<Evento> findNearly(Double lat, Double lng) {
        return eventoRepository.findNearly(lat, lng);
    }

    @Override
    public Evento create(Evento eventoData, String coverImage) {
        Evento evento = new Evento();
        evento.setCoverImage(coverImage);
        evento.setName(eventoData.getName());
        evento.setLat(eventoData.getLat());
        evento.setLng(eventoData.getLng());
        save(evento);
        return evento;
    }
}
