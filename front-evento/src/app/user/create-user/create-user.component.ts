import { Component, OnInit } from '@angular/core';
import {EventoService} from "../../services/evento.service";
import {HttpClient} from "@angular/common/http";
import {NgForm} from "@angular/forms";
import {User} from "../../models/User";
import {UserService} from "../../services/user.service";

@Component({
  selector: 'app-create-user',
  templateUrl: './create-user.component.html',
  styleUrls: ['./create-user.component.css']
})
export class CreateUserComponent implements OnInit {

  selectedFile: File;

  userDetails: User = {
    username: "",
    firstname: "",
    surname: "",
    email: "",
    password: ""
  }

  constructor(private userService: UserService, private http: HttpClient) { }

  ngOnInit(): void {
  }


  onFileSelected(event: any) {
    this.selectedFile = event.target.files;
    console.log(this.selectedFile);
  }

  createUser(form: NgForm) {

    const formData = new FormData();
    formData.append('imageFile', this.selectedFile, this.selectedFile.name);

    formData.append("username", String(this.userDetails.username))
    formData.append("firstname", String(this.userDetails.firstname))
    formData.append("surname", String(this.userDetails.surname))
    formData.append("email", String(this.userDetails.email))
    formData.append("password", String(this.userDetails.password))

    this.userService.createUser(formData)
  }

}
