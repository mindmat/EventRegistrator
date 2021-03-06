select Price, ASS.Summe, LastMail, Subject, *
from Registrations REG
  LEFT JOIN (SELECT RegistrationId, Summe = SUM(Amount)
             FROM dbo.PaymentAssignments 
		     GROUP BY RegistrationId) ASS ON ASS.RegistrationId = REG.Id
  LEFT JOIN (SELECT MAP.RegistrationID, LastMail = MAX(MAI.Created), Subject = MAX(MAI.Subject)
             FROM dbo.Mails MAI
			   INNER JOIN dbo.MailToRegistrations MAP ON MAP.MailId = MAI.ID
			 GROUP BY MAP.RegistrationId) MAIL ON MAIL.RegistrationId = REG.Id
where IsWaitingList = 0
  and State = 1
order by MAIL.LastMail

select ausstehend = sum(price), Anzahl = count(*)
from Registrations
where IsWaitingList = 0
  and State = 1

select bezahlt = sum(ass.Amount), Anzahl = count(distinct reg.id)
from Registrations reg
  inner join dbo.PaymentAssignments ass on ass.RegistrationId = reg.Id
where IsWaitingList = 0
  and State <> 4

select sum(Amount-isnull(repaid,0))
from ReceivedPayments


SELECT diff = (PMT.Amount - pmt.Repaid) - MAP.Summe, Zahlung = PMT.Amount, Zugeordnet = MAP.Summe, MAP.Preis, MAP.State, *
FROM ReceivedPayments PMT
  LEFT JOIN (SELECT ReceivedPaymentId, Summe = SUM(Amount), Preis = MAX(REG.Price), State = MIN(REG.State)
             FROM PaymentAssignments ASS
			   INNER JOIN Registrations REG ON REG.Id = ASS.RegistrationId and REG.State <> 4
			 GROUP BY ReceivedPaymentId) MAP ON MAP.ReceivedPaymentId = PMT.Id
WHERE (PMT.Amount - pmt.Repaid) <> MAP.Summe
  
  --OR RecognizedEmail IS NULL


