import { Component, OnInit } from '@angular/core';
import {NgForm} from "@angular/forms";
import {Evento} from "../../models/Evento";
import {EventoService} from "../../services/evento.service";
import {HttpClient} from "@angular/common/http";

@Component({
  selector: 'app-create-evento',
  templateUrl: './create-evento.component.html',
  styleUrls: ['./create-evento.component.css']
})
export class CreateEventoComponent implements OnInit {

  selectedFile: File[];

  eventoDetails: Evento = {
    lat: 0,
    lng: 0,
    coverImage: "",
    /* date: '',*/
    id: 0,
    name: "",
    type_event: 0,
    type_music: 0,
    type_site: 0,
    description: "",
    privacy: true
  }

  constructor(private eventoService: EventoService, private http: HttpClient) { }

  ngOnInit(): void {
  }


  onFileSelected(event: any) {
    this.selectedFile = event.target.files;
    console.log(this.selectedFile);
  }


  createEvento(form: NgForm) {

    const formData = new FormData();
    for (let file of this.selectedFile){
      formData.append('imageFile', file, file.name);
    }

    formData.append("name", this.eventoDetails.name)
    formData.append("type_event", String(this.eventoDetails.type_event))
    formData.append("type_music", String(this.eventoDetails.type_music))
    formData.append("type_site", String(this.eventoDetails.type_site))
    formData.append("description", String(this.eventoDetails.description))
    formData.append("privacy", String(this.eventoDetails.privacy))
    formData.append("lat", String(this.eventoDetails.lat))
    formData.append("lng", String(this.eventoDetails.lng))

    this.eventoService.createEvento(formData)
  }
}
