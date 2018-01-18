import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { RouterModule } from '@angular/router';

import { AppComponent } from './components/app/app.component';
import { NavMenuComponent } from './components/navmenu/navmenu.component';
import { HomeComponent } from './components/home/home.component';
import { CounterComponent } from './components/counter/counter.component';

import { RegistrablesComponent } from './components/registrables/registrables.component';
import { ParticipantsComponent } from './components/participants/participants.component';
import { HostingComponent } from './components/hosting/hosting.component';
import { UnrecognizedPaymentsComponent } from './components/unrecognizedPayments/unrecognizedPayments.component';

@NgModule({
  declarations: [
    AppComponent,
    NavMenuComponent,
    CounterComponent,
    RegistrablesComponent,
    ParticipantsComponent,
    HostingComponent,
      HomeComponent,
      UnrecognizedPaymentsComponent
  ],
  imports: [
    CommonModule,
    HttpModule,
    FormsModule,
    RouterModule.forRoot([
      { path: '', redirectTo: 'registrables', pathMatch: 'full' },
      { path: 'home', component: HomeComponent },
      { path: 'counter', component: CounterComponent },
      { path: 'registrables', component: RegistrablesComponent },
      { path: 'registrables/:id/participants', component: ParticipantsComponent },
      { path: 'hosting', component: HostingComponent },
      { path: 'unrecognizedPayments', component: UnrecognizedPaymentsComponent },
      { path: '**', redirectTo: 'registrables' }
    ])
  ]
})
export class AppModuleShared {
}