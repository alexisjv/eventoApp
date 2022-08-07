import { Component, OnInit } from '@angular/core';
import {EventoService} from "../services/evento.service";
import {RouterModule} from "@angular/router";
import {Evento} from "../models/Evento";
import {Observable} from "rxjs";
import {LocationService} from "../services/location.service";


@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {

  eventos: Observable<Evento[]>;
  title = 'gmaps';
  lat: number;
  lng: number;
  position: { lat: 0, lng: 0 };
  nearby: boolean = false;

  constructor(private eventoService: EventoService, private locationService: LocationService, private router:RouterModule) { }

  ngOnInit(): void {
    this.eventos = this.eventoService.getAllEventos()
    this.getLocation()
  }

  getLocation() {
    this.locationService.getPosition().then(pos => {
      this.lat = pos.lat;
      this.lng = pos.lng;
      const posi = {lat: pos.lat, lng: pos.lng}
      this.position = posi
      console.log(this.lat, this.lng)
    });
  }

  getNearlyEventos(){
    let formData = new FormData();
    formData.append("lat", String(this.position.lat))
    formData.append("lng", String(this.position.lng))
    this.eventos = this.eventoService.getNearlyEventos(formData)
  }


  label = {
    color: 'black',
    text: 'Usted está aquí'
  }
}
