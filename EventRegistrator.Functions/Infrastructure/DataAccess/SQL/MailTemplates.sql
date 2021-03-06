﻿begin tran

DELETE FROM dbo.MailTemplates WHERE EventId = '762A93A4-56E0-402C-B700-1CFB3362B39D';

INSERT INTO dbo.MailTemplates(Id, EventId, [Type], ContentType, [Subject], SenderMail, SenderName, [Language], Template)
VALUES ('A3A7144D-F51F-4B51-ACDD-9FE96F197506', '762A93A4-56E0-402C-B700-1CFB3362B39D', 1 /*SingleRegistrationAccepted*/, 2, 'Anmeldebestätigung', 'noreply@leapinlindy.ch', 'Leapin'' Lindy', 'de', 
'<table cellspacing="0" cellpadding="0" align="center">
  <tbody>
    <tr>
      <td style="text-align: center;"><img src="https://scontent-frx5-1.xx.fbcdn.net/v/t31.0-8/22042178_1480177115410174_419267934679857047_o.jpg?oh=d6833f06299ceb688c53b8439413a696&amp;oe=5A7EF2E1" width="800" height="304" /></td>
    </tr>
    <tr>
      <td><br /><strong>Hallo {{FirstName}}</strong><br />
        <p>Herzlichen Dank f&uuml;r deine Anmeldung zum Leapin'' Lindy 2018!<br />Wir haben einen Platz f&uuml;r dich reserviert, bitte bezahle die Anmeldegeb&uuml;hr von CHF{{Price}} in den n&auml;chsten 5 Arbeitstagen (Details siehe unten).</p>
        <p>Wir freuen uns, dass du dabei bist!</p>
        <p>Das Leapin'' Lindy Team</p>
        <hr />
        <p>Du hast folgendes gebucht:<br />{{SeatList}}</p>
        <table style="width: 826px;">
          <tbody>
            <tr>
              <td style="width: 130px;"><strong>Name</strong></td>
              <td style="width: 700px;">{{FirstName}} {{LastName}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Wohnort</strong></td>
              <td style="width: 700px;">{{City}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Telefon</strong></td>
              <td style="width: 700px;">{{Phone}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Helfereinsatz</strong></td>
              <td style="width: 700px;">{{Volunteer}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Erm&auml;ssigung</strong></td>
              <td style="width: 700px;">{{Reduction}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Bemerkung</strong></td>
              <td style="width: 700px;">{{Comments}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>AGBs</strong></td>
              <td style="width: 700px;">{{AcceptTerms}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Preis</strong></td>
              <td style="width: 700px;">CHF{{Price}}</td>
            </tr>
          </tbody>
        </table>
        <p>&nbsp;</p>
      </td>
    </tr>
    <tr>
      <td><hr />
        <p>Zahlungsinformationen:</p>
        <p><strong>WICHTIG: Mache eine &Uuml;berweisung pro Anmeldung und vermerke&nbsp;deine&nbsp;Emailadresse!&nbsp;</strong></p>
        <p>Deine Zahlung muss innerhalb von 5 Arbeitstagen nach Erhalt dieser Email bei uns eintreffen. Wenn wir deine Zahlung erhalten haben, schicken wir dir eine Buchungsbest&auml;tigung. Bezahlst du nicht innerhalb der Frist, wird deine Registrierung m&ouml;glicherweise storniert. Bitte beachte die untenstehende Regelung bez&uuml;glich Absage und R&uuml;ckerstattung.</p>
        <p>Konto: 60-224741-6<br />Swing Machine Bern / Leapin Lindy<br />3000 Bern&nbsp;</p>
        <p>IBAN: CH93 0900 0000 6022 4741 6<br />BLZ: 09000<br />BIC: POFICHBEXXX</p>
        <p><strong>Bankadresse</strong><br />Swiss Post - PostFinance<br />Nordring 8<br />3030 Bern<br />Switzerland</p>
        <p>Bitte &uuml;berweise immer Schweizer Franken. Spesen zu Lasten des Absenders.&nbsp;</p>
        <p><strong>Absagen und R&uuml;ckerstattung:</strong><br />Wenn du deine Anmeldung zur&uuml;cknehmen musst, gelten folgende Regeln f&uuml;r die R&uuml;ckerstattungen:</p>
        <p>Absage bis zum 10. Januar 2018: volle R&uuml;ckerstattung<br />11. Januar - 31. Januar 2018: 50% R&uuml;ckerstattung<br />Februar 2018 und sp&auml;ter: keine R&uuml;ckerstattung&nbsp;</p>
        <p>Wenn du deine Anmeldung annulieren willst, kontaktiere uns in jedem Fall damit wir deinen Platz freigeben k&ouml;nnen.</p>
        <p><strong>WICHTIG</strong>: Krankheit und Verletzung sind in der obigen Regelung eingeschlossen.</p>
        <p>Kannst du kurzfristig nicht teilnehmen, werden wir versuchen, einen Ersatz auf der Warteliste zu finden. Gelingt uns dies, ist eine R&uuml;ckerstattung m&ouml;glich, aber nicht garantiert.<br />Im Grundsatz beh&auml;lt die Regelung G&uuml;ltigkeit.&nbsp;</p>
        <p>In jedem Falle steht es dir frei, selbst einen Ersatz f&uuml;r deinen Workshopplatz oder Partypass zu finden. Bitte kontaktiere uns vor dem Check-In, wenn du deine Anmeldung an eine andere&nbsp; Person &uuml;bertragen hast. Du bleibst aber weiterhin f&uuml;r die Zahlung des Kursgeledes verantwortlich.</p>
        <p><strong>Versicherung<br /></strong>Versicherung ist Sache der Teilnehmenden. Der Veranstalter lehnt jede Haftung ab.</p>
      </td>
    </tr>
  </tbody>
</table>')

INSERT INTO dbo.MailTemplates(Id, EventId, [Type], ContentType, [Subject], SenderMail, SenderName, [Language], Template)
VALUES ('77204060-8E30-4055-B797-92A324A00214', '762A93A4-56E0-402C-B700-1CFB3362B39D', 2 /*SingleRegistrationOnWaitingList*/, 2, 'Anmeldebestätigung (Warteliste)', 'noreply@leapinlindy.ch', 'Leapin'' Lindy', 'de', 
'<table cellspacing="0" cellpadding="0" align="center">
  <tbody>
    <tr>
      <td style="text-align: center;"><img src="https://scontent-frx5-1.xx.fbcdn.net/v/t31.0-8/22042178_1480177115410174_419267934679857047_o.jpg?oh=d6833f06299ceb688c53b8439413a696&amp;oe=5A7EF2E1" width="800" height="304" /></td>
    </tr>
    <tr>
      <td><br /><strong>Hallo {{FirstName}}</strong><br />
        <p>Herzlichen Dank f&uuml;r deine Anmeldung zum Leapin'' Lindy 2018!<br /><strong>Du bist auf der Warteliste, bitte bezahle die Anmeldegeb&uuml;hr noch nicht.</strong></p>
        <p>Das Leapin'' Lindy Team</p>
        <hr />
        <p>Du hast folgendes gebucht:<br />{{SeatList}}</p>
        <table style="width: 474px;">
          <tbody>
            <tr>
              <td style="width: 130px;"><strong>Name</strong></td>
              <td style="width: 600px;">{{FirstName}} {{LastName}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Wohnort</strong></td>
              <td style="width: 600px;">{{City}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Telefon</strong></td>
              <td style="width: 600px;">{{Phone}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Helfereinsatz</strong></td>
              <td style="width: 600px;">{{Volunteer}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Erm&auml;ssigung</strong></td>
              <td style="width: 600px;">{{Reduction}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Bemerkung</strong></td>
              <td style="width: 600px;">{{Comments}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>AGBs</strong></td>
              <td style="width: 600px;">{{AcceptTerms}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Preis</strong></td>
              <td style="width: 600px;">CHF{{Price}}</td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
  </tbody>
</table>');



INSERT INTO dbo.MailTemplates(Id, EventId, [Type], ContentType, [Subject], SenderMail, SenderName, [Language], Template)
VALUES ('E5AB6F99-8A43-4D99-9CCD-B10B4F711B5C', '762A93A4-56E0-402C-B700-1CFB3362B39D', 11 /*DoubleRegistrationFirstPartnerAccepted*/, 2, 'Anmeldebestätigung', 'noreply@leapinlindy.ch', 'Leapin'' Lindy', 'de', 
'<table cellspacing="0" cellpadding="0" align="center">
  <tbody>
    <tr>
      <td style="text-align: center;"><img src="https://scontent-frx5-1.xx.fbcdn.net/v/t31.0-8/22042178_1480177115410174_419267934679857047_o.jpg?oh=d6833f06299ceb688c53b8439413a696&amp;oe=5A7EF2E1" width="800" height="304" /></td>
    </tr>
    <tr>
      <td><br /><strong>Hallo {{FirstName}}</strong><br />
        <p>Herzlichen Dank f&uuml;r deine Anmeldung zum Leapin'' Lindy 2018!<br />Wir haben einen Platz f&uuml;r dich reserviert und warten nun auf die Anmeldung von {{Partner}}. Sobald diese eingegangen ist, erhaltet ihr die Best&auml;tigung eurer Paaranmeldung.</p>
        <p>Das Leapin'' Lindy Team</p>
        <hr />
        <p>Du hast folgendes gebucht:<br />{{SeatList}}</p>
        <table style="width: 474px;">
          <tbody>
            <tr>
              <td style="width: 130px;"><strong>Name</strong></td>
              <td style="width: 600px;">{{FirstName}} {{LastName}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Wohnort</strong></td>
              <td style="width: 600px;">{{City}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Telefon</strong></td>
              <td style="width: 600px;">{{Phone}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Helfereinsatz</strong></td>
              <td style="width: 600px;">{{Volunteer}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Erm&auml;ssigung</strong></td>
              <td style="width: 600px;">{{Reduction}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Bemerkung</strong></td>
              <td style="width: 600px;">{{Comments}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>AGBs</strong></td>
              <td style="width: 600px;">{{AcceptTerms}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Preis</strong></td>
              <td style="width: 600px;">{{Price}}</td>
            </tr>
          </tbody>
        </table>
        <p>&nbsp;</p>
      </td>
    </tr>
    <tr>
      <td><hr />
        <p>Zahlungsinformationen:</p>
        <p><strong>WICHTIG: Mache eine &Uuml;berweisung pro Anmeldung und vermerke&nbsp;deine&nbsp;Emailadresse!&nbsp;</strong></p>
        <p>Deine Zahlung muss innerhalb von 5 Arbeitstagen nach Erhalt dieser Email bei uns eintreffen. Wenn wir deine Zahlung erhalten haben, schicken wir dir eine Buchungsbest&auml;tigung. Bezahlst du nicht innerhalb der Frist, wird deine Registrierung m&ouml;glicherweise storniert. Bitte beachte die untenstehende Regelung bez&uuml;glich Absage und R&uuml;ckerstattung.</p>
        <p>Konto: 60-224741-6<br />Swing Machine Bern / Leapin Lindy<br />3000 Bern&nbsp;</p>
        <p>IBAN: CH93 0900 0000 6022 4741 6<br />BLZ: 09000<br />BIC: POFICHBEXXX</p>
        <p><strong>Bankadresse</strong><br />Swiss Post - PostFinance<br />Nordring 8<br />3030 Bern<br />Switzerland</p>
        <p>Bitte &uuml;berweise immer Schweizer Franken. Spesen zu Lasten des Absenders.&nbsp;</p>
        <p><strong>Absagen und R&uuml;ckerstattung:</strong><br />Wenn du deine Anmeldung zur&uuml;cknehmen musst, gelten folgende Regeln f&uuml;r die R&uuml;ckerstattungen:</p>
        <p>Absage bis zum 10. Januar 2018: volle R&uuml;ckerstattung<br />11. Januar - 31. Januar 2018: 50% R&uuml;ckerstattung<br />Februar 2018 und sp&auml;ter: keine R&uuml;ckerstattung&nbsp;</p>
        <p>Wenn du deine Anmeldung annulieren willst, kontaktiere uns in jedem Fall damit wir deinen Platz freigeben k&ouml;nnen.</p>
        <p><strong>WICHTIG</strong>: Krankheit und Verletzung sind in der obigen Regelung eingeschlossen.</p>
        <p>Kannst du kurzfristig nicht teilnehmen, werden wir versuchen, einen Ersatz auf der Warteliste zu finden. Gelingt uns dies, ist eine R&uuml;ckerstattung m&ouml;glich, aber nicht garantiert. Im Grundsatz beh&auml;lt die Regelung G&uuml;ltigkeit.&nbsp;</p>
        <p>In jedem Falle steht es dir frei, selbst einen Ersatz f&uuml;r deinen Workshopplatz oder Partypass zu finden. Bitte kontaktiere uns vor dem Check-In, wenn du deine Anmeldung an eine andere&nbsp; Person &uuml;bertragen hast. Du bleibst aber weiterhin f&uuml;r die Zahlung des Kursgeledes verantwortlich.</p>
        <p><strong>Versicherung<br /></strong>Versicherung ist Sache der Teilnehmenden. Der Veranstalter lehnt jede Haftung ab.</p>
      </td>
    </tr>
  </tbody>
</table>')

INSERT INTO dbo.MailTemplates(Id, EventId, [Type], ContentType, [Subject], SenderMail, SenderName, [Language], Template)
VALUES ('C16F52CC-DA0A-4319-8A31-C26582CA6381', '762A93A4-56E0-402C-B700-1CFB3362B39D', 12 /*DoubleRegistrationMatchedAndAccepted*/, 2, 'Anmeldebestätigung Paaranmeldung', 'noreply@leapinlindy.ch', 'Leapin'' Lindy', 'de', 
'<table cellspacing="0" cellpadding="0" align="center">
  <tbody>
    <tr>
      <td style="text-align: center;"><img src="https://scontent-frx5-1.xx.fbcdn.net/v/t31.0-8/22042178_1480177115410174_419267934679857047_o.jpg?oh=d6833f06299ceb688c53b8439413a696&amp;oe=5A7EF2E1" width="800" height="304" /></td>
    </tr>
    <tr>
      <td><br /><strong>Hallo {{Follower.FirstName}} &amp; {{Leader.FirstName}}</strong><br />
        <p>Herzlichen Dank f&uuml;r eure Paaranmeldung zum Leapin'' Lindy 2018!<br />Wir haben einen Platz f&uuml;r euch reserviert, bitte bezahlt eure Anmeldegeb&uuml;hr&nbsp;innerhalb von 5 Arbeitstagen&nbsp;(Details siehe unten).</p>
        <p>Das Leapin'' Lindy Team</p>
        <hr />
        <p>Ihr habt folgendes gebucht:<br /><br />Leader:<br />{{Leader.SeatList}}</p>
        <table style="width: 474px;">
          <tbody>
            <tr>
              <td style="width: 130px;"><strong>Name</strong></td>
              <td style="width: 600px;">{{Leader.FirstName}} {{Leader.LastName}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Wohnort</strong></td>
              <td style="width: 600px;">{{Leader.City}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Telefon</strong></td>
              <td style="width: 600px;">{{Leader.Phone}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Helfereinsatz</strong></td>
              <td style="width: 600px;">{{Leader.Volunteer}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Erm&auml;ssigung</strong></td>
              <td style="width: 600px;">{{Leader.Reduction}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Bemerkung</strong></td>
              <td style="width: 600px;">{{Leader.Comments}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>AGBs</strong></td>
              <td style="width: 600px;">{{Leader.AcceptTerms}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Preis</strong></td>
              <td style="width: 600px;">{{Leader.Price}}</td>
            </tr>
          </tbody>
        </table>
        <p>&nbsp;Follower:<br />{{Follower.SeatList}}</p>
        <table style="width: 474px;">
          <tbody>
            <tr>
              <td style="width: 130px;"><strong>Name</strong></td>
              <td style="width: 600px;">{{Follower.FirstName}} {{Follower.LastName}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Wohnort</strong></td>
              <td style="width: 600px;">{{Follower.City}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Telefon</strong></td>
              <td style="width: 600px;">{{Follower.Phone}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Helfereinsatz</strong></td>
              <td style="width: 600px;">{{Follower.Volunteer}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Erm&auml;ssigung</strong></td>
              <td style="width: 600px;">{{Follower.Reduction}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Bemerkung</strong></td>
              <td style="width: 600px;">{{Follower.Comments}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>AGBs</strong></td>
              <td style="width: 600px;">{{Follower.AcceptTerms}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Preis</strong></td>
              <td style="width: 600px;">{{Follower.Price}}</td>
            </tr>
          </tbody>
        </table>
        <p>&nbsp;</p>
      </td>
    </tr>
    <tr>
      <td><hr />
        <p>Zahlungsinformationen:</p>
        <p><strong>WICHTIG: Mache eine &Uuml;berweisung pro Anmeldung und vermerke&nbsp;deine&nbsp;Emailadresse!&nbsp;</strong></p>
        <p>Deine Zahlung muss innerhalb von 5 Arbeitstagen nach Erhalt dieser Email bei uns eintreffen. Wenn wir deine Zahlung erhalten haben, schicken wir dir eine Buchungsbest&auml;tigung. Bezahlst du nicht innerhalb der Frist, wird deine Registrierung m&ouml;glicherweise storniert. Bitte beachte die untenstehende Regelung bez&uuml;glich Absage und R&uuml;ckerstattung.</p>
        <p>Konto: 60-224741-6<br />Swing Machine Bern / Leapin Lindy<br />3000 Bern&nbsp;</p>
        <p>IBAN: CH93 0900 0000 6022 4741 6<br />BLZ: 09000<br />BIC: POFICHBEXXX</p>
        <p><strong>Bankadresse</strong><br />Swiss Post - PostFinance<br />Nordring 8<br />3030 Bern<br />Switzerland</p>
        <p>Bitte &uuml;berweise immer Schweizer Franken. Spesen zu Lasten des Absenders.&nbsp;</p>
        <p><strong>Absagen und R&uuml;ckerstattung:</strong><br />Wenn du deine Anmeldung zur&uuml;cknehmen musst, gelten folgende Regeln f&uuml;r die R&uuml;ckerstattungen:</p>
        <p>Absage bis zum 10. Januar 2018: volle R&uuml;ckerstattung<br />11. Januar - 31. Januar 2018: 50% R&uuml;ckerstattung<br />Februar 2018 und sp&auml;ter: keine R&uuml;ckerstattung&nbsp;</p>
        <p>Wenn du deine Anmeldung annulieren willst, kontaktiere uns in jedem Fall damit wir deinen Platz freigeben k&ouml;nnen.</p>
        <p><strong>WICHTIG</strong>: Krankheit und Verletzung sind in der obigen Regelung eingeschlossen.</p>
        <p>Kannst du kurzfristig nicht teilnehmen, werden wir versuchen, einen Ersatz auf der Warteliste zu finden. Gelingt uns dies, ist eine R&uuml;ckerstattung m&ouml;glich, aber nicht garantiert. Im Grundsatz beh&auml;lt die Regelung G&uuml;ltigkeit.&nbsp;</p>
        <p>In jedem Falle steht es dir frei, selbst einen Ersatz f&uuml;r deinen Workshopplatz oder Partypass zu finden. Bitte kontaktiere uns vor dem Check-In, wenn du deine Anmeldung an eine andere&nbsp; Person &uuml;bertragen hast. Du bleibst aber weiterhin f&uuml;r die Zahlung des Kursgeledes verantwortlich.</p>
        <p><strong>Versicherung<br /></strong>Versicherung ist Sache der Teilnehmenden. Der Veranstalter lehnt jede Haftung ab.</p>
      </td>
    </tr>
  </tbody>
</table>')

INSERT INTO dbo.MailTemplates(Id, EventId, [Type], ContentType, [Subject], SenderMail, SenderName, [Language], Template)
VALUES ('B312E47B-0AD3-43D3-AB90-580FE321788F', '762A93A4-56E0-402C-B700-1CFB3362B39D', 13 /*DoubleRegistrationFirstPartnerOnWaitingList*/, 2, 'Anmeldebestätigung Paaranmeldung (Warteliste)', 'noreply@leapinlindy.ch', 'Leapin'' Lindy', 'de', 
'<table cellspacing="0" cellpadding="0" align="center">
  <tbody>
    <tr>
      <td style="text-align: center;"><img src="https://scontent-frx5-1.xx.fbcdn.net/v/t31.0-8/22042178_1480177115410174_419267934679857047_o.jpg?oh=d6833f06299ceb688c53b8439413a696&amp;oe=5A7EF2E1" width="800" height="304" /></td>
    </tr>
    <tr>
      <td><br /><strong>Hallo {{FirstName}}</strong><br />
        <p>Herzlichen Dank f&uuml;r deine Anmeldung zum Leapin'' Lindy 2018!<br /><strong>Deine Paaranmeldung mit {{Partner}} ist auf der Warteliste,&nbsp;bitte bezahle die Anmeldegeb&uuml;hr noch nicht</strong>.</p>
        <p>Das Leapin'' Lindy Team</p>
        <hr />
        <p>Du hast folgendes gebucht:<br />{{SeatList}}</p>
        <table style="width: 816px;">
          <tbody>
            <tr>
              <td style="width: 130px;"><strong>Name</strong></td>
              <td style="width: 700px;">{{FirstName}} {{LastName}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Wohnort</strong></td>
              <td style="width: 700px;">{{City}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Telefon</strong></td>
              <td style="width: 700px;">{{Phone}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Helfereinsatz</strong></td>
              <td style="width: 700px;">{{Volunteer}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Erm&auml;ssigung</strong></td>
              <td style="width: 700px;">{{Reduction}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Bemerkung</strong></td>
              <td style="width: 700px;">{{Comments}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>AGBs</strong></td>
              <td style="width: 700px;">{{AcceptTerms}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Preis</strong></td>
              <td style="width: 700px;">CHF{{Price}}</td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
  </tbody>
</table>');


INSERT INTO dbo.MailTemplates(Id, EventId, [Type], ContentType, [Subject], SenderMail, SenderName, [Language], Template)
VALUES ('BB09F868-D619-4392-B25C-08C6B83CD0DF', '762A93A4-56E0-402C-B700-1CFB3362B39D', 14 /*DoubleRegistrationMatchedOnWaitingList*/, 2, 'Anmeldebestätigung Paaranmeldung (Warteliste)', 'noreply@leapinlindy.ch', 'Leapin'' Lindy', 'de', 
'<table cellspacing="0" cellpadding="0" align="center">
  <tbody>
    <tr>
      <td style="text-align: center;"><img src="https://scontent-frx5-1.xx.fbcdn.net/v/t31.0-8/22042178_1480177115410174_419267934679857047_o.jpg?oh=d6833f06299ceb688c53b8439413a696&amp;oe=5A7EF2E1" width="800" height="304" /></td>
    </tr>
    <tr>
      <td><br /><strong>Hallo {{Follower.FirstName}} &amp; {{Leader.FirstName}}</strong><br />
        <p>Herzlichen Dank f&uuml;r eure Paaranmeldung zum Leapin'' Lindy 2018!<br /><strong>Eure Paaranmeldung ist auf der Warteliste, bitte bezahlt die Anmeldegeb&uuml;hr noch nicht.</strong></p>
        <p>Das Leapin'' Lindy Team</p>
        <hr />
        <p>Ihr habt folgendes gebucht:<br /><br />Leader:<br />{{Leader.SeatList}}</p>
        <table style="width: 730px;">
          <tbody>
            <tr>
              <td style="width: 130px;"><strong>Name</strong></td>
              <td style="width: 600px;">{{Leader.FirstName}} {{Leader.LastName}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Wohnort</strong></td>
              <td style="width: 600px;">{{Leader.City}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Telefon</strong></td>
              <td style="width: 600px;">{{Leader.Phone}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Helfereinsatz</strong></td>
              <td style="width: 600px;">{{Leader.Volunteer}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Erm&auml;ssigung</strong></td>
              <td style="width: 600px;">{{Leader.Reduction}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Bemerkung</strong></td>
              <td style="width: 600px;">{{Leader.Comments}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>AGBs</strong></td>
              <td style="width: 600px;">{{Leader.AcceptTerms}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Preis</strong></td>
              <td style="width: 600px;">CHF{{Leader.Price}}</td>
            </tr>
          </tbody>
        </table>
        <p>&nbsp;Follower:<br />{{Follower.SeatList}}</p>
        <table style="width: 730px;">
          <tbody>
            <tr>
              <td style="width: 130px;"><strong>Name</strong></td>
              <td style="width: 600px;">{{Follower.FirstName}} {{Follower.LastName}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Wohnort</strong></td>
              <td style="width: 600px;">{{Follower.City}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Telefon</strong></td>
              <td style="width: 600px;">{{Follower.Phone}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Helfereinsatz</strong></td>
              <td style="width: 600px;">{{Follower.Volunteer}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Erm&auml;ssigung</strong></td>
              <td style="width: 600px;">{{Follower.Reduction}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Bemerkung</strong></td>
              <td style="width: 600px;">{{Follower.Comments}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>AGBs</strong></td>
              <td style="width: 600px;">{{Follower.AcceptTerms}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Preis</strong></td>
              <td style="width: 600px;">CHF{{Follower.Price}}</td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
  </tbody>
</table>');


INSERT INTO dbo.MailTemplates(Id, EventId, [Type], ContentType, [Subject], SenderMail, SenderName, [Language], Template)
VALUES ('A4198E42-E965-4259-9154-F673A6F38C4E', '762A93A4-56E0-402C-B700-1CFB3362B39D', 21 /*SoldOut*/, 2, 'Ausverkauft', 'noreply@leapinlindy.ch', 'Leapin'' Lindy', 'de', 
'<table cellspacing="0" cellpadding="0" align="center">
  <tbody>
    <tr>
      <td style="text-align: center;"><img src="https://scontent-frx5-1.xx.fbcdn.net/v/t31.0-8/22042178_1480177115410174_419267934679857047_o.jpg?oh=d6833f06299ceb688c53b8439413a696&amp;oe=5A7EF2E1" width="800" height="304" /></td>
    </tr>
    <tr>
      <td><br /><strong>Hallo {{FirstName}}</strong><br />
        <p>Leider sind die von dir gew&uuml;nschten Optionen ausverkauft.<br />Wir&nbsp;hoffen, dich trotzdem beim n&auml;chsten Mal begr&uuml;ssen zu d&uuml;rfen!</p>
        <p>Das Leapin'' Lindy Team</p>
        <hr />
        <p>{{SeatList}}</p>
        <table style="width: 826px;">
          <tbody>
            <tr>
              <td style="width: 130px;"><strong>Name</strong></td>
              <td style="width: 700px;">{{FirstName}} {{LastName}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Wohnort</strong></td>
              <td style="width: 700px;">{{City}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Telefon</strong></td>
              <td style="width: 700px;">{{Phone}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Bemerkung</strong></td>
              <td style="width: 700px;">{{Comments}}</td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
  </tbody>
</table>');


INSERT INTO dbo.MailTemplates(Id, EventId, [Type], ContentType, [Subject], SenderMail, SenderName, [Language], Template)
VALUES ('186F48DC-9927-464E-B4B7-55262DCB941C', '762A93A4-56E0-402C-B700-1CFB3362B39D', 31 /*RegistrationCancelled*/, 2, 'Buchung storniert', 'registration@leapinlindy.ch', 'Leapin'' Lindy', 'de', 
'<table cellspacing="0" cellpadding="0" align="center">
  <tbody>
    <tr>
      <td style="text-align: center;"><img src="https://scontent-frx5-1.xx.fbcdn.net/v/t31.0-8/22042178_1480177115410174_419267934679857047_o.jpg?oh=d6833f06299ceb688c53b8439413a696&amp;oe=5A7EF2E1" width="800" height="304" /></td>
    </tr>
    <tr>
      <td><br /><strong>Hallo {{FirstName}}</strong><br />
        <p>Wir haben deine Buchung storniert. Grund: {{CancellationReason}}</p>
        <p>Das Leapin'' Lindy Team</p>
      </td>
    </tr>
  </tbody>
</table>');


INSERT INTO dbo.MailTemplates(Id, EventId, [Type], ContentType, [Subject], SenderMail, SenderName, [Language], Template)
VALUES ('22844150-3210-4854-ADCF-5DCFD6A79757', '762A93A4-56E0-402C-B700-1CFB3362B39D', 41 /*FullyPaid*/, 2, 'Buchungsbestätigung', 'noreply@leapinlindy.ch', 'Leapin'' Lindy', 'de', 
'<table cellspacing="0" cellpadding="0" align="center">
  <tbody>
    <tr>
      <td style="text-align: center;"><img src="https://scontent-frx5-1.xx.fbcdn.net/v/t31.0-8/22042178_1480177115410174_419267934679857047_o.jpg?oh=d6833f06299ceb688c53b8439413a696&amp;oe=5A7EF2E1" width="800" height="304" /></td>
    </tr>
    <tr>
      <td><br /><strong>Hallo {{FirstName}}</strong><br />
        <p>Wir haben deine Zahlung erhalten und best&auml;tigen deine Buchung f&uuml;rs Leapin'' Lindy 2018.<br />Wir freuen uns darauf, dich im Februar begr&uuml;ssen zu d&uuml;rfen!</p>
        <p>Schau dir doch die Leapin'' Lindy-App an:&nbsp;<a href="https://lineupr.com/ll18/leapin-lindy-2018">https://lineupr.com/ll18/leapin-lindy-2018</a></p>
        <p>Das Leapin'' Lindy Team</p>
      </td>
    </tr>
  </tbody>
</table>');


INSERT INTO dbo.MailTemplates(Id, EventId, [Type], ContentType, [Subject], SenderMail, SenderName, [Language], Template)
VALUES ('2631FC6B-B673-404E-BC25-B5099FBAB003', '762A93A4-56E0-402C-B700-1CFB3362B39D', 42 /*PartnerRegistrationFirstPaid*/, 2, 'Erste Zahlung erhalten', 'noreply@leapinlindy.ch', 'Leapin'' Lindy', 'de', 
'<table cellspacing="0" cellpadding="0" align="center">
  <tbody>
    <tr>
      <td style="text-align: center;"><img src="https://scontent-frx5-1.xx.fbcdn.net/v/t31.0-8/22042178_1480177115410174_419267934679857047_o.jpg?oh=d6833f06299ceb688c53b8439413a696&amp;oe=5A7EF2E1" width="800" height="304" /></td>
    </tr>
    <tr>
      <td><br /><strong>Hallo {{Follower.FirstName}} &amp; {{Leader.FirstName}}</strong><br />
        <p>Wir haben die erste Zahlung erhalten; sobald die zweite eintrifft werden wir eure Anmeldung best&auml;tigen.</p>
        <p>Das Leapin'' Lindy Team</p>
        <hr />
        <p>Leader:<br />{{Leader.SeatList}}</p>
        <table style="width: 800px;">
          <tbody>
            <tr>
              <td style="width: 160px;"><strong>Name</strong></td>
              <td style="width: 640px;">{{Leader.FirstName}} {{Leader.LastName}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Preis</strong></td>
              <td style="width: 640px;">CHF{{Leader.Price}}, bezahlt CHF{{Leader.PaidAmount}}</td>
            </tr>
          </tbody>
        </table>
        <p>&nbsp;Follower:<br />{{Follower.SeatList}}</p>
        <table style="width: 800px;">
          <tbody>
            <tr>
              <td style="width: 160px;"><strong>Name</strong></td>
              <td style="width: 640px;">{{Follower.FirstName}} {{Follower.LastName}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Preis</strong></td>
              <td style="width: 640px;">CHF{{Follower.Price}}, bezahlt CHF{{Follower.PaidAmount}}</td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
  </tbody>
</table>');


INSERT INTO dbo.MailTemplates(Id, EventId, [Type], ContentType, [Subject], SenderMail, SenderName, [Language], Template)
VALUES ('E2EE1519-EA1F-488A-80B4-F0F2ECB453C1', '762A93A4-56E0-402C-B700-1CFB3362B39D', 43 /*PartnerRegistrationFullyPaid*/, 2, 'Buchungsbestätigung', 'noreply@leapinlindy.ch', 'Leapin'' Lindy', 'de', 
'<table cellspacing="0" cellpadding="0" align="center">
  <tbody>
    <tr>
      <td style="text-align: center;"><img src="https://scontent-frx5-1.xx.fbcdn.net/v/t31.0-8/22042178_1480177115410174_419267934679857047_o.jpg?oh=d6833f06299ceb688c53b8439413a696&amp;oe=5A7EF2E1" width="800" height="304" /></td>
    </tr>
    <tr>
      <td><br /><strong>Hallo {{Follower.FirstName}} &amp; {{Leader.FirstName}}</strong><br />
        <p>Wir haben eure Zahlungen erhalten und best&auml;tigen eure Buchung f&uuml;rs Leapin'' Lindy 2018.<br />Wir freuen uns darauf, euch im Februar begr&uuml;ssen zu d&uuml;rfen!</p>
        <p>Schaut euch doch die Leapin'' Lindy-App an:&nbsp;<a href="https://lineupr.com/ll18/leapin-lindy-2018">https://lineupr.com/ll18/leapin-lindy-2018</a></p>
        <p>Das Leapin'' Lindy Team</p>
      </td>
    </tr>
  </tbody>
</table>');


INSERT INTO dbo.MailTemplates(Id, EventId, [Type], ContentType, [Subject], SenderMail, SenderName, [Language], Template)
VALUES ('05A0F1D1-7F43-4F30-A29A-9D5E2E38FA66', '762A93A4-56E0-402C-B700-1CFB3362B39D', 1 /*SingleRegistrationAccepted*/, 2, 'Registration received', 'noreply@leapinlindy.ch', 'Leapin'' Lindy', 'en', 
'<table cellspacing="0" cellpadding="0" align="center">
  <tbody>
    <tr>
      <td style="text-align: center;"><img src="https://scontent-frx5-1.xx.fbcdn.net/v/t31.0-8/22042178_1480177115410174_419267934679857047_o.jpg?oh=d6833f06299ceb688c53b8439413a696&amp;oe=5A7EF2E1" width="800" height="304" /></td>
    </tr>
    <tr>
      <td><br /><strong>Hello {{FirstName}}</strong><br />
        <p>Thank you for registering for Leapin'' Lindy 2018!<br />We have reserved a place for you, please pay the fee of CHF{{Price}} within the next 5 work days (for payment details, see below).</p>
        <p>We are happy that you are taking part!</p>
        <p>The Leapin'' Lindy Team</p>
        <hr />
        <p>You booked the following:<br />{{SeatList}}</p>
        <table style="width: 800px;">
          <tbody>
            <tr>
              <td style="width: 160px;"><strong>Name</strong></td>
              <td style="width: 640px;">{{FirstName}} {{LastName}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Place of Residence</strong></td>
              <td style="width: 640px;">{{City}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Phone</strong></td>
              <td style="width: 640px;">{{Phone}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Volunteer</strong></td>
              <td style="width: 640px;">{{Volunteer}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Reduction</strong></td>
              <td style="width: 640px;">{{Reduction}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Comments</strong></td>
              <td style="width: 640px;">{{Comments}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Terms</strong></td>
              <td style="width: 640px;">{{AcceptTerms}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Price</strong></td>
              <td style="width: 640px;">CHF{{Price}}</td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
    <tr>
      <td><hr />
        <p>Payment information:</p>
        <p><strong>Please make one payment per person and quote your email address&nbsp;</strong></p>
        <p>Your payment has to reach us within 5 working days upon the receipt of this email. As soon as we have received your payment, we will send you a booking confirmation. Should we not receive your payment in time, your registration may be cancelled. Please note the regulations concerning cancellations as mentioned below.</p>
        <p>IBAN: CH93 0900 0000 6022 4741 6<br />BIC: POFICHBEXXX<br />BLZ: 09000<br />Account: 60-224741-6<br />Swing Machine Bern / Leapin Lindy<br />3000 Bern&nbsp;</p>
        <p><strong>Address of the Bank</strong><br />Swiss Post - PostFinance<br />Nordring 8<br />3030 Bern<br />Switzerland</p>
        <p>Please pay in Swiss Francs. Additional expenses on sender&rsquo;s account.</p>
        <p><strong>Cancellations and Refunds:</strong><br />If you have to withdraw your booking, the following regulations or refunding apply:</p>
        <p>Cancellations until the 10th January 2018:&nbsp;full refund<br />11th January 2018 - 31th Januar 2018: 50%&nbsp;refund<br />February 2018 and later:&nbsp;no refund</p>
        <p>Should you wish to cancel your registration, contact us in any case so that we can give your place to someone else.</p>
        <p><strong>Important</strong>: Illness and injury are included in the above-mentioned regulations.</p>
        <p>Should you be unable to&nbsp;participate at short notice, we will do our best to find a replacement from the waiting list. If we succeed, a refund might be possible. However, we cannot guarantee it. As a principle, the regulations apply.</p>
        <p>However, you are free to find your own replacement for workshop or party. Please let us know before check in, if you have passed your booking on to someone else. Nonetheless, you remain responsible for the payment of the booking fee.&nbsp;</p>
        <p><strong>Insurance: </strong>To be properly insured is the responsibility of the participant. We herewith decline any liability.</p>
      </td>
    </tr>
  </tbody>
</table>')


INSERT INTO dbo.MailTemplates(Id, EventId, [Type], ContentType, [Subject], SenderMail, SenderName, [Language], Template)
VALUES ('D06E51C5-F329-4317-B5FB-2BCEB72D050F', '762A93A4-56E0-402C-B700-1CFB3362B39D', 2 /*SingleRegistrationOnWaitingList*/, 2, 'Registration received (waiting list)', 'noreply@leapinlindy.ch', 'Leapin'' Lindy', 'en', 
'<table cellspacing="0" cellpadding="0" align="center">
  <tbody>
    <tr>
      <td style="text-align: center;"><img src="https://scontent-frx5-1.xx.fbcdn.net/v/t31.0-8/22042178_1480177115410174_419267934679857047_o.jpg?oh=d6833f06299ceb688c53b8439413a696&amp;oe=5A7EF2E1" width="800" height="304" /></td>
    </tr>
    <tr>
      <td><br /><strong>Hello {{FirstName}}</strong><br />
        <p>Thank you for registering for Leapin'' Lindy 2018!<br /><strong>You are on the waiting list, please don''t pay the fee yet.</strong></p>
        <p>The Leapin'' Lindy Team</p>
        <hr />
        <p>Du hast folgendes gebucht:<br />{{SeatList}}</p>
        <table style="width: 800px;">
          <tbody>
            <tr>
              <td style="width: 160px;"><strong>Name</strong></td>
              <td style="width: 640px;">{{FirstName}} {{LastName}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Place of Residence</strong></td>
              <td style="width: 640px;">{{City}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Phone</strong></td>
              <td style="width: 640px;">{{Phone}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Volunteer</strong></td>
              <td style="width: 640px;">{{Volunteer}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Reduction</strong></td>
              <td style="width: 640px;">{{Reduction}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Comments</strong></td>
              <td style="width: 640px;">{{Comments}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Terms</strong></td>
              <td style="width: 640px;">{{AcceptTerms}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Price</strong></td>
              <td style="width: 640px;">CHF{{Price}}</td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
  </tbody>
</table>');



INSERT INTO dbo.MailTemplates(Id, EventId, [Type], ContentType, [Subject], SenderMail, SenderName, [Language], Template)
VALUES ('569FA80F-1BCA-40CC-AA1B-9A68C49FA237', '762A93A4-56E0-402C-B700-1CFB3362B39D', 11 /*DoubleRegistrationFirstPartnerAccepted*/, 2, 'Registration received', 'noreply@leapinlindy.ch', 'Leapin'' Lindy', 'en', 
'<table cellspacing="0" cellpadding="0" align="center">
  <tbody>
    <tr>
      <td style="text-align: center;"><img src="https://scontent-frx5-1.xx.fbcdn.net/v/t31.0-8/22042178_1480177115410174_419267934679857047_o.jpg?oh=d6833f06299ceb688c53b8439413a696&amp;oe=5A7EF2E1" width="800" height="304" /></td>
    </tr>
    <tr>
      <td><br /><strong>Hello {{FirstName}}</strong><br />
        <p>Thank you for registering for Leapin'' Lindy 2018!<br />We have reserved a place for you, now we''re waiting for the registration from {{Partner}}. As soon as this is received you''ll get a confirmation of your partner registration.</p>
        <p>The Leapin'' Lindy Team</p>
        <hr />
        <p>You booked the following:<br />{{SeatList}}</p>
        <table style="width: 800px;">
          <tbody>
            <tr>
              <td style="width: 160px;"><strong>Name</strong></td>
              <td style="width: 640px;">{{FirstName}} {{LastName}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Place of Residence</strong></td>
              <td style="width: 640px;">{{City}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Phone</strong></td>
              <td style="width: 640px;">{{Phone}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Volunteer</strong></td>
              <td style="width: 640px;">{{Volunteer}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Reduction</strong></td>
              <td style="width: 640px;">{{Reduction}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Comments</strong></td>
              <td style="width: 640px;">{{Comments}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Terms</strong></td>
              <td style="width: 640px;">{{AcceptTerms}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Price</strong></td>
              <td style="width: 640px;">CHF{{Price}}</td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
    <tr>
      <td><hr />
        <p>Payment information:</p>
        <p><strong>Please make one payment per person and quote your email address&nbsp;</strong></p>
        <p>Your payment has to reach us within 5 working days upon the receipt of this email. As soon as we have received your payment, we will send you a booking confirmation. Should we not receive your payment in time, your registration may be cancelled. Please note the regulations concerning cancellations as mentioned below.</p>
        <p>IBAN: CH93 0900 0000 6022 4741 6<br />BIC: POFICHBEXXX<br />BLZ: 09000<br />Account: 60-224741-6<br />Swing Machine Bern / Leapin Lindy<br />3000 Bern&nbsp;</p>
        <p><strong>Address of the Bank</strong><br />Swiss Post - PostFinance<br />Nordring 8<br />3030 Bern<br />Switzerland</p>
        <p>Please pay in Swiss Francs. Additional expenses on sender&rsquo;s account.</p>
        <p><strong>Cancellations and Refunds:</strong><br />If you have to withdraw your booking, the following regulations or refunding apply:</p>
        <p>Cancellations until the 10th January 2018:&nbsp;full refund<br />11th January 2018 - 31th Januar 2018: 50%&nbsp;refund<br />February 2018 and later:&nbsp;no refund</p>
        <p>Should you wish to cancel your registration, contact us in any case so that we can give your place to someone else.</p>
        <p><strong>Important</strong>: Illness and injury are included in the above-mentioned regulations.</p>
        <p>Should you be unable to&nbsp;participate at short notice, we will do our best to find a replacement from the waiting list. If we succeed, a refund might be possible. However, we cannot guarantee it. As a principle, the regulations apply.</p>
        <p>However, you are free to find your own replacement for workshop or party. Please let us know before check in, if you have passed your booking on to someone else. Nonetheless, you remain responsible for the payment of the booking fee.&nbsp;</p>
        <p><strong>Insurance: </strong>To be properly insured is the responsibility of the participant. We herewith decline any liability.</p>
      </td>
    </tr>
  </tbody>
</table>')

INSERT INTO dbo.MailTemplates(Id, EventId, [Type], ContentType, [Subject], SenderMail, SenderName, [Language], Template)
VALUES ('0A07D8AE-7CD1-4939-A395-14167BD4FAE5', '762A93A4-56E0-402C-B700-1CFB3362B39D', 12 /*DoubleRegistrationMatchedAndAccepted*/, 2, 'Partner registration received', 'noreply@leapinlindy.ch', 'Leapin'' Lindy', 'en', 
'<table cellspacing="0" cellpadding="0" align="center">
  <tbody>
    <tr>
      <td style="text-align: center;"><img src="https://scontent-frx5-1.xx.fbcdn.net/v/t31.0-8/22042178_1480177115410174_419267934679857047_o.jpg?oh=d6833f06299ceb688c53b8439413a696&amp;oe=5A7EF2E1" width="800" height="304" /></td>
    </tr>
    <tr>
      <td><br /><strong>Hello {{Follower.FirstName}} &amp; {{Leader.FirstName}}</strong><br />
        <p>Thank you for your partner registration for Leapin'' Lindy 2018!<br />We have reserved a place for you,&nbsp;please pay the fee&nbsp;within the next 5 work days (for payment details, see below).</p>
        <p>The Leapin'' Lindy Team</p>
        <hr />
        <p>You booked the following:<br /><br />Leader:<br />{{Leader.SeatList}}</p>
        <table style="width: 800px;">
          <tbody>
            <tr>
              <td style="width: 160px;"><strong>Name</strong></td>
              <td style="width: 640px;">{{Leader.FirstName}} {{Leader.LastName}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Place of Residence</strong></td>
              <td style="width: 640px;">{{Leader.City}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Phone</strong></td>
              <td style="width: 640px;">{{Leader.Phone}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Volunteer</strong></td>
              <td style="width: 640px;">{{Leader.Volunteer}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Reduction</strong></td>
              <td style="width: 640px;">{{Leader.Reduction}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Comments</strong></td>
              <td style="width: 640px;">{{Leader.Comments}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Terms</strong></td>
              <td style="width: 640px;">{{Leader.AcceptTerms}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Price</strong></td>
              <td style="width: 640px;">CHF{{Leader.Price}}</td>
            </tr>
          </tbody>
        </table>
        <p>&nbsp;Follower:<br />{{Follower.SeatList}}</p>
        <table style="width: 800px;">
          <tbody>
            <tr>
              <td style="width: 160px;"><strong>Name</strong></td>
              <td style="width: 640px;">{{Follower.FirstName}} {{Follower.LastName}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Place of Residence</strong></td>
              <td style="width: 640px;">{{Follower.City}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Phone</strong></td>
              <td style="width: 640px;">{{Follower.Phone}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Volunteer</strong></td>
              <td style="width: 640px;">{{Follower.Volunteer}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Reduction</strong></td>
              <td style="width: 640px;">{{Follower.Reduction}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Comments</strong></td>
              <td style="width: 640px;">{{Follower.Comments}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Terms</strong></td>
              <td style="width: 640px;">{{Follower.AcceptTerms}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Price</strong></td>
              <td style="width: 640px;">CHF{{Follower.Price}}</td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
    <tr>
      <td><hr />
        <p>Payment information:</p>
        <p><strong>Please make one payment per person and quote your email address&nbsp;</strong></p>
        <p>Your payment has to reach us within 5 working days upon the receipt of this email. As soon as we have received your payment, we will send you a booking confirmation. Should we not receive your payment in time, your registration may be cancelled. Please note the regulations concerning cancellations as mentioned below.</p>
        <p>IBAN: CH93 0900 0000 6022 4741 6<br />BIC: POFICHBEXXX<br />BLZ: 09000<br />Account: 60-224741-6<br />Swing Machine Bern / Leapin Lindy<br />3000 Bern&nbsp;</p>
        <p><strong>Address of the Bank</strong><br />Swiss Post - PostFinance<br />Nordring 8<br />3030 Bern<br />Switzerland</p>
        <p>Please pay in Swiss Francs. Additional expenses on sender&rsquo;s account.</p>
        <p><strong>Cancellations and Refunds:</strong><br />If you have to withdraw your booking, the following regulations or refunding apply:</p>
        <p>Cancellations until the 10th January 2018:&nbsp;full refund<br />11th January 2018 - 31th Januar 2018: 50%&nbsp;refund<br />February 2018 and later:&nbsp;no refund</p>
        <p>Should you wish to cancel your registration, contact us in any case so that we can give your place to someone else.</p>
        <p><strong>Important</strong>: Illness and injury are included in the above-mentioned regulations.</p>
        <p>Should you be unable to&nbsp;participate at short notice, we will do our best to find a replacement from the waiting list. If we succeed, a refund might be possible. However, we cannot guarantee it. As a principle, the regulations apply.</p>
        <p>However, you are free to find your own replacement for workshop or party. Please let us know before check in, if you have passed your booking on to someone else. Nonetheless, you remain responsible for the payment of the booking fee.&nbsp;</p>
        <p><strong>Insurance: </strong>To be properly insured is the responsibility of the participant. We herewith decline any liability.</p>
      </td>
    </tr>
  </tbody>
</table>')

INSERT INTO dbo.MailTemplates(Id, EventId, [Type], ContentType, [Subject], SenderMail, SenderName, [Language], Template)
VALUES ('A07609C7-0715-4892-B0D0-E25F3460DDEC', '762A93A4-56E0-402C-B700-1CFB3362B39D', 13 /*DoubleRegistrationFirstPartnerOnWaitingList*/, 2, 'Partner registration received (waiting list)', 'noreply@leapinlindy.ch', 'Leapin'' Lindy', 'en', 
'<table cellspacing="0" cellpadding="0" align="center">
  <tbody>
    <tr>
      <td style="text-align: center;"><img src="https://scontent-frx5-1.xx.fbcdn.net/v/t31.0-8/22042178_1480177115410174_419267934679857047_o.jpg?oh=d6833f06299ceb688c53b8439413a696&amp;oe=5A7EF2E1" width="800" height="304" /></td>
    </tr>
    <tr>
      <td><br /><strong>Hello {{FirstName}}</strong><br />
        <p>Thank you for registering for Leapin'' Lindy 2018!<br /><strong>Your partner registration with {{Partner}} is on the waiting list, please don''t pay the fee yet.</strong></p>
        <p>The Leapin'' Lindy Team</p>
        <hr />
        <p>You booked the following:<br />{{SeatList}}</p>
        <table style="width: 800px;">
          <tbody>
            <tr>
              <td style="width: 160px;"><strong>Name</strong></td>
              <td style="width: 640px;">{{FirstName}} {{LastName}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Place of Residence</strong></td>
              <td style="width: 640px;">{{City}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Phone</strong></td>
              <td style="width: 640px;">{{Phone}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Volunteer</strong></td>
              <td style="width: 640px;">{{Volunteer}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Reduction</strong></td>
              <td style="width: 640px;">{{Reduction}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Comments</strong></td>
              <td style="width: 640px;">{{Comments}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Terms</strong></td>
              <td style="width: 640px;">{{AcceptTerms}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Price</strong></td>
              <td style="width: 640px;">CHF{{Price}}</td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
  </tbody>
</table>');


INSERT INTO dbo.MailTemplates(Id, EventId, [Type], ContentType, [Subject], SenderMail, SenderName, [Language], Template)
VALUES ('698ECAC6-8E95-496C-8531-3BD096B1BFE9', '762A93A4-56E0-402C-B700-1CFB3362B39D', 14 /*DoubleRegistrationMatchedOnWaitingList*/, 2, 'Partner registration received (waiting list)', 'noreply@leapinlindy.ch', 'Leapin'' Lindy', 'en', 
'<table cellspacing="0" cellpadding="0" align="center">
  <tbody>
    <tr>
      <td style="text-align: center;"><img src="https://scontent-frx5-1.xx.fbcdn.net/v/t31.0-8/22042178_1480177115410174_419267934679857047_o.jpg?oh=d6833f06299ceb688c53b8439413a696&amp;oe=5A7EF2E1" width="800" height="304" /></td>
    </tr>
    <tr>
      <td><br /><strong>Hello {{Follower.FirstName}} &amp; {{Leader.FirstName}}</strong><br />
        <p>Thank you for your partner registration for Leapin'' Lindy 2018!<br /><strong>Your partner registration is on the waiting list, please don''t pay the fee yet.</strong></p>
        <p>The Leapin'' Lindy Team</p>
        <hr />
        <p>You booked the following:<br /><br />Leader:<br />{{Leader.SeatList}}</p>
        <table style="width: 800px;">
          <tbody>
            <tr>
              <td style="width: 160px;"><strong>Name</strong></td>
              <td style="width: 640px;">{{Leader.FirstName}} {{Leader.LastName}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Place of Residence</strong></td>
              <td style="width: 640px;">{{Leader.City}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Phone</strong></td>
              <td style="width: 640px;">{{Leader.Phone}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Volunteer</strong></td>
              <td style="width: 640px;">{{Leader.Volunteer}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Reduction</strong></td>
              <td style="width: 640px;">{{Leader.Reduction}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Comments</strong></td>
              <td style="width: 640px;">{{Leader.Comments}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Terms</strong></td>
              <td style="width: 640px;">{{Leader.AcceptTerms}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Price</strong></td>
              <td style="width: 640px;">CHF{{Leader.Price}}</td>
            </tr>
          </tbody>
        </table>
        <p>&nbsp;Follower:<br />{{Follower.SeatList}}</p>
        <table style="width: 800px;">
          <tbody>
            <tr>
              <td style="width: 160px;"><strong>Name</strong></td>
              <td style="width: 640px;">{{Follower.FirstName}} {{Follower.LastName}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Place of Residence</strong></td>
              <td style="width: 640px;">{{Follower.City}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Phone</strong></td>
              <td style="width: 640px;">{{Follower.Phone}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Volunteer</strong></td>
              <td style="width: 640px;">{{Follower.Volunteer}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Reduction</strong></td>
              <td style="width: 640px;">{{Follower.Reduction}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Comments</strong></td>
              <td style="width: 640px;">{{Follower.Comments}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Terms</strong></td>
              <td style="width: 640px;">{{Follower.AcceptTerms}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Price</strong></td>
              <td style="width: 640px;">CHF{{Follower.Price}}</td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
  </tbody>
</table>');


INSERT INTO dbo.MailTemplates(Id, EventId, [Type], ContentType, [Subject], SenderMail, SenderName, [Language], Template)
VALUES ('C41D025A-84A2-4590-8974-867D8027B490', '762A93A4-56E0-402C-B700-1CFB3362B39D', 21 /*SoldOut*/, 2, 'Sold out', 'noreply@leapinlindy.ch', 'Leapin'' Lindy', 'en', 
'<table cellspacing="0" cellpadding="0" align="center">
  <tbody>
    <tr>
      <td style="text-align: center;"><img src="https://scontent-frx5-1.xx.fbcdn.net/v/t31.0-8/22042178_1480177115410174_419267934679857047_o.jpg?oh=d6833f06299ceb688c53b8439413a696&amp;oe=5A7EF2E1" width="800" height="304" /></td>
    </tr>
    <tr>
      <td><br /><strong>Hello {{FirstName}}</strong><br />
        <p>Unfortunately the options you asked for are sold out.<br />We hope to to see you next time!</p>
        <p>The Leapin'' Lindy Team</p>
        <hr />
        <p>{{SeatList}}</p>
        <table style="width: 800px;">
          <tbody>
            <tr>
              <td style="width: 160px;"><strong>Name</strong></td>
              <td style="width: 640px;">{{FirstName}} {{LastName}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Place of Residence</strong></td>
              <td style="width: 640px;">{{City}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Phone</strong></td>
              <td style="width: 640px;">{{Phone}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Comments</strong></td>
              <td style="width: 640px;">{{Comments}}</td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
  </tbody>
</table>');


INSERT INTO dbo.MailTemplates(Id, EventId, [Type], ContentType, [Subject], SenderMail, SenderName, [Language], Template)
VALUES ('2ACB5061-6936-4BD9-8AC6-1905A4E86EE9', '762A93A4-56E0-402C-B700-1CFB3362B39D', 31 /*RegistrationCancelled*/, 2, 'Booking cancelled', 'registration@leapinlindy.ch', 'Leapin'' Lindy', 'en', 
'<table cellspacing="0" cellpadding="0" align="center">
  <tbody>
    <tr>
      <td style="text-align: center;"><img src="https://scontent-frx5-1.xx.fbcdn.net/v/t31.0-8/22042178_1480177115410174_419267934679857047_o.jpg?oh=d6833f06299ceb688c53b8439413a696&amp;oe=5A7EF2E1" width="800" height="304" /></td>
    </tr>
    <tr>
      <td><br /><strong>Hello {{FirstName}}</strong><br />
        <p>We have cancelled your registration for Leapin'' Lindy 2018. Reason: {{CancellationReason}}</p>
        <p>The Leapin'' Lindy Team</p>
      </td>
    </tr>
  </tbody>
</table>');


INSERT INTO dbo.MailTemplates(Id, EventId, [Type], ContentType, [Subject], SenderMail, SenderName, [Language], Template)
VALUES ('CDCBA09B-84D2-4B58-A54C-ECF9F7497667', '762A93A4-56E0-402C-B700-1CFB3362B39D', 41 /*FullyPaid*/, 2, 'Booking confirmation', 'noreply@leapinlindy.ch', 'Leapin'' Lindy', 'en', 
'<table cellspacing="0" cellpadding="0" align="center">
  <tbody>
    <tr>
      <td style="text-align: center;"><img src="https://scontent-frx5-1.xx.fbcdn.net/v/t31.0-8/22042178_1480177115410174_419267934679857047_o.jpg?oh=d6833f06299ceb688c53b8439413a696&amp;oe=5A7EF2E1" width="800" height="304" /></td>
    </tr>
    <tr>
      <td><br /><strong>Hello {{FirstName}}</strong><br />
        <p>We have received your payment and confirm your booking for Leapin'' Lindy 2018.<br />We are looking forward to welcoming you in February!</p>
        <p>Have a look at the Leapin'' Lindy-App&nbsp;<a href="https://lineupr.com/ll18/leapin-lindy-2018">https://lineupr.com/ll18/leapin-lindy-2018</a></p>
        <p>The Leapin'' Lindy Team</p>
      </td>
    </tr>
  </tbody>
</table>');


INSERT INTO dbo.MailTemplates(Id, EventId, [Type], ContentType, [Subject], SenderMail, SenderName, [Language], Template)
VALUES ('BA2076AB-39AA-4687-AEFF-E55846213B82', '762A93A4-56E0-402C-B700-1CFB3362B39D', 42 /*PartnerRegistrationFirstPaid*/, 2, 'First payment received', 'noreply@leapinlindy.ch', 'Leapin'' Lindy', 'en', 
'<table cellspacing="0" cellpadding="0" align="center">
  <tbody>
    <tr>
      <td style="text-align: center;"><img src="https://scontent-frx5-1.xx.fbcdn.net/v/t31.0-8/22042178_1480177115410174_419267934679857047_o.jpg?oh=d6833f06299ceb688c53b8439413a696&amp;oe=5A7EF2E1" width="800" height="304" /></td>
    </tr>
    <tr>
      <td><br /><strong>Hello {{Follower.FirstName}} &amp; {{Leader.FirstName}}</strong><br />
        <p>We have received the first payment; as soon as we get the second one we''ll confirm your booking.</p>
        <p>The Leapin'' Lindy Team</p>
        <hr />
        <p>Leader:<br />{{Leader.SeatList}}</p>
        <table style="width: 800px;">
          <tbody>
            <tr>
              <td style="width: 160px;"><strong>Name</strong></td>
              <td style="width: 640px;">{{Leader.FirstName}} {{Leader.LastName}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Price</strong></td>
              <td style="width: 640px;">CHF{{Leader.Price}}, paid CHF{{Leader.PaidAmount}}</td>
            </tr>
          </tbody>
        </table>
        <p>&nbsp;Follower:<br />{{Follower.SeatList}}</p>
        <table style="width: 800px;">
          <tbody>
            <tr>
              <td style="width: 160px;"><strong>Name</strong></td>
              <td style="width: 640px;">{{Follower.FirstName}} {{Follower.LastName}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Price</strong></td>
              <td style="width: 640px;">CHF{{Follower.Price}}, paid CHF{{Follower.PaidAmount}}</td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
  </tbody>
</table>');


INSERT INTO dbo.MailTemplates(Id, EventId, [Type], ContentType, [Subject], SenderMail, SenderName, [Language], Template)
VALUES ('3BFC9A79-3FAF-4C41-BDE4-CF22CE97D4AC', '762A93A4-56E0-402C-B700-1CFB3362B39D', 43 /*PartnerRegistrationFullyPaid*/, 2, 'Booking confirmation', 'noreply@leapinlindy.ch', 'Leapin'' Lindy', 'en', 
'<table cellspacing="0" cellpadding="0" align="center">
  <tbody>
    <tr>
      <td style="text-align: center;"><img src="https://scontent-frx5-1.xx.fbcdn.net/v/t31.0-8/22042178_1480177115410174_419267934679857047_o.jpg?oh=d6833f06299ceb688c53b8439413a696&amp;oe=5A7EF2E1" width="800" height="304" /></td>
    </tr>
    <tr>
      <td><br /><strong>Hello {{Follower.FirstName}} &amp; {{Leader.FirstName}}</strong><br />
        <p>We have received your payments and confirm your booking for Leapin'' Lindy 2018.<br />We are looking forward to welcoming you in February!</p>
        <p>Have a look at the Leapin'' Lindy-App:&nbsp;<a href="https://lineupr.com/ll18/leapin-lindy-2018">https://lineupr.com/ll18/leapin-lindy-2018</a></p>
        <p>The Leapin'' Lindy Team</p>
      </td>
    </tr>
  </tbody>
</table>');


INSERT INTO dbo.MailTemplates(Id, EventId, [Type], ContentType, [Subject], SenderMail, SenderName, [Language], Template)
VALUES ('1F59CBFE-8986-4760-97BF-5D0E89B0A43E', '762A93A4-56E0-402C-B700-1CFB3362B39D', 51 /*SingleRegistrationFirstReminder*/, 2, 'Zahlungserinnerung', 'registration@leapinlindy.ch', 'Leapin'' Lindy', 'de', 
'<table cellspacing="0" cellpadding="0" align="center">
  <tbody>
    <tr>
      <td style="text-align: center;"><img src="https://scontent-frx5-1.xx.fbcdn.net/v/t31.0-8/22042178_1480177115410174_419267934679857047_o.jpg?oh=d6833f06299ceb688c53b8439413a696&amp;oe=5A7EF2E1" width="800" height="304" /></td>
    </tr>
    <tr>
      <td><br /><strong>Hallo {{FirstName}}</strong><br />
        <p>Du hast dich f&uuml;rs Leapin'' Lindy angemeldet und am {{AcceptedDate}} eine Anmeldebest&auml;tigung mit der Bitte erhalten, innert 5 Tage die Anmeldegeb&uuml;hr zu &uuml;berweisen. Leider konnten wir bis heute keinen Zahlungseingang von dir feststellen. Bitte hole das so schnell wie m&ouml;glich nach!</p>
        <p>Falls du nicht teilnehmen m&ouml;chtest, melde dich bitte unter <a href="mailto:registration@leapinlindy.ch">registration@leapinlindy.ch</a>&nbsp;ab. Dann k&ouml;nnen wir deinen Platz ohne weitere Verz&ouml;gerung jemandem auf der Warteliste freigeben.</p>
        <p>Falls du bezahlt hast, bitte sende eine Zahlungsbest&auml;tigung an <a href="mailto:registration@leapinlindy.ch">registration@leapinlindy.ch</a>.</p>
        <p>Das Leapin'' Lindy Team</p>
        <hr />
        <p>Du hast folgendes gebucht:<br />{{SeatList}}</p>
        <table style="width: 826px;">
          <tbody>
            <tr>
              <td style="width: 130px;"><strong>Name</strong></td>
              <td style="width: 700px;">{{FirstName}} {{LastName}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Wohnort</strong></td>
              <td style="width: 700px;">{{City}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Telefon</strong></td>
              <td style="width: 700px;">{{Phone}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Helfereinsatz</strong></td>
              <td style="width: 700px;">{{Volunteer}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Erm&auml;ssigung</strong></td>
              <td style="width: 700px;">{{Reduction}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Bemerkung</strong></td>
              <td style="width: 700px;">{{Comments}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>AGBs</strong></td>
              <td style="width: 700px;">{{AcceptTerms}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Preis</strong></td>
              <td style="width: 700px;">CHF{{Price}}, bezahlt CHF{{PaidAmount}}</td>
            </tr>
          </tbody>
        </table>
        <p>&nbsp;</p>
      </td>
    </tr>
    <tr>
      <td><hr />
        <p>Zahlungsinformationen:</p>
        <p><strong>WICHTIG: Mache eine &Uuml;berweisung pro Anmeldung und vermerke&nbsp;deine&nbsp;Emailadresse!&nbsp;</strong></p>
        <p>Deine Zahlung muss innerhalb von 5 Arbeitstagen nach Erhalt dieser Email bei uns eintreffen. Wenn wir deine Zahlung erhalten haben, schicken wir dir eine Buchungsbest&auml;tigung. Bezahlst du nicht innerhalb der Frist, wird deine Registrierung m&ouml;glicherweise storniert. Bitte beachte die untenstehende Regelung bez&uuml;glich Absage und R&uuml;ckerstattung.</p>
        <p>Konto: 60-224741-6<br />Swing Machine Bern / Leapin Lindy<br />3000 Bern&nbsp;</p>
        <p>IBAN: CH93 0900 0000 6022 4741 6<br />BLZ: 09000<br />BIC: POFICHBEXXX</p>
        <p><strong>Bankadresse</strong><br />Swiss Post - PostFinance<br />Nordring 8<br />3030 Bern<br />Switzerland</p>
        <p>Bitte &uuml;berweise immer Schweizer Franken. Spesen zu Lasten des Absenders.&nbsp;</p>
        <p><strong>Absagen und R&uuml;ckerstattung:</strong><br />Wenn du deine Anmeldung zur&uuml;cknehmen musst, gelten folgende Regeln f&uuml;r die R&uuml;ckerstattungen:</p>
        <p>Absage bis zum 10. Januar 2018: volle R&uuml;ckerstattung<br />11. Januar - 31. Januar 2018: 50% R&uuml;ckerstattung<br />Februar 2018 und sp&auml;ter: keine R&uuml;ckerstattung&nbsp;</p>
        <p>Wenn du deine Anmeldung annulieren willst, kontaktiere uns in jedem Fall damit wir deinen Platz freigeben k&ouml;nnen.</p>
        <p><strong>WICHTIG</strong>: Krankheit und Verletzung sind in der obigen Regelung eingeschlossen.</p>
        <p>Kannst du kurzfristig nicht teilnehmen, werden wir versuchen, einen Ersatz auf der Warteliste zu finden. Gelingt uns dies, ist eine R&uuml;ckerstattung m&ouml;glich, aber nicht garantiert.<br />Im Grundsatz beh&auml;lt die Regelung G&uuml;ltigkeit.&nbsp;</p>
        <p>In jedem Falle steht es dir frei, selbst einen Ersatz f&uuml;r deinen Workshopplatz oder Partypass zu finden. Bitte kontaktiere uns vor dem Check-In, wenn du deine Anmeldung an eine andere&nbsp; Person &uuml;bertragen hast. Du bleibst aber weiterhin f&uuml;r die Zahlung des Kursgeledes verantwortlich.</p>
        <p><strong>Versicherung<br /></strong>Versicherung ist Sache der Teilnehmenden. Der Veranstalter lehnt jede Haftung ab.</p>
      </td>
    </tr>
  </tbody>
</table>');

INSERT INTO dbo.MailTemplates(Id, EventId, [Type], ContentType, [Subject], SenderMail, SenderName, [Language], Template)
VALUES ('C8469A4C-897A-46C0-B243-3FD28F0CA56B', '762A93A4-56E0-402C-B700-1CFB3362B39D', 61 /*DoubleRegistrationFirstReminder*/, 2, 'Zahlungserinnerung', 'registration@leapinlindy.ch', 'Leapin'' Lindy', 'de', 
'<table cellspacing="0" cellpadding="0" align="center">
  <tbody>
    <tr>
      <td style="text-align: center;"><img src="https://scontent-frx5-1.xx.fbcdn.net/v/t31.0-8/22042178_1480177115410174_419267934679857047_o.jpg?oh=d6833f06299ceb688c53b8439413a696&amp;oe=5A7EF2E1" width="800" height="304" /></td>
    </tr>
    <tr>
      <td><br /><strong>Hallo {{Follower.FirstName}} &amp; {{Leader.FirstName}}</strong><br />
        <p>Ihr habt euch&nbsp;f&uuml;rs Leapin'' Lindy angemeldet und am {{AcceptedDate}} eine Anmeldebest&auml;tigung mit der Bitte erhalten, innert 5 Tage die Anmeldegeb&uuml;hr zu &uuml;berweisen. Leider haben wir bis heute nicht den gesamten Betrag von euch erhalten. Bitte holt das so schnell wie m&ouml;glich nach!</p>
        <p>Falls ihr nicht teilnehmen m&ouml;chtet, meldet euch bitte unter&nbsp;<a href="mailto:registration@leapinlindy.ch">registration@leapinlindy.ch</a>&nbsp;ab. Dann k&ouml;nnen wir euren Pl&auml;tze ohne weitere Verz&ouml;gerung an T&auml;nzer&nbsp;auf der Warteliste freigeben.</p>
        <p>Falls ihr bezahlt habt, bitte sendet eine Zahlungsbest&auml;tigung an&nbsp;<a href="mailto:registration@leapinlindy.ch">registration@leapinlindy.ch</a>.</p>
        <p>Das Leapin'' Lindy Team</p>
        <hr />
        <p>Ihr habt folgendes gebucht:<br /><br />Leader:<br />{{Leader.SeatList}}</p>
        <table style="width: 474px;">
          <tbody>
            <tr>
              <td style="width: 130px;"><strong>Name</strong></td>
              <td style="width: 600px;">{{Leader.FirstName}} {{Leader.LastName}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Wohnort</strong></td>
              <td style="width: 600px;">{{Leader.City}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Telefon</strong></td>
              <td style="width: 600px;">{{Leader.Phone}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Helfereinsatz</strong></td>
              <td style="width: 600px;">{{Leader.Volunteer}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Erm&auml;ssigung</strong></td>
              <td style="width: 600px;">{{Leader.Reduction}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Bemerkung</strong></td>
              <td style="width: 600px;">{{Leader.Comments}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>AGBs</strong></td>
              <td style="width: 600px;">{{Leader.AcceptTerms}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Preis</strong></td>
              <td style="width: 600px;">{{Leader.Price}}, bezahlt CHF{{Leader.PaidAmount}}</td>
            </tr>
          </tbody>
        </table>
        <p>&nbsp;Follower:<br />{{Follower.SeatList}}</p>
        <table style="width: 474px;">
          <tbody>
            <tr>
              <td style="width: 130px;"><strong>Name</strong></td>
              <td style="width: 600px;">{{Follower.FirstName}} {{Follower.LastName}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Wohnort</strong></td>
              <td style="width: 600px;">{{Follower.City}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Telefon</strong></td>
              <td style="width: 600px;">{{Follower.Phone}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Helfereinsatz</strong></td>
              <td style="width: 600px;">{{Follower.Volunteer}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Erm&auml;ssigung</strong></td>
              <td style="width: 600px;">{{Follower.Reduction}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Bemerkung</strong></td>
              <td style="width: 600px;">{{Follower.Comments}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>AGBs</strong></td>
              <td style="width: 600px;">{{Follower.AcceptTerms}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Preis</strong></td>
              <td style="width: 600px;">{{Follower.Price}}, bezahlt CHF{{Follower.PaidAmount}}</td>
            </tr>
          </tbody>
        </table>
        <p>&nbsp;</p>
      </td>
    </tr>
    <tr>
      <td><hr />
        <p>Zahlungsinformationen:</p>
        <p><strong>WICHTIG: Mache eine &Uuml;berweisung pro Anmeldung und vermerke&nbsp;deine&nbsp;Emailadresse!&nbsp;</strong></p>
        <p>Deine Zahlung muss innerhalb von 5 Arbeitstagen nach Erhalt dieser Email bei uns eintreffen. Wenn wir deine Zahlung erhalten haben, schicken wir dir eine Buchungsbest&auml;tigung. Bezahlst du nicht innerhalb der Frist, wird deine Registrierung m&ouml;glicherweise storniert. Bitte beachte die untenstehende Regelung bez&uuml;glich Absage und R&uuml;ckerstattung.</p>
        <p>Konto: 60-224741-6<br />Swing Machine Bern / Leapin Lindy<br />3000 Bern&nbsp;</p>
        <p>IBAN: CH93 0900 0000 6022 4741 6<br />BLZ: 09000<br />BIC: POFICHBEXXX</p>
        <p><strong>Bankadresse</strong><br />Swiss Post - PostFinance<br />Nordring 8<br />3030 Bern<br />Switzerland</p>
        <p>Bitte &uuml;berweise immer Schweizer Franken. Spesen zu Lasten des Absenders.&nbsp;</p>
        <p><strong>Absagen und R&uuml;ckerstattung:</strong><br />Wenn du deine Anmeldung zur&uuml;cknehmen musst, gelten folgende Regeln f&uuml;r die R&uuml;ckerstattungen:</p>
        <p>Absage bis zum 10. Januar 2018: volle R&uuml;ckerstattung<br />11. Januar - 31. Januar 2018: 50% R&uuml;ckerstattung<br />Februar 2018 und sp&auml;ter: keine R&uuml;ckerstattung&nbsp;</p>
        <p>Wenn du deine Anmeldung annulieren willst, kontaktiere uns in jedem Fall damit wir deinen Platz freigeben k&ouml;nnen.</p>
        <p><strong>WICHTIG</strong>: Krankheit und Verletzung sind in der obigen Regelung eingeschlossen.</p>
        <p>Kannst du kurzfristig nicht teilnehmen, werden wir versuchen, einen Ersatz auf der Warteliste zu finden. Gelingt uns dies, ist eine R&uuml;ckerstattung m&ouml;glich, aber nicht garantiert. Im Grundsatz beh&auml;lt die Regelung G&uuml;ltigkeit.&nbsp;</p>
        <p>In jedem Falle steht es dir frei, selbst einen Ersatz f&uuml;r deinen Workshopplatz oder Partypass zu finden. Bitte kontaktiere uns vor dem Check-In, wenn du deine Anmeldung an eine andere&nbsp; Person &uuml;bertragen hast. Du bleibst aber weiterhin f&uuml;r die Zahlung des Kursgeledes verantwortlich.</p>
        <p><strong>Versicherung<br /></strong>Versicherung ist Sache der Teilnehmenden. Der Veranstalter lehnt jede Haftung ab.</p>
      </td>
    </tr>
  </tbody>
</table>');


INSERT INTO dbo.MailTemplates(Id, EventId, [Type], ContentType, [Subject], SenderMail, SenderName, [Language], Template)
VALUES ('07E5C5B9-5FD5-4D42-B2A8-0485FAF714AB', '762A93A4-56E0-402C-B700-1CFB3362B39D', 51 /*SingleRegistrationFirstReminder*/, 2, 'Payment reminder', 'registration@leapinlindy.ch', 'Leapin'' Lindy', 'en', 
'<table cellspacing="0" cellpadding="0" align="center">
  <tbody>
    <tr>
      <td style="text-align: center;"><img src="https://scontent-frx5-1.xx.fbcdn.net/v/t31.0-8/22042178_1480177115410174_419267934679857047_o.jpg?oh=d6833f06299ceb688c53b8439413a696&amp;oe=5A7EF2E1" width="800" height="304" /></td>
    </tr>
    <tr>
      <td><br /><strong>Hello {{FirstName}}</strong><br />
        <p>You''ve registered for Leapin'' Lindy and have received a&nbsp;registration confirmation the {{AcceptedDate}} with the request to pay within 5 days. Unfortunately we have not received the required amount yet from you. Please forward the payment as soon as possible!</p>
        <p>If you don''t want to take part anymore please cancel your registration by email to <a href="mailto:registration@leapinlindy.ch">registration@leapinlindy.ch</a>. We then can give your place to somebody on the waiting list without further delay.</p>
        <p>If you''ve paid, please send a confirmation of your payment to <a href="mailto:registration@leapinlindy.ch">registration@leapinlindy.ch</a>.</p>
        <p>The Leapin'' Lindy Team</p>
        <hr />
        <p>You booked the following:<br />{{SeatList}}</p>
        <table style="width: 800px;">
          <tbody>
            <tr>
              <td style="width: 160px;"><strong>Name</strong></td>
              <td style="width: 640px;">{{FirstName}} {{LastName}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Place of Residence</strong></td>
              <td style="width: 640px;">{{City}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Phone</strong></td>
              <td style="width: 640px;">{{Phone}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Volunteer</strong></td>
              <td style="width: 640px;">{{Volunteer}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Reduction</strong></td>
              <td style="width: 640px;">{{Reduction}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Comments</strong></td>
              <td style="width: 640px;">{{Comments}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Terms</strong></td>
              <td style="width: 640px;">{{AcceptTerms}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Price</strong></td>
              <td style="width: 640px;">CHF{{Price}}, paid CHF{{PaidAmount}}</td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
    <tr>
      <td><hr />
        <p>Payment information:</p>
        <p><strong>Please make one payment per person and quote your email address&nbsp;</strong></p>
        <p>Your payment has to reach us within 5 working days upon the receipt of this email. As soon as we have received your payment, we will send you a booking confirmation. Should we not receive your payment in time, your registration may be cancelled. Please note the regulations concerning cancellations as mentioned below.</p>
        <p>IBAN: CH93 0900 0000 6022 4741 6<br />BIC: POFICHBEXXX<br />BLZ: 09000<br />Account: 60-224741-6<br />Swing Machine Bern / Leapin Lindy<br />3000 Bern&nbsp;</p>
        <p><strong>Address of the Bank</strong><br />Swiss Post - PostFinance<br />Nordring 8<br />3030 Bern<br />Switzerland</p>
        <p>Please pay in Swiss Francs. Additional expenses on sender&rsquo;s account.</p>
        <p><strong>Cancellations and Refunds:</strong><br />If you have to withdraw your booking, the following regulations or refunding apply:</p>
        <p>Cancellations until the 10th January 2018:&nbsp;full refund<br />11th January 2018 - 31th Januar 2018: 50%&nbsp;refund<br />February 2018 and later:&nbsp;no refund</p>
        <p>Should you wish to cancel your registration, contact us in any case so that we can give your place to someone else.</p>
        <p><strong>Important</strong>: Illness and injury are included in the above-mentioned regulations.</p>
        <p>Should you be unable to&nbsp;participate at short notice, we will do our best to find a replacement from the waiting list. If we succeed, a refund might be possible. However, we cannot guarantee it. As a principle, the regulations apply.</p>
        <p>However, you are free to find your own replacement for workshop or party. Please let us know before check in, if you have passed your booking on to someone else. Nonetheless, you remain responsible for the payment of the booking fee.&nbsp;</p>
        <p><strong>Insurance: </strong>To be properly insured is the responsibility of the participant. We herewith decline any liability.</p>
      </td>
    </tr>
  </tbody>
</table>');


INSERT INTO dbo.MailTemplates(Id, EventId, [Type], ContentType, [Subject], SenderMail, SenderName, [Language], Template)
VALUES ('FE111223-B51A-472E-86CA-20A3332AC0AB', '762A93A4-56E0-402C-B700-1CFB3362B39D', 61 /*DoubleRegistrationFirstReminder*/, 2, 'Payment reminder', 'registration@leapinlindy.ch', 'Leapin'' Lindy', 'en', 
'<table cellspacing="0" cellpadding="0" align="center">
  <tbody>
    <tr>
      <td style="text-align: center;"><img src="https://scontent-frx5-1.xx.fbcdn.net/v/t31.0-8/22042178_1480177115410174_419267934679857047_o.jpg?oh=d6833f06299ceb688c53b8439413a696&amp;oe=5A7EF2E1" width="800" height="304" /></td>
    </tr>
    <tr>
      <td><br /><strong>Hello {{Follower.FirstName}} &amp; {{Leader.FirstName}}</strong><br />
        <p>You''ve registered for Leapin'' Lindy and have received a&nbsp;registration confirmation the {{AcceptedDate}} with the request&nbsp;to pay within 5 days. Unfortunately we have not received the required amount yet from you. Please forward the payment as soon as possible!</p>
        <p>If you don''t want to take part anymore please cancel your registration by email to&nbsp;<a href="mailto:registration@leapinlindy.ch">registration@leapinlindy.ch</a>. We then can give your place to somebody on the waiting list without further delay.</p>
        <p>If you''ve paid, please send a confirmation of your payment to&nbsp;<a href="mailto:registration@leapinlindy.ch">registration@leapinlindy.ch</a>.</p>
        <p>The Leapin'' Lindy Team</p>
        <hr />
        <p>You booked the following:<br /><br />Leader:<br />{{Leader.SeatList}}</p>
        <table style="width: 800px;">
          <tbody>
            <tr>
              <td style="width: 160px;"><strong>Name</strong></td>
              <td style="width: 640px;">{{Leader.FirstName}} {{Leader.LastName}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Place of Residence</strong></td>
              <td style="width: 640px;">{{Leader.City}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Phone</strong></td>
              <td style="width: 640px;">{{Leader.Phone}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Volunteer</strong></td>
              <td style="width: 640px;">{{Leader.Volunteer}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Reduction</strong></td>
              <td style="width: 640px;">{{Leader.Reduction}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Comments</strong></td>
              <td style="width: 640px;">{{Leader.Comments}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Terms</strong></td>
              <td style="width: 640px;">{{Leader.AcceptTerms}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Price</strong></td>
              <td style="width: 640px;">CHF{{Leader.Price}}, paid {{Leader.PaidAmount}}</td>
            </tr>
          </tbody>
        </table>
        <p>&nbsp;Follower:<br />{{Follower.SeatList}}</p>
        <table style="width: 800px;">
          <tbody>
            <tr>
              <td style="width: 160px;"><strong>Name</strong></td>
              <td style="width: 640px;">{{Follower.FirstName}} {{Follower.LastName}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Place of Residence</strong></td>
              <td style="width: 640px;">{{Follower.City}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Phone</strong></td>
              <td style="width: 640px;">{{Follower.Phone}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Volunteer</strong></td>
              <td style="width: 640px;">{{Follower.Volunteer}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Reduction</strong></td>
              <td style="width: 640px;">{{Follower.Reduction}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Comments</strong></td>
              <td style="width: 640px;">{{Follower.Comments}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Terms</strong></td>
              <td style="width: 640px;">{{Follower.AcceptTerms}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Price</strong></td>
              <td style="width: 640px;">CHF{{Follower.Price}}, paid {{Follower.PaidAmount}}</td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
    <tr>
      <td><hr />
        <p>Payment information:</p>
        <p><strong>Please make one payment per person and quote your email address&nbsp;</strong></p>
        <p>Your payment has to reach us within 5 working days upon the receipt of this email. As soon as we have received your payment, we will send you a booking confirmation. Should we not receive your payment in time, your registration may be cancelled. Please note the regulations concerning cancellations as mentioned below.</p>
        <p>IBAN: CH93 0900 0000 6022 4741 6<br />BIC: POFICHBEXXX<br />BLZ: 09000<br />Account: 60-224741-6<br />Swing Machine Bern / Leapin Lindy<br />3000 Bern&nbsp;</p>
        <p><strong>Address of the Bank</strong><br />Swiss Post - PostFinance<br />Nordring 8<br />3030 Bern<br />Switzerland</p>
        <p>Please pay in Swiss Francs. Additional expenses on sender&rsquo;s account.</p>
        <p><strong>Cancellations and Refunds:</strong><br />If you have to withdraw your booking, the following regulations or refunding apply:</p>
        <p>Cancellations until the 10th January 2018:&nbsp;full refund<br />11th January 2018 - 31th Januar 2018: 50%&nbsp;refund<br />February 2018 and later:&nbsp;no refund</p>
        <p>Should you wish to cancel your registration, contact us in any case so that we can give your place to someone else.</p>
        <p><strong>Important</strong>: Illness and injury are included in the above-mentioned regulations.</p>
        <p>Should you be unable to&nbsp;participate at short notice, we will do our best to find a replacement from the waiting list. If we succeed, a refund might be possible. However, we cannot guarantee it. As a principle, the regulations apply.</p>
        <p>However, you are free to find your own replacement for workshop or party. Please let us know before check in, if you have passed your booking on to someone else. Nonetheless, you remain responsible for the payment of the booking fee.&nbsp;</p>
        <p><strong>Insurance: </strong>To be properly insured is the responsibility of the participant. We herewith decline any liability.</p>
      </td>
    </tr>
  </tbody>
</table>');



INSERT INTO dbo.MailTemplates(Id, EventId, [Type], ContentType, [Subject], SenderMail, SenderName, [Language], Template)
VALUES ('8166687B-89ED-4FE5-9A1F-8A839037E3D4', '762A93A4-56E0-402C-B700-1CFB3362B39D', 52 /*SingleRegistrationSecondReminder*/, 2, 'Zahlungserinnerung - letzte Chance', 'registration@leapinlindy.ch', 'Leapin'' Lindy', 'de', 
'<table cellspacing="0" cellpadding="0" align="center">
  <tbody>
    <tr>
      <td style="text-align: center;"><img src="https://scontent-frx5-1.xx.fbcdn.net/v/t31.0-8/22042178_1480177115410174_419267934679857047_o.jpg?oh=d6833f06299ceb688c53b8439413a696&amp;oe=5A7EF2E1" width="800" height="304" /></td>
    </tr>
    <tr>
      <td><br /><strong>Hallo {{FirstName}}</strong><br />
        <p>Du hast dich f&uuml;rs Leapin'' Lindy 2018 angemeldet und am {{AcceptedDate}} eine Anmeldebest&auml;tigung mit der Bitte erhalten, innert 5 Tage die Anmeldegeb&uuml;hr zu &uuml;berweisen. Leider konnten wir bis heute keinen Zahlungseingang von dir feststellen - auch nach der Zahlungserinnerung am {{Reminder1Date}} noch nicht! Du hast nun eine letzte Chance, die Zahlung vorzunehmen. <strong>Wenn wir in den n&auml;chsten 4 Arbeitstagen keinen Zahlungseingang von dir feststellen k&ouml;nnen,&nbsp;nehmen wir an, dass du nicht mehr teilnehmen m&ouml;chtest</strong> und geben deinen Platz jemandem auf der Warteliste frei.</p>
        <p>Falls du nicht teilnehmen m&ouml;chtest, melde dich bitte unter <a href="mailto:registration@leapinlindy.ch">registration@leapinlindy.ch</a>&nbsp;ab. Dann k&ouml;nnen wir deinen Platz ohne weitere Verz&ouml;gerung jemandem auf der Warteliste freigeben.</p>
        <p>Falls du bezahlt hast, bitte sende eine Zahlungsbest&auml;tigung an <a href="mailto:registration@leapinlindy.ch">registration@leapinlindy.ch</a>.</p>
        <p>Das Leapin'' Lindy Team</p>
        <hr />
        <p>Du hast folgendes gebucht:<br />{{SeatList}}</p>
        <table style="width: 826px;">
          <tbody>
            <tr>
              <td style="width: 130px;"><strong>Name</strong></td>
              <td style="width: 700px;">{{FirstName}} {{LastName}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Wohnort</strong></td>
              <td style="width: 700px;">{{City}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Telefon</strong></td>
              <td style="width: 700px;">{{Phone}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Helfereinsatz</strong></td>
              <td style="width: 700px;">{{Volunteer}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Erm&auml;ssigung</strong></td>
              <td style="width: 700px;">{{Reduction}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Bemerkung</strong></td>
              <td style="width: 700px;">{{Comments}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>AGBs</strong></td>
              <td style="width: 700px;">{{AcceptTerms}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Preis</strong></td>
              <td style="width: 700px;">CHF{{Price}}, bezahlt CHF{{PaidAmount}}</td>
            </tr>
          </tbody>
        </table>
        <p>&nbsp;</p>
      </td>
    </tr>
    <tr>
      <td><hr />
        <p>Zahlungsinformationen:</p>
        <p><strong>WICHTIG: Mache eine &Uuml;berweisung pro Anmeldung und vermerke&nbsp;deine&nbsp;Emailadresse!&nbsp;</strong></p>
        <p>Deine Zahlung muss innerhalb von 5 Arbeitstagen nach Erhalt dieser Email bei uns eintreffen. Wenn wir deine Zahlung erhalten haben, schicken wir dir eine Buchungsbest&auml;tigung. Bezahlst du nicht innerhalb der Frist, wird deine Registrierung m&ouml;glicherweise storniert. Bitte beachte die untenstehende Regelung bez&uuml;glich Absage und R&uuml;ckerstattung.</p>
        <p>Konto: 60-224741-6<br />Swing Machine Bern / Leapin Lindy<br />3000 Bern&nbsp;</p>
        <p>IBAN: CH93 0900 0000 6022 4741 6<br />BLZ: 09000<br />BIC: POFICHBEXXX</p>
        <p><strong>Bankadresse</strong><br />Swiss Post - PostFinance<br />Nordring 8<br />3030 Bern<br />Switzerland</p>
        <p>Bitte &uuml;berweise immer Schweizer Franken. Spesen zu Lasten des Absenders.&nbsp;</p>
        <p><strong>Absagen und R&uuml;ckerstattung:</strong><br />Wenn du deine Anmeldung zur&uuml;cknehmen musst, gelten folgende Regeln f&uuml;r die R&uuml;ckerstattungen:</p>
        <p>Absage bis zum 10. Januar 2018: volle R&uuml;ckerstattung<br />11. Januar - 31. Januar 2018: 50% R&uuml;ckerstattung<br />Februar 2018 und sp&auml;ter: keine R&uuml;ckerstattung&nbsp;</p>
        <p>Wenn du deine Anmeldung annulieren willst, kontaktiere uns in jedem Fall damit wir deinen Platz freigeben k&ouml;nnen.</p>
        <p><strong>WICHTIG</strong>: Krankheit und Verletzung sind in der obigen Regelung eingeschlossen.</p>
        <p>Kannst du kurzfristig nicht teilnehmen, werden wir versuchen, einen Ersatz auf der Warteliste zu finden. Gelingt uns dies, ist eine R&uuml;ckerstattung m&ouml;glich, aber nicht garantiert.<br />Im Grundsatz beh&auml;lt die Regelung G&uuml;ltigkeit.&nbsp;</p>
        <p>In jedem Falle steht es dir frei, selbst einen Ersatz f&uuml;r deinen Workshopplatz oder Partypass zu finden. Bitte kontaktiere uns vor dem Check-In, wenn du deine Anmeldung an eine andere&nbsp; Person &uuml;bertragen hast. Du bleibst aber weiterhin f&uuml;r die Zahlung des Kursgeledes verantwortlich.</p>
        <p><strong>Versicherung<br /></strong>Versicherung ist Sache der Teilnehmenden. Der Veranstalter lehnt jede Haftung ab.</p>
      </td>
    </tr>
  </tbody>
</table>');

INSERT INTO dbo.MailTemplates(Id, EventId, [Type], ContentType, [Subject], SenderMail, SenderName, [Language], Template)
VALUES ('F79029E6-87BA-4F22-95D9-823FACE6EC6F', '762A93A4-56E0-402C-B700-1CFB3362B39D', 62 /*DoubleRegistrationSecondReminder*/, 2, 'Zahlungserinnerung - letzte Chance', 'registration@leapinlindy.ch', 'Leapin'' Lindy', 'de', 
'<table cellspacing="0" cellpadding="0" align="center">
  <tbody>
    <tr>
      <td style="text-align: center;"><img src="https://scontent-frx5-1.xx.fbcdn.net/v/t31.0-8/22042178_1480177115410174_419267934679857047_o.jpg?oh=d6833f06299ceb688c53b8439413a696&amp;oe=5A7EF2E1" width="800" height="304" /></td>
    </tr>
    <tr>
      <td><br /><strong>Hallo {{Follower.FirstName}} &amp; {{Leader.FirstName}}</strong><br />
        <p>Ihr habt euch&nbsp;f&uuml;rs Leapin'' Lindy angemeldet und am {{AcceptedDate}} eine Anmeldebest&auml;tigung mit der Bitte erhalten, innert 5 Tage die Anmeldegeb&uuml;hr zu &uuml;berweisen. Leider haben wir bis heute nicht den gesamten Betrag von euch erhalten - auch nach der Zahlungserinnerung am {{Reminder1Date}} noch nicht!&nbsp;Ihr habt&nbsp;nun eine letzte Chance, die Zahlung vorzunehmen.&nbsp;<strong>Wenn wir in den n&auml;chsten 4 Arbeitstagen keinen Zahlungseingang von euch feststellen k&ouml;nnen,&nbsp;nehmen&nbsp;wir&nbsp;an, dass ihr nicht mehr teilnehmen m&ouml;chtet</strong>&nbsp;und geben euren Platz T&auml;nzern auf der Warteliste frei.</p>
        <p>Falls ihr nicht teilnehmen m&ouml;chtet, meldet euch bitte unter&nbsp;<a href="mailto:registration@leapinlindy.ch">registration@leapinlindy.ch</a>&nbsp;ab. Dann k&ouml;nnen wir euren Pl&auml;tze ohne weitere Verz&ouml;gerung an T&auml;nzer&nbsp;auf der Warteliste freigeben.</p>
        <p>Falls ihr bezahlt habt, bitte sendet eine Zahlungsbest&auml;tigung an&nbsp;<a href="mailto:registration@leapinlindy.ch">registration@leapinlindy.ch</a>.</p>
        <p>Das Leapin'' Lindy Team</p>
        <hr />
        <p>Ihr habt folgendes gebucht:<br /><br />Leader:<br />{{Leader.SeatList}}</p>
        <table style="width: 474px;">
          <tbody>
            <tr>
              <td style="width: 130px;"><strong>Name</strong></td>
              <td style="width: 600px;">{{Leader.FirstName}} {{Leader.LastName}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Wohnort</strong></td>
              <td style="width: 600px;">{{Leader.City}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Telefon</strong></td>
              <td style="width: 600px;">{{Leader.Phone}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Helfereinsatz</strong></td>
              <td style="width: 600px;">{{Leader.Volunteer}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Erm&auml;ssigung</strong></td>
              <td style="width: 600px;">{{Leader.Reduction}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Bemerkung</strong></td>
              <td style="width: 600px;">{{Leader.Comments}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>AGBs</strong></td>
              <td style="width: 600px;">{{Leader.AcceptTerms}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Preis</strong></td>
              <td style="width: 600px;">{{Leader.Price}}, bezahlt CHF{{Leader.PaidAmount}}</td>
            </tr>
          </tbody>
        </table>
        <p>&nbsp;Follower:<br />{{Follower.SeatList}}</p>
        <table style="width: 474px;">
          <tbody>
            <tr>
              <td style="width: 130px;"><strong>Name</strong></td>
              <td style="width: 600px;">{{Follower.FirstName}} {{Follower.LastName}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Wohnort</strong></td>
              <td style="width: 600px;">{{Follower.City}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Telefon</strong></td>
              <td style="width: 600px;">{{Follower.Phone}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Helfereinsatz</strong></td>
              <td style="width: 600px;">{{Follower.Volunteer}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Erm&auml;ssigung</strong></td>
              <td style="width: 600px;">{{Follower.Reduction}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Bemerkung</strong></td>
              <td style="width: 600px;">{{Follower.Comments}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>AGBs</strong></td>
              <td style="width: 600px;">{{Follower.AcceptTerms}}</td>
            </tr>
            <tr>
              <td style="width: 130px;"><strong>Preis</strong></td>
              <td style="width: 600px;">{{Follower.Price}}, bezahlt CHF{{Follower.PaidAmount}}</td>
            </tr>
          </tbody>
        </table>
        <p>&nbsp;</p>
      </td>
    </tr>
    <tr>
      <td><hr />
        <p>Zahlungsinformationen:</p>
        <p><strong>WICHTIG: Mache eine &Uuml;berweisung pro Anmeldung und vermerke&nbsp;deine&nbsp;Emailadresse!&nbsp;</strong></p>
        <p>Deine Zahlung muss innerhalb von 5 Arbeitstagen nach Erhalt dieser Email bei uns eintreffen. Wenn wir deine Zahlung erhalten haben, schicken wir dir eine Buchungsbest&auml;tigung. Bezahlst du nicht innerhalb der Frist, wird deine Registrierung m&ouml;glicherweise storniert. Bitte beachte die untenstehende Regelung bez&uuml;glich Absage und R&uuml;ckerstattung.</p>
        <p>Konto: 60-224741-6<br />Swing Machine Bern / Leapin Lindy<br />3000 Bern&nbsp;</p>
        <p>IBAN: CH93 0900 0000 6022 4741 6<br />BLZ: 09000<br />BIC: POFICHBEXXX</p>
        <p><strong>Bankadresse</strong><br />Swiss Post - PostFinance<br />Nordring 8<br />3030 Bern<br />Switzerland</p>
        <p>Bitte &uuml;berweise immer Schweizer Franken. Spesen zu Lasten des Absenders.&nbsp;</p>
        <p><strong>Absagen und R&uuml;ckerstattung:</strong><br />Wenn du deine Anmeldung zur&uuml;cknehmen musst, gelten folgende Regeln f&uuml;r die R&uuml;ckerstattungen:</p>
        <p>Absage bis zum 10. Januar 2018: volle R&uuml;ckerstattung<br />11. Januar - 31. Januar 2018: 50% R&uuml;ckerstattung<br />Februar 2018 und sp&auml;ter: keine R&uuml;ckerstattung&nbsp;</p>
        <p>Wenn du deine Anmeldung annulieren willst, kontaktiere uns in jedem Fall damit wir deinen Platz freigeben k&ouml;nnen.</p>
        <p><strong>WICHTIG</strong>: Krankheit und Verletzung sind in der obigen Regelung eingeschlossen.</p>
        <p>Kannst du kurzfristig nicht teilnehmen, werden wir versuchen, einen Ersatz auf der Warteliste zu finden. Gelingt uns dies, ist eine R&uuml;ckerstattung m&ouml;glich, aber nicht garantiert. Im Grundsatz beh&auml;lt die Regelung G&uuml;ltigkeit.&nbsp;</p>
        <p>In jedem Falle steht es dir frei, selbst einen Ersatz f&uuml;r deinen Workshopplatz oder Partypass zu finden. Bitte kontaktiere uns vor dem Check-In, wenn du deine Anmeldung an eine andere&nbsp; Person &uuml;bertragen hast. Du bleibst aber weiterhin f&uuml;r die Zahlung des Kursgeledes verantwortlich.</p>
        <p><strong>Versicherung<br /></strong>Versicherung ist Sache der Teilnehmenden. Der Veranstalter lehnt jede Haftung ab.</p>
      </td>
    </tr>
  </tbody>
</table>');


INSERT INTO dbo.MailTemplates(Id, EventId, [Type], ContentType, [Subject], SenderMail, SenderName, [Language], Template)
VALUES ('A2FCC46F-2C40-4327-B5C8-7D66E186A1CB', '762A93A4-56E0-402C-B700-1CFB3362B39D', 52 /*SingleRegistrationSecondReminder*/, 2, 'Payment reminder - last chance', 'registration@leapinlindy.ch', 'Leapin'' Lindy', 'en', 
'<table cellspacing="0" cellpadding="0" align="center">
  <tbody>
    <tr>
      <td style="text-align: center;"><img src="https://scontent-frx5-1.xx.fbcdn.net/v/t31.0-8/22042178_1480177115410174_419267934679857047_o.jpg?oh=d6833f06299ceb688c53b8439413a696&amp;oe=5A7EF2E1" width="800" height="304" /></td>
    </tr>
    <tr>
      <td><br /><strong>Hello {{Follower.FirstName}} &amp; {{Leader.FirstName}}</strong><br />
        <p>You''ve registered for Leapin'' Lindy and have received a&nbsp;registration confirmation the {{AcceptedDate}} with the request&nbsp;to pay within 5 days. Unfortunately we have not received the required amount yet from you&nbsp;- even after the reminder the {{Reminder1Date}}.&nbsp;You now have one last chance to make the payment.&nbsp;<strong>If we&nbsp;don''t receive&nbsp;any payment from you in the next 4 working days</strong>, we assume that you don''t want to participate any more and give your places to people on the waiting list.</p>
        <p>If you don''t want to take part anymore please cancel your registration by email to&nbsp;<a href="mailto:registration@leapinlindy.ch">registration@leapinlindy.ch</a>. We then can give your places to people on the waiting list without further delay.</p>
        <p>If you''ve paid, please send a confirmation of your payment to&nbsp;<a href="mailto:registration@leapinlindy.ch">registration@leapinlindy.ch</a>.</p>
        <p>The Leapin'' Lindy Team</p>
        <hr />
        <p>You booked the following:<br /><br />Leader:<br />{{Leader.SeatList}}</p>
        <table style="width: 800px;">
          <tbody>
            <tr>
              <td style="width: 160px;"><strong>Name</strong></td>
              <td style="width: 640px;">{{Leader.FirstName}} {{Leader.LastName}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Place of Residence</strong></td>
              <td style="width: 640px;">{{Leader.City}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Phone</strong></td>
              <td style="width: 640px;">{{Leader.Phone}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Volunteer</strong></td>
              <td style="width: 640px;">{{Leader.Volunteer}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Reduction</strong></td>
              <td style="width: 640px;">{{Leader.Reduction}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Comments</strong></td>
              <td style="width: 640px;">{{Leader.Comments}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Terms</strong></td>
              <td style="width: 640px;">{{Leader.AcceptTerms}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Price</strong></td>
              <td style="width: 640px;">CHF{{Leader.Price}}, paid {{Leader.PaidAmount}}</td>
            </tr>
          </tbody>
        </table>
        <p>&nbsp;Follower:<br />{{Follower.SeatList}}</p>
        <table style="width: 800px;">
          <tbody>
            <tr>
              <td style="width: 160px;"><strong>Name</strong></td>
              <td style="width: 640px;">{{Follower.FirstName}} {{Follower.LastName}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Place of Residence</strong></td>
              <td style="width: 640px;">{{Follower.City}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Phone</strong></td>
              <td style="width: 640px;">{{Follower.Phone}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Volunteer</strong></td>
              <td style="width: 640px;">{{Follower.Volunteer}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Reduction</strong></td>
              <td style="width: 640px;">{{Follower.Reduction}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Comments</strong></td>
              <td style="width: 640px;">{{Follower.Comments}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Terms</strong></td>
              <td style="width: 640px;">{{Follower.AcceptTerms}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Price</strong></td>
              <td style="width: 640px;">CHF{{Follower.Price}}, paid {{Follower.PaidAmount}}</td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
    <tr>
      <td><hr />
        <p>Payment information:</p>
        <p><strong>Please make one payment per person and quote your email address&nbsp;</strong></p>
        <p>Your payment has to reach us within 5 working days upon the receipt of this email. As soon as we have received your payment, we will send you a booking confirmation. Should we not receive your payment in time, your registration may be cancelled. Please note the regulations concerning cancellations as mentioned below.</p>
        <p>IBAN: CH93 0900 0000 6022 4741 6<br />BIC: POFICHBEXXX<br />BLZ: 09000<br />Account: 60-224741-6<br />Swing Machine Bern / Leapin Lindy<br />3000 Bern&nbsp;</p>
        <p><strong>Address of the Bank</strong><br />Swiss Post - PostFinance<br />Nordring 8<br />3030 Bern<br />Switzerland</p>
        <p>Please pay in Swiss Francs. Additional expenses on sender&rsquo;s account.</p>
        <p><strong>Cancellations and Refunds:</strong><br />If you have to withdraw your booking, the following regulations or refunding apply:</p>
        <p>Cancellations until the 10th January 2018:&nbsp;full refund<br />11th January 2018 - 31th Januar 2018: 50%&nbsp;refund<br />February 2018 and later:&nbsp;no refund</p>
        <p>Should you wish to cancel your registration, contact us in any case so that we can give your place to someone else.</p>
        <p><strong>Important</strong>: Illness and injury are included in the above-mentioned regulations.</p>
        <p>Should you be unable to&nbsp;participate at short notice, we will do our best to find a replacement from the waiting list. If we succeed, a refund might be possible. However, we cannot guarantee it. As a principle, the regulations apply.</p>
        <p>However, you are free to find your own replacement for workshop or party. Please let us know before check in, if you have passed your booking on to someone else. Nonetheless, you remain responsible for the payment of the booking fee.&nbsp;</p>
        <p><strong>Insurance: </strong>To be properly insured is the responsibility of the participant. We herewith decline any liability.</p>
      </td>
    </tr>
  </tbody>
</table>');


INSERT INTO dbo.MailTemplates(Id, EventId, [Type], ContentType, [Subject], SenderMail, SenderName, [Language], Template)
VALUES ('4547E41C-0F61-41F2-8CB2-9F81A01FBB02', '762A93A4-56E0-402C-B700-1CFB3362B39D', 62 /*DoubleRegistrationSecondReminder*/, 2, 'Payment reminder - last chance', 'registration@leapinlindy.ch', 'Leapin'' Lindy', 'en', 
'<table cellspacing="0" cellpadding="0" align="center">
  <tbody>
    <tr>
      <td style="text-align: center;"><img src="https://scontent-frx5-1.xx.fbcdn.net/v/t31.0-8/22042178_1480177115410174_419267934679857047_o.jpg?oh=d6833f06299ceb688c53b8439413a696&amp;oe=5A7EF2E1" width="800" height="304" /></td>
    </tr>
    <tr>
      <td><br /><strong>Hello {{FirstName}}</strong><br />
        <p>You''ve registered for Leapin'' Lindy and have received a&nbsp;registration confirmation the {{AcceptedDate}} with the request to pay within 5 days. Unfortunately we have not received the required amount yet from you - even after the reminder the {{Reminder1Date}}. You now have one last chance to make the payment. <strong>If we don''t receive any payment from you in the next 4 working days</strong>, we assume that you don''t want to participate any more and give your place to someone else on the waiting list.</p>
        <p>If you don''t want to take part anymore please cancel your registration by email to <a href="mailto:registration@leapinlindy.ch">registration@leapinlindy.ch</a>. We then can give your place to somebody on the waiting list without further delay.</p>
        <p>If you''ve paid, please send a confirmation of your payment to <a href="mailto:registration@leapinlindy.ch">registration@leapinlindy.ch</a>.</p>
        <p>The Leapin'' Lindy Team</p>
        <hr />
        <p>You booked the following:<br />{{SeatList}}</p>
        <table style="width: 800px;">
          <tbody>
            <tr>
              <td style="width: 160px;"><strong>Name</strong></td>
              <td style="width: 640px;">{{FirstName}} {{LastName}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Place of Residence</strong></td>
              <td style="width: 640px;">{{City}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Phone</strong></td>
              <td style="width: 640px;">{{Phone}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Volunteer</strong></td>
              <td style="width: 640px;">{{Volunteer}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Reduction</strong></td>
              <td style="width: 640px;">{{Reduction}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Comments</strong></td>
              <td style="width: 640px;">{{Comments}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Terms</strong></td>
              <td style="width: 640px;">{{AcceptTerms}}</td>
            </tr>
            <tr>
              <td style="width: 160px;"><strong>Price</strong></td>
              <td style="width: 640px;">CHF{{Price}}, paid CHF{{PaidAmount}}</td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
    <tr>
      <td><hr />
        <p>Payment information:</p>
        <p><strong>Please make one payment per person and quote your email address&nbsp;</strong></p>
        <p>Your payment has to reach us within 5 working days upon the receipt of this email. As soon as we have received your payment, we will send you a booking confirmation. Should we not receive your payment in time, your registration may be cancelled. Please note the regulations concerning cancellations as mentioned below.</p>
        <p>IBAN: CH93 0900 0000 6022 4741 6<br />BIC: POFICHBEXXX<br />BLZ: 09000<br />Account: 60-224741-6<br />Swing Machine Bern / Leapin Lindy<br />3000 Bern&nbsp;</p>
        <p><strong>Address of the Bank</strong><br />Swiss Post - PostFinance<br />Nordring 8<br />3030 Bern<br />Switzerland</p>
        <p>Please pay in Swiss Francs. Additional expenses on sender&rsquo;s account.</p>
        <p><strong>Cancellations and Refunds:</strong><br />If you have to withdraw your booking, the following regulations or refunding apply:</p>
        <p>Cancellations until the 10th January 2018:&nbsp;full refund<br />11th January 2018 - 31th Januar 2018: 50%&nbsp;refund<br />February 2018 and later:&nbsp;no refund</p>
        <p>Should you wish to cancel your registration, contact us in any case so that we can give your place to someone else.</p>
        <p><strong>Important</strong>: Illness and injury are included in the above-mentioned regulations.</p>
        <p>Should you be unable to&nbsp;participate at short notice, we will do our best to find a replacement from the waiting list. If we succeed, a refund might be possible. However, we cannot guarantee it. As a principle, the regulations apply.</p>
        <p>However, you are free to find your own replacement for workshop or party. Please let us know before check in, if you have passed your booking on to someone else. Nonetheless, you remain responsible for the payment of the booking fee.&nbsp;</p>
        <p><strong>Insurance: </strong>To be properly insured is the responsibility of the participant. We herewith decline any liability.</p>
      </td>
    </tr>
  </tbody>
</table>');



INSERT INTO dbo.MailTemplates(Id, EventId, [Type], ContentType, [Subject], SenderMail, SenderName, [Language], Template)
VALUES ('FBD3DE7D-4502-4584-810B-A7D0D268F45A', 101 /*OptionsForRegistrationsOnWaitingList*/, 2, 'Warteliste - holt mich hier raus', 'registration@leapinlindy.ch', 'Leapin'' Lindy', 'de', 
'<table cellspacing="0" cellpadding="0" align="center">
  <tbody>
    <tr>
      <td style="text-align: center;"><img src="https://scontent-frx5-1.xx.fbcdn.net/v/t31.0-8/22042178_1480177115410174_419267934679857047_o.jpg?oh=d6833f06299ceb688c53b8439413a696&amp;oe=5A7EF2E1" width="800" height="304" /></td>
    </tr>
    <tr>
      <td><br /><strong>Hallo {{FirstName}}</strong><br />
        <p>Du bekommst dieses Mail, weil du auf der Warteliste f&uuml;rs Leapin'' Lindy 2018 bist. Vielleicht ist dir bereits aufgefallen, dass der Party Pass ausverkauft ist. Aufgrund des Wechsels in das National ist der Platz leider begrenzt und wir werden voraussichtlich auch keine Abendkasse anbieten k&ouml;nnen.</p>
        <p>Selbstverst&auml;ndlich haben wir aber unsere Freunde auf der Warteliste nicht vergessen. F&uuml;r dich gibt es drei M&ouml;glichkeiten am Leapin'' Lindy 2018 teilzunehmen:&nbsp;</p>
        <ol>
          <li>Es gibt noch einige freie Pl&auml;tze in beiden Solo Jazz Levels. Wenn du dich dazu entscheidest dorthin zu wechseln, bist du nat&uuml;rlich an den Partys auch mit dabei.</li>
          <li>Es gibt noch einige freie Pl&auml;tze im Level Advanced/Advanced+ (Achtung: das Niveau wird hoch sein). Wenn du dich dazu entscheidest dich da anzumelden, bist du an den Partys selbstverst&auml;ndlich auch mit dabei.</li>
          <li>Wenn du lieber nur an die Partys kommst, kannst du uns das mitteilen. Falls du bis am 1. Februar nicht in den Kurs nachr&uuml;ckst, buchen wir deinen Platz auf der Warteliste in einen Party Pass um.</li>
        </ol>
        <p>Damit wir planen k&ouml;nnen, bitten wir dich, uns <strong>innerhalb von&nbsp;5 Tagen</strong>&nbsp;per Antwort auf diese Email mitzuteilen,&nbsp;f&uuml;r welche der drei Optionen du dich entscheidest. Falls wir keine Antwort erhalten, bleibst du zwar auf der Warteliste, erh&auml;ltst aber keinen Party Pass.</p>
        <p>Swingende Gr&uuml;sse,<br />Dein Leapin'' Lindy Team</p>
      </td>
    </tr>
  </tbody>
</table>');

INSERT INTO dbo.MailTemplates(Id, EventId, [Type], ContentType, [Subject], SenderMail, SenderName, [Language], Template)
VALUES ('35EBF6A3-FB12-4812-B0D1-3175F328DD53', 101 /*OptionsForRegistrationsOnWaitingList*/, 2, 'Waiting List - get me out of here', 'registration@leapinlindy.ch', 'Leapin'' Lindy', 'en', 
'<table cellspacing="0" cellpadding="0" align="center">
  <tbody>
    <tr>
      <td style="text-align: center;"><img src="https://scontent-frx5-1.xx.fbcdn.net/v/t31.0-8/22042178_1480177115410174_419267934679857047_o.jpg?oh=d6833f06299ceb688c53b8439413a696&amp;oe=5A7EF2E1" width="800" height="304" /></td>
    </tr>
    <tr>
      <td><br /><strong>Hi {{FirstName}}</strong><br />
        <p>You get this mail because you are on the waiting list for Leapin'' Lindy 2018. You might have noticed that the Party Pass is sold out. Due to the change of venue to the National, the&nbsp;space is unfortunately limited and we will probably not be able to offer a box office.</p>
        <p>Of course, we didn''t forget our friends on the waiting list. There are three ways for you to participate in Leapin'' Lindy 2018:&nbsp;</p>
        <ol>
          <li>There are still spots available for the both Authentic Jazz tracks. If you register for this track the party pass is included.</li>
          <li>There are still spots available for Lindy Hop Advanced and Advanced + levels, although you must have the level.</li>
          <li>If you''d rather just come to the parties, let us know. If you do not move up until&nbsp;the 1st February, we will provide a party pass for you.</li>
        </ol>
        <p>To be able to plan, we ask you to let us know <strong>within 5 days</strong>&nbsp;which of the three options you chose by answering this email. If we don''t get an answer, you will stay on the waiting list, but you won''t get a Party Pass.</p>
        <p>Swing Out,<br />Your Leapin&rsquo; Lindy Team</p>
      </td>
    </tr>
  </tbody>
</table>');

--commit
--rollback