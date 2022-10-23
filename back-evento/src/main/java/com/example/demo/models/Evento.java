package com.example.demo.models;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Getter @Setter
@Entity
@Table(name = "eventos")
public class Evento {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;/*
    private Integer type_music;
    private Integer type_site;
    private Integer type_event;
    private String description;
    private Date date;
    private Boolean privacy;*/
    private String coverImage;
   /* private Double lat;
    private Double lng;*/
 /*   @ManyToOne
    @JoinColumn(name = "host_id")
    private User host_id;
*/
    @OneToMany(mappedBy = "event_id", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<Image> images;

    public Evento() {

    }

}
