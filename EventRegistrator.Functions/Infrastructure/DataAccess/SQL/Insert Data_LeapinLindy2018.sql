﻿BEGIN TRAN

DELETE FROM Registrables
DELETE FROM Reductions
DELETE FROM QuestionOptionToRegistrableMappings

INSERT INTO [dbo].[Registrables]([Id], [EventId], [Name], [MaximumSingleSeats], [MaximumDoubleSeats], MaximumAllowedImbalance, ShowInMailListOrder, Price)
     VALUES('118A9B4F-D14E-4FD4-9E1C-A6771416E088', '762A93A4-56E0-402C-B700-1CFB3362B39D', 'Lindy Hop Beginner Intermediate', NULL, 33,   3,    1,    270),
           ('2DBF19B6-6DBD-4050-AC4B-683B9BBA9A98', '762A93A4-56E0-402C-B700-1CFB3362B39D', 'Lindy Hop Intermediate',          NULL, 33,   3,    1,    270),
           ('9310B016-D70F-4EB1-8F04-57412132F4A8', '762A93A4-56E0-402C-B700-1CFB3362B39D', 'Lindy Hop Intermediate Advanced', NULL, 33,   3,    1,    270),
           ('373E0514-2F5F-4499-990A-A130B9D38142', '762A93A4-56E0-402C-B700-1CFB3362B39D', 'Lindy Hop Advanced/Advanced+',    NULL, 66,   5,    1,    270),

           ('0488F651-A8B7-4369-8918-31EBABF7763B', '762A93A4-56E0-402C-B700-1CFB3362B39D', 'Solo Jazz Intermediate',          40,   NULL, NULL, 2,    190),
           ('57DE8C38-09EB-47EC-8697-A8D700CBDA44', '762A93A4-56E0-402C-B700-1CFB3362B39D', 'Solo Jazz Advanced',              40,   NULL, NULL, 2,    190),

           ('CC695010-41F4-4B6B-B4E5-32294284EDB5', '762A93A4-56E0-402C-B700-1CFB3362B39D', 'Solo Friday',                     NULL, NULL, NULL, 3,    50),

           ('8720326D-D055-4E65-A1F9-A8CA14510652', '762A93A4-56E0-402C-B700-1CFB3362B39D', 'Mittagessen Fleisch Samstag',     NULL, NULL, NULL, 4,    10),
           ('B6A69D4B-9FB8-4E6B-89E5-4BCFEA0EAC31', '762A93A4-56E0-402C-B700-1CFB3362B39D', 'Mittagessen Vegi Samstag',        NULL, NULL, NULL, 4,    10),
           ('60E2A4B1-5577-4499-B3FC-B202FC360F2B', '762A93A4-56E0-402C-B700-1CFB3362B39D', 'Mittagessen Salatbar Samstag',    NULL, NULL, NULL, 4,    10),

           ('A60092D1-AA11-4466-8DB8-BBAED948244B', '762A93A4-56E0-402C-B700-1CFB3362B39D', 'Mittagessen Fleisch Sonntag',     NULL, NULL, NULL, 5,    10),
           ('58B75D14-C274-42E5-9122-003E383F6BCB', '762A93A4-56E0-402C-B700-1CFB3362B39D', 'Mittagessen Vegi Sonntag',        NULL, NULL, NULL, 5,    10),
           ('98E9780E-8B27-4186-8BE7-75ECD164D957', '762A93A4-56E0-402C-B700-1CFB3362B39D', 'Mittagessen Salatbar Sonntag',    NULL, NULL, NULL, 5,    10),

           ('A425D0FD-DAF0-4783-8AE9-10029076063E', '762A93A4-56E0-402C-B700-1CFB3362B39D', 'Party Donnerstag',                60,   NULL, NULL, 6,    17),
           ('88F013C5-5915-4513-98CE-E58D4DB9875E', '762A93A4-56E0-402C-B700-1CFB3362B39D', 'Party Freitag',                   60,   NULL, NULL, 7,    40),
           ('C202D212-E69E-44DB-81AF-09045CD5E13B', '762A93A4-56E0-402C-B700-1CFB3362B39D', 'Party Samstag',                   60,   NULL, NULL, 8,    40),

           ('1746CC39-7C95-4D03-B1BF-D599689B7B6A', '762A93A4-56E0-402C-B700-1CFB3362B39D', 'Bietet Hosting',                  NULL, NULL, NULL, NULL, NULL),
           ('EE10CE23-8219-44DF-9F2A-4FDEC3DE1867', '762A93A4-56E0-402C-B700-1CFB3362B39D', 'Sucht Hosting',                   NULL, NULL, NULL, NULL, NULL),

           ('16371CE3-8316-49E3-B791-AD38B03BD859', '762A93A4-56E0-402C-B700-1CFB3362B39D', 'Helfereinsatz',                   NULL, NULL, NULL, NULL, NULL)

