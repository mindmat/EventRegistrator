import { BrowserModule, Title } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { RouterModule } from '@angular/router';
import { NgMultiSelectDropDownModule } from 'ng-multiselect-dropdown';

import { AppComponent } from './app.component';
import { NavMenuComponent } from './nav-menu/nav-menu.component';
import { AuthService } from './authentication/authService.service';
//import { HomeComponent } from './home/home.component';

import { RegistrablesComponent } from './registrables/registrables.component';
import { ParticipantsComponent } from './participants/participants.component';
import { HostingComponent } from './hosting/hosting.component';
import { UnassignedPaymentsComponent } from './unassignedPayments/unassignedPayments.component';
import { PaymentOverviewComponent } from './paymentOverview/paymentOverview.component';
import { RegistrationComponent } from './registration/registration.component';
import { SearchRegistrationComponent } from './registration/searchRegistration.component';
import { PaymentRemindersComponent } from './paymentReminders/paymentReminders.component';
import { SmsConversationComponent } from './smsConversation/smsConversation.component';
import { CheckinViewComponent } from "./checkinView/checkinView.component";
import { PartyOverviewComponent } from "./partyOverview/partyOverview.component";
import { MailTemplatesComponent } from "./mailTemplates/mailTemplates.component";
import { MailsComponent } from "./mails/mails.component";
import { EventSelectionComponent } from "./events/eventSelection.component";
import { EventAuthorizationComponent } from "./eventAuthorization/eventAuthorization.component";
import { RegistrationFormsComponent } from "./registrationForms/registrationForms.component";
import { QuestionMappingComponent } from "./questionMapping/questionMapping.component";
import { PaymentsComponent } from "./payments/payments.component";
import { EventService } from "./events/eventService.service";
import { FroalaEditorModule, FroalaViewModule } from 'angular-froala-wysiwyg';
import { FileUploadModule } from 'ng2-file-upload';
import { BulkMailTemplatesComponent } from "./bulkMailTemplates/bulkMailTemplates.component";
import { PartnerMatchingComponent } from "./partnerMatching/partnerMatching.component";
import 'bootstrap';
import { InvalidEmailAddressesComponent } from './invalid-email-addresses/invalid-email-addresses.component';
import { WaitingListComponent } from './waiting-list/waiting-list.component';
import { NotReceivedMailsComponent } from './mails/notReceivedMails.component';
import { PricingComponent } from './pricing/pricing.component';
import { RefundsComponent } from "./refunds/refunds.component";
import { PaymentDifferencesComponent } from "./payment-differences/payment-differences.component";
import { PayoutsComponent } from "./payouts/payouts.component";
import { UnassignedPayoutsComponent } from "./unassigned-payouts/unassigned-payouts.component";
import { DomainEventsComponent } from "./domain-events/domain-events.component";

@NgModule({
  declarations: [
    AppComponent,
    NavMenuComponent,
    RegistrablesComponent,
    ParticipantsComponent,
    HostingComponent,
    //HomeComponent,
    UnassignedPaymentsComponent,
    PaymentOverviewComponent,
    RegistrationComponent,
    SearchRegistrationComponent,
    PaymentRemindersComponent,
    SmsConversationComponent,
    CheckinViewComponent,
    PartyOverviewComponent,
    MailTemplatesComponent,
    MailsComponent,
    EventSelectionComponent,
    EventAuthorizationComponent,
    RegistrationFormsComponent,
    QuestionMappingComponent,
    PaymentsComponent,
    BulkMailTemplatesComponent,
    PartnerMatchingComponent,
    InvalidEmailAddressesComponent,
    WaitingListComponent,
    NotReceivedMailsComponent,
    PricingComponent,
    RefundsComponent,
    PaymentDifferencesComponent,
    PayoutsComponent,
    UnassignedPayoutsComponent,
    DomainEventsComponent
  ],
  imports: [
    BrowserModule.withServerTransition({ appId: 'ng-cli-universal' }),
    HttpClientModule,
    FormsModule,
    FileUploadModule,
    FroalaEditorModule.forRoot(),
    FroalaViewModule.forRoot(),
    NgMultiSelectDropDownModule.forRoot(),
    RouterModule.forRoot([
      //{ path: '', redirectTo: 'eventSelection', pathMatch: 'full' },
      //{ path: 'home', component: HomeComponent },
      { path: '', component: EventSelectionComponent },
      { path: ':eventAcronym', redirectTo: ':eventAcronym/registrables' },
      { path: ':eventAcronym/authorization', component: EventAuthorizationComponent },
      { path: ':eventAcronym/registrables', component: RegistrablesComponent },
      { path: ':eventAcronym/registrables/:id/participants', component: ParticipantsComponent },
      { path: ':eventAcronym/registration/:id', component: RegistrationComponent },
      { path: ':eventAcronym/searchRegistration', component: SearchRegistrationComponent },
      { path: ':eventAcronym/hosting', component: HostingComponent },
      { path: ':eventAcronym/unassignedPayments', component: UnassignedPaymentsComponent },
      { path: ':eventAcronym/paymentOverview', component: PaymentOverviewComponent },
      { path: ':eventAcronym/paymentReminders', component: PaymentRemindersComponent },
      { path: ':eventAcronym/payments', component: PaymentsComponent },
      { path: ':eventAcronym/checkinView', component: CheckinViewComponent },
      { path: ':eventAcronym/registrations/:id/sms', component: SmsConversationComponent },
      { path: ':eventAcronym/partyOverview', component: PartyOverviewComponent },
      { path: ':eventAcronym/mailTemplates', component: MailTemplatesComponent },
      { path: ':eventAcronym/bulkMailTemplates', component: BulkMailTemplatesComponent },
      { path: ':eventAcronym/mails', component: MailsComponent },
      { path: ':eventAcronym/registrationForms', component: RegistrationFormsComponent },
      { path: ':eventAcronym/questionMapping', component: QuestionMappingComponent },
      { path: ':eventAcronym/partnerMatching', component: PartnerMatchingComponent },
      { path: ':eventAcronym/invalid-email-addresses', component: InvalidEmailAddressesComponent },
      { path: ':eventAcronym/not-received-mails', component: NotReceivedMailsComponent },
      { path: ':eventAcronym/waiting-list', component: WaitingListComponent },
      { path: ':eventAcronym/pricing', component: PricingComponent },
      { path: ':eventAcronym/cancellations', component: RefundsComponent },
      { path: ':eventAcronym/payouts', component: PayoutsComponent },
      { path: ':eventAcronym/payment-differences', component: PaymentDifferencesComponent },
      { path: ':eventAcronym/unassigned-payouts', component: UnassignedPayoutsComponent },
      { path: ':eventAcronym/log', component: DomainEventsComponent }
      //{ path: '**', redirectTo: 'll18/registrables' }
    ])
  ],
  providers: [
    AuthService,
    EventService,
    Title
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
