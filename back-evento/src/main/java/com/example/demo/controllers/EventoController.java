package com.example.demo.controllers;
import com.example.demo.models.Evento;
import com.example.demo.services.EventoService;
import com.example.demo.services.FileService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/api/eventos")
public class EventoController {

    private EventoService eventoService;
    private FileService fileService;


    public EventoController(EventoService eventoService, FileService fileService) {
        this.eventoService = eventoService;
        this.fileService = fileService;
    }

    @PostMapping("create")
    public ResponseEntity<String> saveEvento(
            @RequestParam("name") String name,
           /* @RequestParam("type_event") Integer type_event,
            @RequestParam("type_site") Integer type_site,
            @RequestParam("type_music") Integer type_music,
            @RequestParam("description") String description,
            @RequestParam("privacy") Boolean privacy,*/
            @RequestParam("imageFile") MultipartFile[] files)
          /*  @RequestParam("lat") Double lat,
            @RequestParam("lng") Double lng)*/
    {
        System.out.println("llegue aca");
        List<String> images = fileService.upload(files);
        Evento evento = new Evento();
        evento.setName(name);/*
        evento.setType_event(type_event);
        evento.setType_music(type_music);
        evento.setType_site(type_site);
        evento.setDescription(description);
        evento.setPrivacy(privacy);*/
        evento.setCoverImage(images.get(0));
       /* evento.setLat(lat);
        evento.setLng(lng);*/
        Evento savedEvento = eventoService.save(evento);
        fileService.assignImagesToEvent(images, savedEvento.getId());
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @GetMapping("getAll")
    public List<Evento> getAllEvents(){
        return eventoService.findAll();
    }

    @PostMapping("getNearly")
    public List<Evento> getNearlyEvents(@PathVariable("lat") Double lat, @PathVariable("lng") Double lng ){
        return eventoService.findNearly(lat, lng);
    }

    @GetMapping("{id}")
    public ResponseEntity<Evento> getEventById(@PathVariable("id") long id){
        return new ResponseEntity<>(eventoService.getEventById(id), HttpStatus.OK);
    }

    @PutMapping("{id}")
    public ResponseEntity<Evento> updateEvent(@PathVariable("id") long id, @RequestBody Evento evento){
        return new ResponseEntity<>(eventoService.update(evento, id), HttpStatus.OK);
    }

    @DeleteMapping("{id}")
    public ResponseEntity<String> deleteEvent(@PathVariable("id") long id){
        eventoService.delete(id);
        return new ResponseEntity<>("Evento eliminado satisfactoriamente!", HttpStatus.OK);
    }



   /* @PostMapping("asistir/{id}")
    public ResponseEntity<String> assist(@PathVariable("id"), long id){
        userService.getActualUser();
        eventoService.assist(id, user);
    }*/
}
