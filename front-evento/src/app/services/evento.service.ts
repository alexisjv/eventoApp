import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Evento} from "../models/Evento";

@Injectable({
  providedIn: 'root'
})
export class EventoService {

  constructor(private http: HttpClient) {
  }

  url = 'http://localhost:8080/api/eventos/';

  getAllEventos(){
    return this.http.get<Evento[]>(this.url + "getAll");
  }

  createEvento(formData: FormData){
    this.http.post(this.url + "create", formData, { observe: 'response' })
      .subscribe((response) => {
        if (response.status === 200) {
          alert("¡Evento creado!")
        } else {
          alert('Hubo un error')
        }
      });
  }


  uploadImage(body: FormData){
    return this.http.post(this.url + "uploadImage", body);
  }

  getNearlyEventos(position: FormData) {
    return this.http.post<Evento[]>(this.url + "getNearly", position);
  }
}