INSERT INTO dbo.Reductions(Id, RegistrableId, RegistrableId1_ReductionActivatedIfCombinedWith, RegistrableId2_ReductionActivatedIfCombinedWith, QuestionOptionId_ActivatesReduction, Amount)
  VALUES -- Ermässigung
         --- Lindy Hop
         (NEWID(), '118A9B4F-D14E-4FD4-9E1C-A6771416E088', NULL, NULL, 'AA1242D7-6AAB-4E37-A379-CD61900DEA9B', 20),
         (NEWID(), '2DBF19B6-6DBD-4050-AC4B-683B9BBA9A98', NULL, NULL, 'AA1242D7-6AAB-4E37-A379-CD61900DEA9B', 20),
         (NEWID(), '9310B016-D70F-4EB1-8F04-57412132F4A8', NULL, NULL, 'AA1242D7-6AAB-4E37-A379-CD61900DEA9B', 20),
         (NEWID(), '373E0514-2F5F-4499-990A-A130B9D38142', NULL, NULL, 'AA1242D7-6AAB-4E37-A379-CD61900DEA9B', 20),

		 --- Solo Jazz
         (NEWID(), '0488F651-A8B7-4369-8918-31EBABF7763B', NULL, NULL, 'AA1242D7-6AAB-4E37-A379-CD61900DEA9B', 20),
         (NEWID(), '57DE8C38-09EB-47EC-8697-A8D700CBDA44', NULL, NULL, 'AA1242D7-6AAB-4E37-A379-CD61900DEA9B', 20),

		 --- Parties
         (NEWID(), '88F013C5-5915-4513-98CE-E58D4DB9875E', NULL, NULL, 'AA1242D7-6AAB-4E37-A379-CD61900DEA9B',  5),
         (NEWID(), 'C202D212-E69E-44DB-81AF-09045CD5E13B', NULL, NULL, 'AA1242D7-6AAB-4E37-A379-CD61900DEA9B',  5),

         -- Full Pass (Workshop & Solo Jazz)
         (NEWID(), '118A9B4F-D14E-4FD4-9E1C-A6771416E088', 'CC695010-41F4-4B6B-B4E5-32294284EDB5', NULL, NULL,  20),
         (NEWID(), '2DBF19B6-6DBD-4050-AC4B-683B9BBA9A98', 'CC695010-41F4-4B6B-B4E5-32294284EDB5', NULL, NULL,  20),
         (NEWID(), '9310B016-D70F-4EB1-8F04-57412132F4A8', 'CC695010-41F4-4B6B-B4E5-32294284EDB5', NULL, NULL,  20),
         (NEWID(), '373E0514-2F5F-4499-990A-A130B9D38142', 'CC695010-41F4-4B6B-B4E5-32294284EDB5', NULL, NULL,  20),

         (NEWID(), '0488F651-A8B7-4369-8918-31EBABF7763B', 'CC695010-41F4-4B6B-B4E5-32294284EDB5', NULL, NULL,  20),
         (NEWID(), '57DE8C38-09EB-47EC-8697-A8D700CBDA44', 'CC695010-41F4-4B6B-B4E5-32294284EDB5', NULL, NULL,  20),

		 -- Party Pass
         (NEWID(), '88F013C5-5915-4513-98CE-E58D4DB9875E', 'C202D212-E69E-44DB-81AF-09045CD5E13B', 'A425D0FD-DAF0-4783-8AE9-10029076063E', 'AA1242D7-6AAB-4E37-A379-CD61900DEA9B',  27)

