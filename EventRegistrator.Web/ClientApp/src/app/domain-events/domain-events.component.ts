import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'domain-events',
  templateUrl: './domain-events.component.html'
})
export class DomainEventsComponent {
  domainevents: DomainEvent[];
  domaineventTypes: DomainEventType[];
  selectedDomaineventTypes: DomainEventType[];
  dropdownSettings: {};

  constructor(private readonly http: HttpClient, private readonly route: ActivatedRoute) {
  }

  ngOnInit() {
    this.dropdownSettings = {
      placeholder: '-',
      singleSelection: false,
      idField: 'typeName',
      textField: 'userText',
      enableCheckAll: true,
      itemsShowLimit: 10,
      allowSearchFilter: true
    };

    this.refresh();
    this.http.get<DomainEventType[]>(`api/events/${this.getEventAcronym()}/domaineventtypes`)
      .subscribe(result => {
        this.domaineventTypes = result;
      },
        error => {
          console.error(error);
        });
  }

  refresh() {
    let url = `api/events/${this.getEventAcronym()}/domainevents`;
    if (this.selectedDomaineventTypes) {
      url += "?" + this.selectedDomaineventTypes.map(typ => `types=${typ.typeName}`).join("&");
    }

    this.http.get<DomainEvent[]>(url)
      .subscribe(result => {
        this.domainevents = result;
      },
        error => {
          console.error(error);
        });
  }

  getEventAcronym() {
    return this.route.snapshot.params['eventAcronym'];
  }
}

class DomainEvent {
  id: string;
  timestamp: Date;
  type: string;
  content: string;
}

class DomainEventType {
  typeName: string;
  userText: string;
}
