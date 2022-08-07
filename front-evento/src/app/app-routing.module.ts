import { NgModule } from '@angular/core';
import { HomeComponent } from './home/home.component';
import { RouterModule, Routes } from '@angular/router';
import {CreateEventoComponent} from "./evento/create-evento/create-evento.component";

const routes: Routes = [
  { path: '', component: HomeComponent},
  { path: 'create', component: CreateEventoComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