INSERT INTO [dbo].[QuestionOptionToRegistrableMappings](Id, RegistrableId, QuestionOptionId, QuestionId_PartnerEmail, QuestionOptionId_Leader, QuestionOptionId_Follower)
  VALUES -- Lindy Hop Workshop
         (NEWID(), '118A9B4F-D14E-4FD4-9E1C-A6771416E088', '6CC551CC-E8D0-43A5-AA6A-937CEB611D41', 'B96DFED0-5D10-4EA1-AFAA-0F2E164FE4A5', '20ABE66F-9EAF-475E-9021-2C455055E6E1', '1562A341-FA98-4F27-A02F-E60207BC800D'),
         (NEWID(), '2DBF19B6-6DBD-4050-AC4B-683B9BBA9A98', '9CC93D82-0D28-4A9D-8921-77935DD3B145', 'B96DFED0-5D10-4EA1-AFAA-0F2E164FE4A5', '20ABE66F-9EAF-475E-9021-2C455055E6E1', '1562A341-FA98-4F27-A02F-E60207BC800D'),
         (NEWID(), '9310B016-D70F-4EB1-8F04-57412132F4A8', 'EE307BC1-67A4-4574-A1E7-997AF010A5A0', 'B96DFED0-5D10-4EA1-AFAA-0F2E164FE4A5', '20ABE66F-9EAF-475E-9021-2C455055E6E1', '1562A341-FA98-4F27-A02F-E60207BC800D'),
         (NEWID(), '373E0514-2F5F-4499-990A-A130B9D38142', '30D30F2B-42B4-4A8C-9287-55C0D8350E90', 'B96DFED0-5D10-4EA1-AFAA-0F2E164FE4A5', '20ABE66F-9EAF-475E-9021-2C455055E6E1', '1562A341-FA98-4F27-A02F-E60207BC800D'),
         
         -- Solo Jazz Workshop
         (NEWID(), '0488F651-A8B7-4369-8918-31EBABF7763B', '7BBB7580-1108-4503-A357-DE038D458058', NULL, NULL, NULL),
         (NEWID(), '57DE8C38-09EB-47EC-8697-A8D700CBDA44', '43BD5FEA-A45C-458A-A54E-F345C89D7009', NULL, NULL, NULL),
         
         -- Solo Friday
         (NEWID(), 'CC695010-41F4-4B6B-B4E5-32294284EDB5', '6336F8BB-EE33-4F9B-BC94-F2141EBEBE6D', NULL, NULL, NULL),
         (NEWID(), 'CC695010-41F4-4B6B-B4E5-32294284EDB5', '9B8B71D7-73F3-4580-B49E-8E47A9E06CB5', NULL, NULL, NULL),
         (NEWID(), 'CC695010-41F4-4B6B-B4E5-32294284EDB5', '3B2B7CAE-265E-48FA-8B24-9211CFB3EC95', NULL, NULL, NULL),
         
         -- Essen
		 --- Samstag
         (NEWID(), '8720326D-D055-4E65-A1F9-A8CA14510652', '08D2FA25-319E-4504-874E-DFCA4C4B3ED7', NULL, NULL, NULL),
         (NEWID(), '8720326D-D055-4E65-A1F9-A8CA14510652', '1EA9FB43-7099-445F-8325-AFB17A058A20', NULL, NULL, NULL),
         (NEWID(), 'B6A69D4B-9FB8-4E6B-89E5-4BCFEA0EAC31', 'EC75EDA3-894A-42BE-AE6F-822B39B21244', NULL, NULL, NULL),
         (NEWID(), 'B6A69D4B-9FB8-4E6B-89E5-4BCFEA0EAC31', '736BFC12-A40B-4A5A-9C83-BDA55C52FB88', NULL, NULL, NULL),
         (NEWID(), '60E2A4B1-5577-4499-B3FC-B202FC360F2B', '13EF8261-6847-40D6-9346-D817658C9397', NULL, NULL, NULL),
         (NEWID(), '60E2A4B1-5577-4499-B3FC-B202FC360F2B', '43FA0FEB-C58E-434B-8B7C-A869A87D2C79', NULL, NULL, NULL),

		 --- Sonntag
         (NEWID(), 'A60092D1-AA11-4466-8DB8-BBAED948244B', '19CF3B34-DAFA-47BB-8B6B-1A35673C5296', NULL, NULL, NULL),
         (NEWID(), 'A60092D1-AA11-4466-8DB8-BBAED948244B', '0D0D6197-474A-483F-B035-6019B2B82A4D', NULL, NULL, NULL),
         (NEWID(), '58B75D14-C274-42E5-9122-003E383F6BCB', '3ED56335-1479-400E-9864-04CE63798B57', NULL, NULL, NULL),
         (NEWID(), '58B75D14-C274-42E5-9122-003E383F6BCB', '6A563F68-57DD-4E9C-8BF2-AF828821F733', NULL, NULL, NULL),
         (NEWID(), '98E9780E-8B27-4186-8BE7-75ECD164D957', '74C3EC09-0E0D-4CE5-A7FE-821D5001160F', NULL, NULL, NULL),
         (NEWID(), '98E9780E-8B27-4186-8BE7-75ECD164D957', '65CF99D6-554E-4AC3-9571-7FD21AF2343C', NULL, NULL, NULL),
         
         -- Parties
		 --- Donnerstag
         (NEWID(), 'A425D0FD-DAF0-4783-8AE9-10029076063E', 'B64FC781-46E5-4FA1-B53E-BF153B83826F', NULL, NULL, NULL),
         (NEWID(), 'A425D0FD-DAF0-4783-8AE9-10029076063E', '3B2B7CAE-265E-48FA-8B24-9211CFB3EC95', NULL, NULL, NULL),
         (NEWID(), 'A425D0FD-DAF0-4783-8AE9-10029076063E', 'F0E33B02-EEB7-46D5-B98C-5329CCF43F55', NULL, NULL, NULL),

		 --- Freitag
         (NEWID(), '88F013C5-5915-4513-98CE-E58D4DB9875E', 'B64FC781-46E5-4FA1-B53E-BF153B83826F', NULL, NULL, NULL),
         (NEWID(), '88F013C5-5915-4513-98CE-E58D4DB9875E', '3B2B7CAE-265E-48FA-8B24-9211CFB3EC95', NULL, NULL, NULL),
         (NEWID(), '88F013C5-5915-4513-98CE-E58D4DB9875E', '69820841-65C0-42D9-A569-196A16470FF1', NULL, NULL, NULL),

		 --- Samstag
         (NEWID(), 'C202D212-E69E-44DB-81AF-09045CD5E13B', 'B64FC781-46E5-4FA1-B53E-BF153B83826F', NULL, NULL, NULL),
         (NEWID(), 'C202D212-E69E-44DB-81AF-09045CD5E13B', '3B2B7CAE-265E-48FA-8B24-9211CFB3EC95', NULL, NULL, NULL),
         (NEWID(), 'C202D212-E69E-44DB-81AF-09045CD5E13B', 'E4C10FAB-BD0C-46B6-883F-5CF3F9DAA03B', NULL, NULL, NULL),

         -- Hosting
         (NEWID(), '1746CC39-7C95-4D03-B1BF-D599689B7B6A', '0E311F67-FB0F-4241-936E-C8BE0BAB9EE0', NULL, NULL, NULL),
         (NEWID(), 'EE10CE23-8219-44DF-9F2A-4FDEC3DE1867', 'A2BAD46F-0512-437B-A2F8-FD3DF8739DEC', NULL, NULL, NULL),
         
         -- Helfereinsatz
         (NEWID(), '16371CE3-8316-49E3-B791-AD38B03BD859', '948F6AF3-1596-4715-90AB-CE64B89A0F51', NULL, NULL, NULL)



