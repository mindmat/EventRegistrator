import { Component, Inject, OnInit, ViewChild, ElementRef } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';
import { HostListener } from '@angular/core';
import { FileUploader } from 'ng2-file-upload';

@Component({
  selector: 'payments',
  templateUrl: './payments.component.html',
  styleUrls: ['./payments.component.css']
})
export class PaymentsComponent implements OnInit {
  payments: Payment[];
  isSearching: boolean;
  uploader: FileUploader;
  hasBaseDropZoneOver: boolean = false;

  fileOverBase(e: any): void {
    this.hasBaseDropZoneOver = e;
  }

  constructor(private readonly http: HttpClient, private readonly route: ActivatedRoute) {
  }

  ngOnInit() {
    this.uploader = new FileUploader({
      url: `api/events/${this.getEventAcronym()}/paymentfiles/upload`,
      autoUpload: true,
      //filters:
    });
    this.uploader.onErrorItem = (item, response, status, headers) => console.error(`error uploading file ${item}: ${response}, status ${status}`);
    this.uploader.onSuccessItem = (item, response, status, headers) => console.info('success ' + item, response, status, headers);

    this.http.get<Payment[]>(`api/events/${this.getEventAcronym()}/payments`)
      .subscribe(result => { this.payments = result; },
        error => console.error(error));
  }

  fetchBankStatemensFiles() {
    this.http.post(`api/events/${this.getEventAcronym()}/fetchBankStatementFiles`, null)
      .subscribe(result => {
      },
        error => console.error(error));
  }

  getEventAcronym() {
    return this.route.snapshot.params['eventAcronym'];
  }
}

class Payment {
  id: string;
  amount: number;
  amountAssigned: number;
  bookingDate: Date;
  currency: string;
  info: string;
  reference: string;
  amountRepaid: number;
  settled: boolean;
  locked: boolean;
  ignore: boolean;
}
