import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";

@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(private http: HttpClient) { }

  url = 'http://localhost:8080/api/user/';

  createUser(formData: FormData){
    this.http.post(this.url + "create", formData, { observe: 'response' })
      .subscribe((response) => {
        if (response.status === 200) {
          alert("¡Usuario creado!")
        } else {
          alert('Hubo un error')
        }
      });
  }
}