SELECT * FROM [Registrables]
SELECT * FROM [QuestionOptionToRegistrableMappings]
SELECT * FROM MailTemplates

/*
INSERT INTO Questions(Id,RegistrationFormId, ExternalId, [Index], Title, [Type], TemplateKey)
VALUES ('97E64CF7-C90A-42B3-B22F-00799A7D9D99', 'A64607FD-C7D3-4B49-A136-C8B900554CE5',  889980871, 12, 'Hosting',                                                              10, NULL),
       ('151BA324-DF83-4B96-862E-09D044527E31', 'A64607FD-C7D3-4B49-A136-C8B900554CE5', 1920996284, 14, 'Wieviele Plätze suchst du/bietest du an?',                             14, NULL),
       ('B96DFED0-5D10-4EA1-AFAA-0F2E164FE4A5', 'A64607FD-C7D3-4B49-A136-C8B900554CE5', 2076833470,  5, 'PartnerIn',                                                            14, NULL),
       ('C9765EF8-9982-45B8-8D1E-17A55DAC8630', 'A64607FD-C7D3-4B49-A136-C8B900554CE5',  804832609, 24, 'Bemerkung',                                                            11, 'Comments'),
       ('21428024-5148-4CE1-865D-2208565C514A', 'A64607FD-C7D3-4B49-A136-C8B900554CE5', 2133664923, 23, 'Ermässigung',                                                           1, 'Reduction'),
       ('A1E3A0C1-D20C-4982-BECB-339BC393D0D2', 'A64607FD-C7D3-4B49-A136-C8B900554CE5',  608838139,  2, 'Lindy Hop',                                                            10, NULL),
       ('A9AC2D64-3FD2-4CDB-9C97-3D2678D4C7D4', 'A64607FD-C7D3-4B49-A136-C8B900554CE5', 1899243752, 22, 'Möchtest du das Leapin'' Lindy mit einem Helfereinsatz unterstützen?',  9, 'Volunteer'),
       ('DC20E341-0C70-4586-82DC-3F1C68A0332D', 'A64607FD-C7D3-4B49-A136-C8B900554CE5', 1369312054,  8, 'Level',                                                                 9, NULL),
       ('E4D2134C-3715-480F-9AA5-3FA48B8DDE09', 'A64607FD-C7D3-4B49-A136-C8B900554CE5', 1255242239, 21, 'Telefon',                                                              14, 'Phone'),
       ('FFA094EB-4D86-4EDE-A38B-471642D0E89A', 'A64607FD-C7D3-4B49-A136-C8B900554CE5',  344556095, 10, 'Parties',                                                              10, NULL),
       ('F7D92B84-1585-4439-A7C4-4742BFD1DBD5', 'A64607FD-C7D3-4B49-A136-C8B900554CE5', 1143546962, 15, 'Name der Personen, die neben dir eine Privatunterkunft suchen',        11, NULL),
       ('72B20546-C4B1-4359-9EB5-49DD321E91E7', 'A64607FD-C7D3-4B49-A136-C8B900554CE5', 2089526903,  3, 'Level',                                                                 9, NULL),
       ('DDD3DBC1-A5C6-44C8-BDE1-58A07EDE65AD', 'A64607FD-C7D3-4B49-A136-C8B900554CE5',  470443258,  7, 'Solo Jazz',                                                            10, NULL),
       ('F0498AD3-10F7-47C1-B5E5-5E076DAD309E', 'A64607FD-C7D3-4B49-A136-C8B900554CE5',  879403399, 19, 'Vorname',                                                              14, 'FirstName'),
       ('0FD29EF5-ED63-44E1-B97B-7E8C98112CDE', 'A64607FD-C7D3-4B49-A136-C8B900554CE5', 2102833682, 11, 'Abende',                                                                1, NULL),
       ('728ED78D-FC07-4999-B495-A30B96FFBE16', 'A64607FD-C7D3-4B49-A136-C8B900554CE5', 1604925183,  4, 'Rolle',                                                                 9, 'LindyRole'),
       ('B02B82C9-416C-4F80-92CC-A46BBBF62831', 'A64607FD-C7D3-4B49-A136-C8B900554CE5',  950704349,  6, 'Mittagessen',                                                           9, 'Lunch'),
       ('A21BAD00-BF6E-4B60-8C26-A8518B33BA11', 'A64607FD-C7D3-4B49-A136-C8B900554CE5',  494424461,  1, 'Bist du am Solo Friday dabei?',                                         9, 'SoloFriday'),
       ('3F27FAB6-67D2-450D-8D74-B7005B2694C1', 'A64607FD-C7D3-4B49-A136-C8B900554CE5',  297145218,  0, 'Was möchtest du buchen?',                                               9, NULL),
       ('EC314126-6C0A-4A35-A66E-B7BF027824CA', 'A64607FD-C7D3-4B49-A136-C8B900554CE5',  801386634,  9, 'Mittagessen',                                                           9, 'Lunch'),
       ('5A4B6454-CF84-4765-9DB0-C06405F9E6B7', 'A64607FD-C7D3-4B49-A136-C8B900554CE5', 1368088649, 20, 'Wohnort',                                                              14, NULL),
       ('648DA814-1AAB-499A-A8C7-C184F7CC81BF', 'A64607FD-C7D3-4B49-A136-C8B900554CE5', 1755807979, 16, 'Anreise',                                                               1, NULL),
       ('B726121A-2B10-474E-AE94-C9B8049AB432', 'A64607FD-C7D3-4B49-A136-C8B900554CE5',  215264059, 18, 'Name',                                                                 14, 'LastName'),
       ('4E520EDE-5059-47D5-8884-DEEEC0A24498', 'A64607FD-C7D3-4B49-A136-C8B900554CE5', 1942708452, 17, 'Persönliche Angaben',                                                  10, NULL),
       ('95144651-99E4-45C9-870A-F4058DEDFF09', 'A64607FD-C7D3-4B49-A136-C8B900554CE5', 1684283454, 25, 'AGBs',                                                                  1, 'AcceptTerms'),
       ('54F64506-D9B9-4379-9CDB-F641DE6986A2', 'A64607FD-C7D3-4B49-A136-C8B900554CE5', 1059862823, 13, '',                                                                      9, NULL)
*/

