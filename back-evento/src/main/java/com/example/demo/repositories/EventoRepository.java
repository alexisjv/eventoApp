package com.example.demo.repositories;

import com.example.demo.models.Evento;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

public interface EventoRepository extends JpaRepository<Evento, Long> {

    @Query(value = "SELECT * FROM eventos WHERE lat = ?1 AND lng = ?2", nativeQuery = true)
    List<Evento> findNearly(Double lat, Double lng);

}
