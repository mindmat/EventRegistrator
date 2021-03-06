import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'participants',
  templateUrl: './participants.component.html'
})
export class ParticipantsComponent {
  public registrable: Registrable;
  public manualPromotion: boolean = false;

  constructor(private http: HttpClient, private route: ActivatedRoute) {
  }

  ngOnInit() {
    this.refreshParticipants();
  }

  refreshParticipants() {
    this.http.get<Registrable>(`api/events/${this.getEventAcronym()}/registrables/${this.getRegistrableId()}/participants`)
      .subscribe(result => { this.registrable = result; },
        error => console.error(error));
  }

  promote() {
    this.http.post(`api/events/${this.getEventAcronym()}/registrables/${this.getRegistrableId()}/tryPromoteFromWaitingList`, null)
      .subscribe(result => { this.refreshParticipants(); },
        error => console.error(error));
  }

  promoteManually(registrationId: string) {
    if (this.manualPromotion) {
      this.http.post(`api/events/${this.getEventAcronym()}/registrables/${this.getRegistrableId()}/tryPromoteFromWaitingList/${registrationId}`, null)
        .subscribe(result => { this.refreshParticipants(); },
          error => console.error(error));
    }
  }

  changeAutomaticPromotion(checked: boolean) {
    if (checked) {
      this.activateAutomaticPromotion();
    }
    else {
      this.deactivateAutomaticPromotion();
    }
  }

  activateAutomaticPromotion() {
    this.http.post(`api/events/${this.getEventAcronym()}/registrables/${this.getRegistrableId()}/activateAutomaticPromotion`, null)
      .subscribe(result => { this.refreshParticipants(); },
        error => console.error(error));
  }
  deactivateAutomaticPromotion() {
    this.http.post(`api/events/${this.getEventAcronym()}/registrables/${this.getRegistrableId()}/deactivateAutomaticPromotion`, null)
      .subscribe(result => { this.refreshParticipants(); },
        error => console.error(error));
  }

  getEventAcronym() {
    return this.route.snapshot.params["eventAcronym"];
  }

  getRegistrableId() {
    return this.route.snapshot.params["id"];
  }
}

class Registrable {
  name: string;
  maximumSingleSeats: number;
  maximumDoubleSeats: number;
  maximumAllowedImbalance: number;
  hasWaitingList: boolean;
  automaticPromotionFromWaitingList: boolean;
  participants: Place[];
  waitingList: Place[];
}

class Place {
  leader: Registration;
  follower: Registration;
  isOnWaitingList: boolean;
  isPartnerRegistration: boolean;
  placeholderPartner: string;
  joined: Date;
}

class Registration {
  id: string;
  firstName: string;
  lastName: string;
  state: number;
  email: string;
}