ROLLBACK




-- COMMIT



/*
Events
Id	Name	RowVersion
762A93A4-56E0-402C-B700-1CFB3362B39D	Leapin' Lindy	0x00000000000008C0

RegistrationForm
Id	EventId	ExternalIdentifier	Title	State	RowVersion	QuestionId_FirstName
A64607FD-C7D3-4B49-A136-C8B900554CE5	762A93A4-56E0-402C-B700-1CFB3362B39D	16iRhJ95PhrN-dCMGy5E7Q13-blyUHv_2yY1BB4bOc04	Anmeldung Leapin' Lindy 2018	1	0x00000000000016E7	F0498AD3-10F7-47C1-B5E5-5E076DAD309E

Questions
Id	RegistrationFormId	ExternalId	Index	Title	Type	RowVersion
97E64CF7-C90A-42B3-B22F-00799A7D9D99	A64607FD-C7D3-4B49-A136-C8B900554CE5	889980871	12	Hosting	10	0x000000000000126A
151BA324-DF83-4B96-862E-09D044527E31	A64607FD-C7D3-4B49-A136-C8B900554CE5	1920996284	14	Wieviele Plätze suchst du/bietest du an?	14	0x0000000000001260
B96DFED0-5D10-4EA1-AFAA-0F2E164FE4A5	A64607FD-C7D3-4B49-A136-C8B900554CE5	2076833470	5	PartnerIn	14	0x0000000000001270
C9765EF8-9982-45B8-8D1E-17A55DAC8630	A64607FD-C7D3-4B49-A136-C8B900554CE5	804832609	24	Bemerkung	11	0x0000000000001271
21428024-5148-4CE1-865D-2208565C514A	A64607FD-C7D3-4B49-A136-C8B900554CE5	2133664923	23	Ermässigung	1	0x0000000000001261
A1E3A0C1-D20C-4982-BECB-339BC393D0D2	A64607FD-C7D3-4B49-A136-C8B900554CE5	608838139	2	Lindy Hop	10	0x000000000000126B
A9AC2D64-3FD2-4CDB-9C97-3D2678D4C7D4	A64607FD-C7D3-4B49-A136-C8B900554CE5	1899243752	22	Möchtest du das Leapin' Lindy mit einem Helfereinsatz unterstützen?	9	0x000000000000126D
DC20E341-0C70-4586-82DC-3F1C68A0332D	A64607FD-C7D3-4B49-A136-C8B900554CE5	1369312054	8	Level	9	0x0000000000001272
E4D2134C-3715-480F-9AA5-3FA48B8DDE09	A64607FD-C7D3-4B49-A136-C8B900554CE5	1255242239	21	Telefon	14	0x0000000000001274
FFA094EB-4D86-4EDE-A38B-471642D0E89A	A64607FD-C7D3-4B49-A136-C8B900554CE5	344556095	10	Parties	10	0x0000000000001278
F7D92B84-1585-4439-A7C4-4742BFD1DBD5	A64607FD-C7D3-4B49-A136-C8B900554CE5	1143546962	15	Name der Personen, die neben dir eine Privatunterkunft suchen	11	0x0000000000001277
72B20546-C4B1-4359-9EB5-49DD321E91E7	A64607FD-C7D3-4B49-A136-C8B900554CE5	2089526903	3	Level	9	0x0000000000001268
DDD3DBC1-A5C6-44C8-BDE1-58A07EDE65AD	A64607FD-C7D3-4B49-A136-C8B900554CE5	470443258	7	Solo Jazz	10	0x0000000000001273
F0498AD3-10F7-47C1-B5E5-5E076DAD309E	A64607FD-C7D3-4B49-A136-C8B900554CE5	879403399	19	Vorname	14	0x0000000000001276
0FD29EF5-ED63-44E1-B97B-7E8C98112CDE	A64607FD-C7D3-4B49-A136-C8B900554CE5	2102833682	11	Abende	1	0x000000000000125F
728ED78D-FC07-4999-B495-A30B96FFBE16	A64607FD-C7D3-4B49-A136-C8B900554CE5	1604925183	4	Rolle	9	0x0000000000001267
B02B82C9-416C-4F80-92CC-A46BBBF62831	A64607FD-C7D3-4B49-A136-C8B900554CE5	950704349	6	Mittagessen	9	0x000000000000126E
A21BAD00-BF6E-4B60-8C26-A8518B33BA11	A64607FD-C7D3-4B49-A136-C8B900554CE5	494424461	1	Bist du am Solo Friday dabei?	9	0x000000000000126C
3F27FAB6-67D2-450D-8D74-B7005B2694C1	A64607FD-C7D3-4B49-A136-C8B900554CE5	297145218	0	Was möchtest du buchen?	9	0x0000000000001262
EC314126-6C0A-4A35-A66E-B7BF027824CA	A64607FD-C7D3-4B49-A136-C8B900554CE5	801386634	9	Mittagessen	9	0x0000000000001275
5A4B6454-CF84-4765-9DB0-C06405F9E6B7	A64607FD-C7D3-4B49-A136-C8B900554CE5	1368088649	20	Wohnort	14	0x0000000000001265
648DA814-1AAB-499A-A8C7-C184F7CC81BF	A64607FD-C7D3-4B49-A136-C8B900554CE5	1755807979	16	Anreise	1	0x0000000000001266
B726121A-2B10-474E-AE94-C9B8049AB432	A64607FD-C7D3-4B49-A136-C8B900554CE5	215264059	18	Name	14	0x000000000000126F
4E520EDE-5059-47D5-8884-DEEEC0A24498	A64607FD-C7D3-4B49-A136-C8B900554CE5	1942708452	17	Persönliche Angaben	10	0x0000000000001263
95144651-99E4-45C9-870A-F4058DEDFF09	A64607FD-C7D3-4B49-A136-C8B900554CE5	1684283454	25	AGBs	1	0x0000000000001269
54F64506-D9B9-4379-9CDB-F641DE6986A2	A64607FD-C7D3-4B49-A136-C8B900554CE5	1059862823	13		9	0x0000000000001264

QuestionOptions
Id	QuestionId	Answer	RowVersion
CA2035A3-437E-49A1-A0BC-0EF7C30D4527	72B20546-C4B1-4359-9EB5-49DD321E91E7	Advanced+ (Audition)	0x0000000000001291
69820841-65C0-42D9-A569-196A16470FF1	0FD29EF5-ED63-44E1-B97B-7E8C98112CDE	Freitag (40 CHF)	0x0000000000001286
20ABE66F-9EAF-475E-9021-2C455055E6E1	728ED78D-FC07-4999-B495-A30B96FFBE16	Leader	0x000000000000127C
2BCF038C-25AD-498F-9BC8-2E88B226D997	A21BAD00-BF6E-4B60-8C26-A8518B33BA11	Nein	0x000000000000127E
54DA45AE-3F9C-4DBC-8D85-39ADA67CD9D6	A21BAD00-BF6E-4B60-8C26-A8518B33BA11	Ja (30 CHF)	0x0000000000001283
F2B1594D-ACE5-491D-8D26-3EB886467621	95144651-99E4-45C9-870A-F4058DEDFF09	Ich habe die AGBs (leapinlindy.ch/?page_id=753) gelesen und akzeptiere sie	0x0000000000001296
F1746343-DEFF-489C-9F26-431B389FD632	EC314126-6C0A-4A35-A66E-B7BF027824CA	Ich möchte ein Mittagessen mit Fleisch (10 CHF)	0x0000000000001295
5DB4C490-636C-426B-AB31-4FFC9AA886F7	648DA814-1AAB-499A-A8C7-C184F7CC81BF	Ich reise mit dem Auto an	0x0000000000001285
F0E33B02-EEB7-46D5-B98C-5329CCF43F55	0FD29EF5-ED63-44E1-B97B-7E8C98112CDE	Donnerstag (17 CHF)	0x0000000000001294
30D30F2B-42B4-4A8C-9287-55C0D8350E90	72B20546-C4B1-4359-9EB5-49DD321E91E7	Advanced (Audition)	0x000000000000127F
E4C10FAB-BD0C-46B6-883F-5CF3F9DAA03B	0FD29EF5-ED63-44E1-B97B-7E8C98112CDE	Samstag (40 CHF)	0x0000000000001292
2459C5E1-F548-4F81-A789-5FA308D469DC	B02B82C9-416C-4F80-92CC-A46BBBF62831	Ich möchte ein Mittagessen ohne Fleisch (10 CHF)	0x000000000000127D
3699095E-FC05-4B1E-BE20-696C4F025007	3F27FAB6-67D2-450D-8D74-B7005B2694C1	Lindy Hop Workshop (270 CHF)	0x0000000000001281
9CC93D82-0D28-4A9D-8921-77935DD3B145	72B20546-C4B1-4359-9EB5-49DD321E91E7	Intermediate	0x000000000000128A
104901EC-0756-4F07-BECC-8796A57E6E4F	54F64506-D9B9-4379-9CDB-F641DE6986A2	Weder noch	0x000000000000127A
6CC551CC-E8D0-43A5-AA6A-937CEB611D41	72B20546-C4B1-4359-9EB5-49DD321E91E7	Beginner Intermediate	0x0000000000001287
EE307BC1-67A4-4574-A1E7-997AF010A5A0	72B20546-C4B1-4359-9EB5-49DD321E91E7	Intermediate Advanced	0x0000000000001293
B4493769-2876-4A68-B1D4-B53E80791177	3F27FAB6-67D2-450D-8D74-B7005B2694C1	Ich will nur an die Parties!	0x000000000000128E
0E311F67-FB0F-4241-936E-C8BE0BAB9EE0	54F64506-D9B9-4379-9CDB-F641DE6986A2	Ich biete eine Privatunterkunft	0x0000000000001279
5DA1475C-CA29-4103-9434-C9AB98AC6C94	A9AC2D64-3FD2-4CDB-9C97-3D2678D4C7D4	Kein Interesse	0x0000000000001284
AA139C77-D8E2-4A87-BA6F-CC43B6B2C7C5	B02B82C9-416C-4F80-92CC-A46BBBF62831	Ich möchte ein Mittagessen mit Fleisch (10 CHF)	0x000000000000128D
AA1242D7-6AAB-4E37-A379-CD61900DEA9B	21428024-5148-4CE1-865D-2208565C514A	Ich habe Anspruch auf Ermässigung (SchülerInnen, Studierende, AHV, KulturLegi)	0x000000000000128C
948F6AF3-1596-4715-90AB-CE64B89A0F51	A9AC2D64-3FD2-4CDB-9C97-3D2678D4C7D4	Ja klar!	0x0000000000001289
C30139F1-85E4-4A4E-84B1-D339EDBB4C11	3F27FAB6-67D2-450D-8D74-B7005B2694C1	Solo Jazz Workshop (190 CHF)	0x000000000000128F
7BBB7580-1108-4503-A357-DE038D458058	DC20E341-0C70-4586-82DC-3F1C68A0332D	Intermediate	0x0000000000001288
359A7EA0-9C18-4E4F-9013-E55024B73CB0	EC314126-6C0A-4A35-A66E-B7BF027824CA	Ich möchte ein Mittagessen ohne Fleisch (10 CHF)	0x0000000000001280
1562A341-FA98-4F27-A02F-E60207BC800D	728ED78D-FC07-4999-B495-A30B96FFBE16	Follower	0x000000000000127B
C59BB5A9-7794-4376-92C5-EA74B603957E	EC314126-6C0A-4A35-A66E-B7BF027824CA	Ich verpflege mich selber	0x0000000000001290
43BD5FEA-A45C-458A-A54E-F345C89D7009	DC20E341-0C70-4586-82DC-3F1C68A0332D	Advanced	0x0000000000001282
F6EF88B8-D3AD-4B21-9B41-F5A23B86065C	B02B82C9-416C-4F80-92CC-A46BBBF62831	Ich verpflege mich selber	0x0000000000001297
A2BAD46F-0512-437B-A2F8-FD3DF8739DEC	54F64506-D9B9-4379-9CDB-F641DE6986A2	Ich suche eine Privatunterkunft	0x000000000000128B


*/