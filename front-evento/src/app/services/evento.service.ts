import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Evento} from "../models/Evento";

@Injectable({
  providedIn: 'root'
})
export class EventoService {

  constructor(private http: HttpClient) {
  }

  url = '/api/eventos/';

  getAllEventos(){
    return this.http.get<Evento[]>(this.url + "getAll");
  }

  createEvento(image: FormData){
    return this.http.post<Evento>(this.url + "create", image);
  }


  uploadImage(body: FormData){
    return this.http.post(this.url + "uploadImage", body);
  }

  getNearlyEventos(position: FormData) {
    return this.http.post<Evento[]>(this.url + "getNearly", position);
  }
}
