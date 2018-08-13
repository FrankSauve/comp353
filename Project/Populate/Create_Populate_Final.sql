set foreign_key_checks=1;

CREATE TABLE Users (
  username char(255) not null,
  Password varchar(255) not null,
  PRIMARY KEY (username)
);

CREATE TABLE EmployeeType (
  EDID int not null auto_increment,
  Descript Char(50),
  PRIMARY KEY (EDID)
);

CREATE TABLE Insurance (
  InsuranceID int not null auto_increment,
  TypeDescript varchar(250),
  Covrage double,
  PRIMARY KEY (InsuranceID)
);

CREATE TABLE TypeOfContracts (
  Category char(10),
  St int,
  nd int,
  Rd int,
  Th int,
  PRIMARY KEY (Category)
);

CREATE TABLE Responsible (
  RespoID int not null auto_increment,
  fName varchar(50),
  mName varchar(50),
  lName varchar(50),
  contact varchar(50),
  Email varchar(255),
  PRIMARY KEY (RespoID)
);

CREATE TABLE PostalCode (
  PostalCode Char(50),
  City varchar(250),
  Province varchar(250),
  PRIMARY KEY (PostalCode)
);

CREATE TABLE Company (
  CompID int not null auto_increment,
  CompName char(250),
  PostalCode char(50),
  username char(255),
  PRIMARY KEY (CompID),
  Foreign Key (username) references Users (username),
  Foreign Key (PostalCode) references PostalCode (PostalCode)
);

CREATE TABLE Contracts (
  ContID int NOT NULL AUTO_INCREMENT,
  CompID int,
  RespoID int,
  AVC double,
  IV double,
  StartDate date,
  Category char(10),
  TypeOfService char(50),
  FirstDeliv date,
  SecondDeliv date,
  ThirdDeliv date,
  FourthDeliv date,
  Rating int,
  PRIMARY KEY (ContID),
  Foreign Key (CompID) references Company (CompID),
  Foreign Key (RespoID) references Responsible (RespoID),
  Foreign Key (Category) references TypeOfContracts (Category)
);

CREATE TABLE Employees (
  EmployeeID int not null auto_increment,
  fName varchar(50),
  lName varchar(50),
  InsuranceID int,
  EDID int,
  username char(255),
  PRIMARY KEY (EmployeeID),
  Foreign Key (InsuranceID) references Insurance (InsuranceID),
	Foreign Key (username) references Users (username),
  Foreign Key (EDID) references EmployeeType (EDID)
);

CREATE TABLE Hours (
  ID int not null auto_increment,
  Date date,
  EmployeeID int,
  contID int,
  hours double,
  PRIMARY KEY (ID),
  Foreign Key (EmployeeID) references Employees (EmployeeID),
  Foreign Key (contID) references Contracts (ContID)
);

CREATE TABLE Teams (
  TeamID int not null auto_increment,
  ManagerID int,
  PRIMARY KEY (TeamID),
  Foreign Key (ManagerID) references Employees (EmployeeID)
);

CREATE TABLE Prefernces (
  EmployeeID int,
  Category char(10),
  Foreign Key (EmployeeID) references Employees (EmployeeID),
  Foreign Key (Category) references TypeOfContracts (Category)
);

CREATE TABLE EmployeeHistory (
  ID int not null auto_increment,
  EmployeeID int,
  teamID int,
  contID int,
  isActive int,
  PRIMARY KEY (ID),
  Foreign Key (EmployeeID) references Employees (EmployeeID),
  Foreign Key (teamID) references Teams (teamID),
  Foreign Key (contID) references Contracts (contID)
);

Create table CreatedBy (
ContID int not null, 
EmployeeID int  not null,
Foreign key (ContID) references Contracts (ContiD),
Foreign key (EmployeeID) references Employees (EmployeeID)
);

insert into Users (username, Password) values ('loffiler0', 'd7EYiOn');
insert into Users (username, Password) values ('lebertz1', 'Lp5k6I4');
insert into Users (username, Password) values ('wcasazza2', '1MzloITnR');
insert into Users (username, Password) values ('vfletcher3', 'vT4fc9mYP');
insert into Users (username, Password) values ('ameffin4', 'c0QE2FVHqg6');
insert into Users (username, Password) values ('abaigent5', 'ZS7tTgpfQP2Q');
insert into Users (username, Password) values ('baberhart6', 'BGyV1Hgh');
insert into Users (username, Password) values ('dradeliffe7', 'afrXgyR');
insert into Users (username, Password) values ('shelian8', 'XFHOz6xMRD');
insert into Users (username, Password) values ('ishearstone9', 'UOCIPNr');
insert into Users (username, Password) values ('sgooderea', 'VMi6vY4yvM');
insert into Users (username, Password) values ('hsclaterb', 'dfcVeKX');
insert into Users (username, Password) values ('cmayowc', 'aowgIrcoUx');
insert into Users (username, Password) values ('rlandord', '3FgS3mr5HM');
insert into Users (username, Password) values ('kbroadye', '1Cb9Kp');
insert into Users (username, Password) values ('edudhillf', 'mdWAsZ9Om2');
insert into Users (username, Password) values ('hgoningg', 'oaYYF0T0gR');
insert into Users (username, Password) values ('ssilwoodh', 'Cn95Mhoi8c');
insert into Users (username, Password) values ('abonnori', 'i8RuK3nXNMa9');
insert into Users (username, Password) values ('sbunnj', 'E65jvNFbRtjx');
insert into Users (username, Password) values ('tjaukovick', 'mAWnoA37');
insert into Users (username, Password) values ('bkaesl', 'qEbqNgGAH');
insert into Users (username, Password) values ('larkellm', 'FjQHJ5MSsB');
insert into Users (username, Password) values ('bbarkesn', 'C8ycbAV');
insert into Users (username, Password) values ('cchettero', '1prWr91hbbBG');
insert into Users (username, Password) values ('agorringep', 'Qk2WcW');
insert into Users (username, Password) values ('adallicoatq', 'Rp43qUjbhwXP');
insert into Users (username, Password) values ('ahamleyr', 'MKrSiI');
insert into Users (username, Password) values ('dbrentons', 'ZjjJmU0');
insert into Users (username, Password) values ('dpeppettt', 'RPCfd8');
insert into Users (username, Password) values ('bbeloeu', 'kPJYfZ');
insert into Users (username, Password) values ('rstowerv', '1FfLgsxqw');
insert into Users (username, Password) values ('fguerrew', '0QkCiI');
insert into Users (username, Password) values ('bcastellinox', 'cgpCBk');
insert into Users (username, Password) values ('mokroyy', 'Is4FEr8yWYg');
insert into Users (username, Password) values ('bundrellz', '75gfzP');
insert into Users (username, Password) values ('ebuzza10', '5o93XP79j');
insert into Users (username, Password) values ('lbaythrop11', '2ovRT1');
insert into Users (username, Password) values ('mmiller12', '2JCkRM');
insert into Users (username, Password) values ('dspurgin13', 'nxYHixz');
insert into Users (username, Password) values ('amarkushkin0', 'k3tCoHoPSWWl');
insert into Users (username, Password) values ('proelofsen1', 'zh4eHg3HDm');
insert into Users (username, Password) values ('mlechelle2', '6U8HnTUb3A');
insert into Users (username, Password) values ('gsunman3', 'wHhMlNfkp');
insert into Users (username, Password) values ('tpettifor4', 'Gk7E4UbJy8YE');
insert into Users (username, Password) values ('msueter5', '1O0dLw');
insert into Users (username, Password) values ('mhawe6', 'dF0IihXZYx');
insert into Users (username, Password) values ('lsirl7', 'wgEilm');
insert into Users (username, Password) values ('hmonkman8', '6eFxG76E9W');
insert into Users (username, Password) values ('voldfield9', 'UhYfmig');
insert into Users (username, Password) values ('vgroombridgea', 'FpwT6U');
insert into Users (username, Password) values ('lswinnertonb', 'vjQvXhY6');
insert into Users (username, Password) values ('dgreeningc', 'MUv6Y9UC');
insert into Users (username, Password) values ('rberksd', 'd1d5133GCTVu');
insert into Users (username, Password) values ('ymowdaye', 'GE8wFXXYT');
insert into Users (username, Password) values ('rgabelf', 'NUnlaB');
insert into Users (username, Password) values ('eshillumg', '9ssKWNvY69A');
insert into Users (username, Password) values ('bderuggeroh', 'rmaYHPw');
insert into Users (username, Password) values ('hbrooksoni', 'ccgNTzlMX');
insert into Users (username, Password) values ('edukerj', 'FRdPGRT');
insert into Users (username, Password) values ('nledgewayk', 'b1SM4a');
insert into Users (username, Password) values ('mradleyl', 'HLJ0D0AFOV0C');
insert into Users (username, Password) values ('jminearm', 'B1IW2gW5f');
insert into Users (username, Password) values ('gspainn', 'wTIUDu');
insert into Users (username, Password) values ('tbrookshawo', 'SxI3yAggOEJp');
insert into Users (username, Password) values ('fpeap', '5AqsBtcriUb');
insert into Users (username, Password) values ('akearnq', 'XGGsOH2NMZIG');
insert into Users (username, Password) values ('pstaplesr', 'ZYCnBQbxTWOe');
insert into Users (username, Password) values ('nmccreaths', '0dDqQKx');
insert into Users (username, Password) values ('ebrussellt', '0aJAjmXi');
insert into Users (username, Password) values ('bcapehornu', 'H1IQ1pxwBem');
insert into Users (username, Password) values ('heckelsv', 'Ah6Um7KW');
insert into Users (username, Password) values ('erayltonw', 'kEBe575O0D');
insert into Users (username, Password) values ('bwitherdenx', 'HrNMIHqE3ln');
insert into Users (username, Password) values ('gboissiery', 'jCy5qoPI7S');
insert into Users (username, Password) values ('abiggerstaffz', 'XoHwUlxjMZf');
insert into Users (username, Password) values ('wcartwright10', 'VqaVI3');
insert into Users (username, Password) values ('eperrygo11', 'AThTEbCMwMO');
insert into Users (username, Password) values ('awoakes12', 'f74wJvVHfs');
insert into Users (username, Password) values ('rpregel13', 'fFrtGWc4');
insert into Users (username, Password) values ('jfellow14', 'j3ddYmg8rTNn');
insert into Users (username, Password) values ('fworvill15', 'F3A4EdBU');
insert into Users (username, Password) values ('ywonfar16', 'OknUItm8SCI');
insert into Users (username, Password) values ('kwilmut17', 'e2f5VdZ');
insert into Users (username, Password) values ('pmuckleston18', 'UkRJO0');
insert into Users (username, Password) values ('ismalman19', 'xHeMjcH0mIoU');
insert into Users (username, Password) values ('jmanville1a', 'DBPLai');
insert into Users (username, Password) values ('cpostlewhite1b', 'p7Za1Y8q');
insert into Users (username, Password) values ('dganford1c', 'fQlyxpbA');
insert into Users (username, Password) values ('bwinterscale1d', 'HY8bDnkrh0');
insert into Users (username, Password) values ('kitzhaki1e', 'UrInjS09');
insert into Users (username, Password) values ('hcostley1f', 'KJtoPwy');
insert into Users (username, Password) values ('dapark1g', 'bn1v0J');
insert into Users (username, Password) values ('gnewdick1h', 'NEypMCG10r');
insert into Users (username, Password) values ('slownsbrough1i', 'RYFGNtQEskSk');
insert into Users (username, Password) values ('fdixon1j', 'GZIBk0NwRMJ');
insert into Users (username, Password) values ('fdourin1k', 'oGNzXQJa');
insert into Users (username, Password) values ('opeachman1l', 'whT058gXEVF8');
insert into Users (username, Password) values ('bcleverley1m', 'vKSqZm');
insert into Users (username, Password) values ('isazio1n', 'aou9FSE2Gd');
insert into Users (username, Password) values ('oeuston1o', 'IHdt010Bmig');
insert into Users (username, Password) values ('efearns1p', 'KnN0cuhp');
insert into Users (username, Password) values ('csharnock1q', 'vfTKvoUJVXD');
insert into Users (username, Password) values ('mportwain1r', 'bAABhtw66');
insert into Users (username, Password) values ('cbarck1s', 'nhBc4k');
insert into Users (username, Password) values ('jpye1t', 'UfUpD6');
insert into Users (username, Password) values ('hgrene1u', 'Vj6CDebGx');
insert into Users (username, Password) values ('kriolfo1v', 'UanMTom');
insert into Users (username, Password) values ('zhorsfield1w', 'AHWDi0dhD');
insert into Users (username, Password) values ('jtollow1x', 'DXPi6D3jn9C');
insert into Users (username, Password) values ('rkimm1y', 'KiNdo8AzE2ht');
insert into Users (username, Password) values ('cshallcrass1z', '54wrIR');
insert into Users (username, Password) values ('rmcloney20', 'RMfpF02E1Gr');
insert into Users (username, Password) values ('asenior21', '7aPHXC');
insert into Users (username, Password) values ('bjohn22', 'ncsRWT');
insert into Users (username, Password) values ('mgammon23', '4fRqQg');
insert into Users (username, Password) values ('gdevuyst24', '6Ao0PI');
insert into Users (username, Password) values ('tfennick25', 'lTIDG1UbvKc');
insert into Users (username, Password) values ('lstannus26', '1eEr4yJbDZ');
insert into Users (username, Password) values ('ably27', 'gEqOw5');
insert into Users (username, Password) values ('awormald28', 'NAYdaJENU');
insert into Users (username, Password) values ('cjeeks29', 'hYHMaflJ88D');
insert into Users (username, Password) values ('bbleazard2a', 'YwNUKVTI7zR');
insert into Users (username, Password) values ('cmarian2b', 'vDttEMk2DMa');
insert into Users (username, Password) values ('aeccles2c', 'bYwYIV1dH');
insert into Users (username, Password) values ('gcridlin2d', '9P6pAg');
insert into Users (username, Password) values ('yscutching2e', 'Z5qPN9tH6oAc');
insert into Users (username, Password) values ('ccaush2f', 'xe35PAffvUEy');
insert into Users (username, Password) values ('vmell2g', 'ZYoTCoaFgUM');
insert into Users (username, Password) values ('prichold2h', 'jZBIUK');
insert into Users (username, Password) values ('wargont2i', 'sPBqYl7ic');
insert into Users (username, Password) values ('mjeste2j', 'ru7HVIwN64H');
insert into Users (username, Password) values ('tmeenehan2k', '5PPQXiraM');
insert into Users (username, Password) values ('jpeaden2l', 'VfMOEdnQ');
insert into Users (username, Password) values ('fnussen2m', 'e5xFuYo');
insert into Users (username, Password) values ('djacmar2n', 'OYcbRc5fbD3');
insert into Users (username, Password) values ('jonge2o', 'wFaEDrf');
insert into Users (username, Password) values ('pcoaster2p', 'GdJzPJdF');
insert into Users (username, Password) values ('wcastellaccio2q', 'qqE1aPm');
insert into Users (username, Password) values ('hgrinikhin2r', 'DKLpq7iCH');


insert into EmployeeType (Descript) values('Manager');
insert into EmployeeType (Descript) values('Sales Associate');
insert into EmployeeType (Descript) values('Employee');

insert into Insurance (TypeDescript, covrage) values('Premium', 0.90);
insert into Insurance (TypeDescript, covrage) values('Silver', 0.80);
insert into Insurance (TypeDescript, covrage) values('Normal', 0.70);

insert into TypeOfContracts (Category, St, nd, Rd, Th) values('Premium', 3, 5, 10, null);
insert into TypeOfContracts (Category, St, nd, Rd, Th) values('Diamond', 6, 11, 18, null);
insert into TypeOfContracts (Category, St, nd, Rd, Th) values('Gold', 8, 14, 20, null);
insert into TypeOfContracts (Category, St, nd, Rd, Th) values('Silver', 5, 15, 20, 28);


insert into Responsible (fName, mName, lName, contact, Email) values ('Willyt', 'Lothaire', 'Buckle', '886-145-6135', 'lbuckle0@reference.com');
insert into Responsible (fName, mName, lName, contact, Email) values ('Catlee', 'Annabal', 'Barensky', '154-159-7458', 'abarensky1@bing.com');
insert into Responsible (fName, mName, lName, contact, Email) values ('Jameson', 'Osmond', 'Stanfield', '997-773-9678', 'ostanfield2@miibeian.gov.cn');
insert into Responsible (fName, mName, lName, contact, Email) values ('Chuck', 'Ripley', 'Zarfati', '914-165-6704', 'rzarfati3@dailymotion.com');
insert into Responsible (fName, mName, lName, contact, Email) values ('Isabelita', 'Reyna', 'Stutt', '931-151-7530', 'rstutt4@vimeo.com');
insert into Responsible (fName, mName, lName, contact, Email) values ('Lanny', 'Ingram', 'Broz', '535-141-7084', 'ibroz5@dedecms.com');
insert into Responsible (fName, mName, lName, contact, Email) values ('Latrina', 'Anni', 'Jessett', '269-273-6356', 'ajessett6@berkeley.edu');
insert into Responsible (fName, mName, lName, contact, Email) values ('Karlis', 'Leonie', 'Mundford', '361-586-8773', 'lmundford7@vkontakte.ru');
insert into Responsible (fName, mName, lName, contact, Email) values ('Morgen', 'Decca', 'Realy', '958-523-9475', 'drealy8@weebly.com');
insert into Responsible (fName, mName, lName, contact, Email) values ('Stewart', 'Mitzi', 'Epton', '543-132-0622', 'mepton9@latimes.com');
insert into Responsible (fName, mName, lName, contact, Email) values ('Findlay', 'Zabrina', 'Wisniewski', '403-885-6749', 'zwisniewskia@shop-pro.jp');
insert into Responsible (fName, mName, lName, contact, Email) values ('Helsa', 'Joshua', 'Baily', '729-128-0745', 'jbailyb@bizjournals.com');
insert into Responsible (fName, mName, lName, contact, Email) values ('Jaymie', 'Trefor', 'Freiburger', '562-146-6559', 'tfreiburgerc@independent.co.uk');
insert into Responsible (fName, mName, lName, contact, Email) values ('Georgia', 'Galvan', 'Kelleway', '907-827-7436', 'gkellewayd@icq.com');
insert into Responsible (fName, mName, lName, contact, Email) values ('Gordy', 'Cesar', 'Oosthout de Vree', '139-485-2826', 'coosthoutdevreee@pagesperso-orange.fr');
insert into Responsible (fName, mName, lName, contact, Email) values ('Payton', 'Goldy', 'Nurdin', '718-993-6631', 'gnurdinf@pagesperso-orange.fr');
insert into Responsible (fName, mName, lName, contact, Email) values ('Katharina', 'Erhard', 'Chadband', '494-447-8111', 'echadbandg@oracle.com');
insert into Responsible (fName, mName, lName, contact, Email) values ('Nappy', 'Kaleb', 'Teasdale-Markie', '285-991-5590', 'kteasdalemarkieh@dailymotion.com');
insert into Responsible (fName, mName, lName, contact, Email) values ('Gar', 'Roscoe', 'Brisse', '555-704-3484', 'rbrissei@cornell.edu');
insert into Responsible (fName, mName, lName, contact, Email) values ('Sammy', 'Risa', 'Rooksby', '878-139-8344', 'rrooksbyj@dropbox.com');
insert into Responsible (fName, mName, lName, contact, Email) values ('Kristopher', 'Cobby', 'Peschmann', '614-518-9566', 'cpeschmannk@nydailynews.com');
insert into Responsible (fName, mName, lName, contact, Email) values ('Burg', 'Eran', 'De Mars', '828-835-1060', 'edemarsl@rediff.com');
insert into Responsible (fName, mName, lName, contact, Email) values ('Anneliese', 'Cheston', 'Torpie', '636-515-4216', 'ctorpiem@marketwatch.com');
insert into Responsible (fName, mName, lName, contact, Email) values ('Bernice', 'Liliane', 'Kingcott', '662-860-9675', 'lkingcottn@e-recht24.de');
insert into Responsible (fName, mName, lName, contact, Email) values ('Daniella', 'Nina', 'Beddoe', '109-925-1829', 'nbeddoeo@i2i.jp');
insert into Responsible (fName, mName, lName, contact, Email) values ('Asia', 'Elsie', 'McLice', '496-869-4909', 'emclicep@utexas.edu');
insert into Responsible (fName, mName, lName, contact, Email) values ('Stanleigh', 'Andonis', 'Batchelar', '291-606-1801', 'abatchelarq@paypal.com');
insert into Responsible (fName, mName, lName, contact, Email) values ('Stearne', 'Ashly', 'Riguard', '657-630-2327', 'ariguardr@thetimes.co.uk');
insert into Responsible (fName, mName, lName, contact, Email) values ('Colline', 'Lenci', 'Ephson', '741-228-7424', 'lephsons@who.int');
insert into Responsible (fName, mName, lName, contact, Email) values ('Claresta', 'Auberta', 'Yearron', '108-735-9330', 'ayearront@google.com.br');
insert into Responsible (fName, mName, lName, contact, Email) values ('Ulric', 'Tann', 'Staniland', '131-456-2328', 'tstanilandu@mozilla.com');
insert into Responsible (fName, mName, lName, contact, Email) values ('Bernetta', 'Reynold', 'Breeton', '733-488-4561', 'rbreetonv@unicef.org');
insert into Responsible (fName, mName, lName, contact, Email) values ('Helen', 'Granger', 'Dowty', '542-912-5792', 'gdowtyw@pinterest.com');
insert into Responsible (fName, mName, lName, contact, Email) values ('Cecilla', 'Davin', 'Faragher', '816-381-4823', 'dfaragherx@washingtonpost.com');
insert into Responsible (fName, mName, lName, contact, Email) values ('Edi', 'Ogdan', 'Butchers', '221-206-0115', 'obutchersy@youtu.be');
insert into Responsible (fName, mName, lName, contact, Email) values ('Alene', 'Berna', 'Waker', '130-370-0564', 'bwakerz@miibeian.gov.cn');
insert into Responsible (fName, mName, lName, contact, Email) values ('Jada', 'Bevan', 'Salvidge', '649-777-8728', 'bsalvidge10@smugmug.com');
insert into Responsible (fName, mName, lName, contact, Email) values ('Myriam', 'Devy', 'Trelevan', '153-192-8050', 'dtrelevan11@reuters.com');
insert into Responsible (fName, mName, lName, contact, Email) values ('Sophi', 'Eduardo', 'Doeg', '392-719-2333', 'edoeg12@google.pl');
insert into Responsible (fName, mName, lName, contact, Email) values ('Suzie', 'Jose', 'Pyrton', '328-793-5168', 'jpyrton13@comsenz.com');
insert into Responsible (fName, mName, lName, contact, Email) values ('Flossie', 'Kelcey', 'Bodham', '736-863-2398', 'kbodham14@t.co');
insert into Responsible (fName, mName, lName, contact, Email) values ('Jena', 'Glynda', 'Gibby', '483-689-5155', 'ggibby15@cocolog-nifty.com');
insert into Responsible (fName, mName, lName, contact, Email) values ('Rafferty', 'Murry', 'Deans', '871-208-7169', 'mdeans16@delicious.com');
insert into Responsible (fName, mName, lName, contact, Email) values ('Courtenay', 'Elysee', 'Flanner', '313-116-2918', 'eflanner17@diigo.com');
insert into Responsible (fName, mName, lName, contact, Email) values ('Min', 'Traci', 'Lathleiff', '588-624-4848', 'tlathleiff18@networksolutions.com');
insert into Responsible (fName, mName, lName, contact, Email) values ('Dasie', 'Kriste', 'Coan', '618-981-9682', 'kcoan19@nih.gov');
insert into Responsible (fName, mName, lName, contact, Email) values ('Jacinta', 'Teresa', 'Hardingham', '142-247-2315', 'thardingham1a@mapquest.com');
insert into Responsible (fName, mName, lName, contact, Email) values ('Chip', 'Athena', 'Gauchier', '695-753-3571', 'agauchier1b@marriott.com');
insert into Responsible (fName, mName, lName, contact, Email) values ('Tobias', 'Karlis', 'Heaton', '636-682-2232', 'kheaton1c@rakuten.co.jp');
insert into Responsible (fName, mName, lName, contact, Email) values ('Pennie', 'Felisha', 'Cosham', '483-789-2937', 'fcosham1d@usnews.com');
insert into Responsible (fName, mName, lName, contact, Email) values ('Elisabet', 'Giuditta', 'Brettle', '799-486-2200', 'gbrettle1e@fastcompany.com');
insert into Responsible (fName, mName, lName, contact, Email) values ('Nil', 'Chrissie', 'Crossland', '254-335-9502', 'ccrossland1f@hao123.com');
insert into Responsible (fName, mName, lName, contact, Email) values ('Lorant', 'Asa', 'Rauprich', '434-852-6893', 'arauprich1g@ebay.co.uk');
insert into Responsible (fName, mName, lName, contact, Email) values ('Kellby', 'Sascha', 'Pidgin', '608-189-9624', 'spidgin1h@oakley.com');
insert into Responsible (fName, mName, lName, contact, Email) values ('Maria', 'Nicolai', 'Castellet', '836-752-5005', 'ncastellet1i@deviantart.com');
insert into Responsible (fName, mName, lName, contact, Email) values ('Lolita', 'Martha', 'Henrie', '713-927-8156', 'mhenrie1j@java.com');
insert into Responsible (fName, mName, lName, contact, Email) values ('Wynnie', 'Minda', 'Backshall', '828-619-4190', 'mbackshall1k@ehow.com');
insert into Responsible (fName, mName, lName, contact, Email) values ('Torin', 'Carmelle', 'Mohun', '496-359-5394', 'cmohun1l@google.es');
insert into Responsible (fName, mName, lName, contact, Email) values ('Lanie', 'Hall', 'Kulis', '254-896-3520', 'hkulis1m@booking.com');
insert into Responsible (fName, mName, lName, contact, Email) values ('Brock', 'Esmaria', 'January', '341-803-7848', 'ejanuary1n@t-online.de');


INSERT INTO PostalCode (PostalCode,City,Province) VALUES ('T0A 0A1','SADDLE LAKE','AB'),
 ('T0A 0A3','GLENDON','AB'),
 ('T0A 0A4','LINDBERGH','AB'),
 ('T0A 0B0','ARDMORE','AB'),
 ('T0A 0B2','NEWBROOK','AB'),
 ('T0A 0B3','VILNA','AB'),
 ('T0A 0B5','HEINSBURG','AB'),
 ('T0A 0B6','SPUTINOW','AB'),
 ('T0A 0B8','SMOKY LAKE','AB'),
 ('T0A 0C1','LANCASTER PARK','AB'),
 ('T0A 0C3','BOYLE','AB'),
 ('T0A 0C4','IRON RIVER','AB'),
 ('T0A 0C5','LAC LA BICHE','AB'),
 ('T0A 0C7','ASHMONT','AB'),
 ('T0A 0C8','RADWAY','AB'),
 ('T0A 0E0','ATMORE','AB'),
 ('T0A 0E1','ABEE','AB'),
 ('T0A 0E3','FROG LAKE','AB'),
 ('T0A 0E6','REDWATER','AB'),
 ('T0A 0E7','GRASSLAND','AB'),
 ('E1A 0B2','DIEPPE','NB'),
 ('E1A 0J1','MONCTON','NB'),
 ('E1B 0A1','RIVERVIEW','NB'),
 ('E1G 0C1','LUTES MOUNTAIN','NB'),
 ('E1G 0M3','BOUNDARY CREEK','NB'),
 ('E1G 0N6','STEEVES MOUNTAIN','NB'),
 ('E1G 0W5','AMMON','NB'),
 ('E1G 2Z6','GALLAGHER RIDGE','NB'),
 ('E1G 3A7','INDIAN MOUNTAIN','NB'),
 ('E1G 3C9','STILESVILLE','NB'),
 ('E1G 3J4','MCQUADE','NB'),
 ('E1G 3K2','DUNDAS','NB'),
 ('E1G 3K7','NEW SCOTLAND','NB'),
 ('E1G 3S5','BERRY MILLS','NB'),
 ('E1G 3V1','GLADESIDE','NB'),
 ('E1G 4A8','ALLISON','NB'),
 ('E1H 0E7','GREATER LAKEBURN','NB'),
 ('E1H 0H7','IRISHTOWN','NB'),
 ('E1H 1E9','LAKEVILLE-WESTMORLAND','NB'),
 ('E1H 1S9','SAINT-PHILIPPE','NB'),
 ('X0E 0A0','AKLAVIK','NT'),
 ('X0E 0A1','TUKTOYAKTUK','NT'),
 ('X0E 0A2','FORT GOOD HOPE','NT'),
 ('X0E 0A4','FORT SMITH','NT'),
 ('X0E 0A5','INUVIK','NT'),
 ('X0E 0A6','DELINE','NT'),
 ('X0E 0A7','FORT PROVIDENCE','NT'),
 ('X0E 0B0','TSIIGEHTCHIC','NT'),
 ('X0E 0B3','TULITA','NT'),
 ('X0E 0B5','ULUKHAKTOK','NT'),
 ('X0E 0B6','PAULATUK','NT'),
 ('X0E 0B9','BEHCHOKO','NT'),
 ('X0E 0J0','FORT MCPHERSON','NT'),
 ('X0E 0M0','FORT RESOLUTION','NT'),
 ('X0E 0N0','FORT SIMPSON','NT'),
 ('X0E 0R7','HAY RIVER','NT'),
 ('X0E 0V0','NORMAN WELLS','NT'),
 ('X0E 0Z0','SACHS HARBOUR','NT'),
 ('X0E 1A0','LUTSELK''E','NT'),
 ('X0E 1E0','WRIGLEY','NT'),
 ('X0E 1L0','COLVILLE LAKE','NT'),
 ('X0E 1P0','WHATI','NT'),
 ('C0A 0A2','MOUNT STEWART','PE'),
 ('C0A 0A9','VERNON BRIDGE','PE'),
 ('C0A 0B2','MURRAY HARBOUR','PE'),
 ('C0A 0B3','GEORGETOWN','PE'),
 ('C0A 0B4','ST-PETERS BAY','PE'),
 ('C0A 0B8','MURRAY RIVER','PE'),
 ('C0A 0B9','GREEN GABLES','PE'),
 ('C0A 0C1','YORK','PE'),
 ('C0A 1A0','BELFAST','PE'),
 ('C0A 1B0','BELLE RIVER','PE'),
 ('C0A 1C0','BONSHAW','PE'),
 ('C0A 1E0','BREADALBANE','PE'),
 ('C0A 1G0','CARDIGAN','PE'),
 ('C0A 1H0','CORNWALL','PE'),
 ('C0A 1H1','MEADOWBANK','PE'),
 ('C0A 1H2','CUMBERLAND','PE'),
 ('G0A 0A1','WENDAKE','QC'),
 ('G0A 0A2','ST-JOACHIM-DE-MONTMORENCY','QC'),
 ('G0A 0B8','SAINTE-ANNE-DE-BEAUPRE','QC'),
 ('G0A 0E5','SAINTE-BRIGITTE-DE-LAVAL','QC'),
 ('G0A 1A0','SAINTE-CHRISTINE-D''AUVERGNE','QC'),
 ('G0A 3P0','SAINTE-FAMILLE','QC'),
 ('G0A 4C0','SAINTE-PETRONILLE','QC'),
 ('G0C 0B2','VAL-D''ESPOIR','QC'),
 ('G0C 0C5','BONAVENTURE','QC'),
 ('G0C 0E2','SAINTE-THERESE-DE-GASPE','QC'),
 ('G0C 3E0','SHIGAWAKE','QC'),
 ('G0G 0A3','TETE-A-LA-BALEINE','QC'),
 ('G0G 0C6','SCHEFFERVILLE','QC'),
 ('G0G 0G0','VILLAGE DES ATHLETES','QC'),
 ('G0G 2V0','SHELDRAKE','QC'),
 ('G0J 0A7','ST-OCTAVE','QC'),
 ('G0J 0B4','SAINTE-MARGUERITE-MARIE','QC'),
 ('G0J 0C5','SAINTE-FLORENCE','QC'),
 ('G0J 0E4','VAL-BRILLANT','QC'),
 ('G0J 0E6','STE-JEANNE-D''ARC-DE-MATANE','QC'),
 ('G0J 2H0','SAINTE-ANGELE-DE-MERICI','QC'),
 ('G0J 2K0','SAINTE-FELICITE','QC'),
 ('G0J 2L0','SAINTE-FLAVIE','QC'),
 ('G0J 2P0','STE-IRENE-DE-MATAPEDIA','QC'),
 ('G0J 3C0','SAINTE-PAULE','QC'),
 ('G0J 3K0','SAYABEC','QC'),
 ('G0K 1P0','SAINTE-LUCE','QC'),
 ('G0L 0A3','TEMISCOUATA-SUR-LE-LAC','QC'),
 ('G0L 0B9','TROIS-PISTOLES','QC'),
 ('G0L 0C3','ST-ATHANASE','QC'),
 ('G0L 0E6','SQUATEC','QC'),
 ('G0L 0H5','SAINTE-RITA','QC'),
 ('G0L 0H9','ST-GABRIEL-DE-KAMOURASKA','QC'),
 ('G0L 3B0','SAINTE-FRANCOISE','QC'),
 ('G0L 3J0','SAINTE-HELENE-DE-KAMOURASKA','QC'),
 ('G0M 1H0','SAINTE-PRAXEDE','QC'),
 ('G0M 1M0','SAINTE-AURELIE','QC'),
 ('G0N 0A6','TRING-JONCTION','QC'),
 ('G0N 1C0','SAINTE-CLOTILDE-DE-BEAUCE','QC'),
 ('G0P 1A1','SAINTS-MARTYRS-CANADIENS','QC'),
 ('G0P 1H0','SAINTE-HELENE-DE-CHESTER','QC'),
 ('G0P 1L0','SAINTE-SOPHIE-D''HALIFAX','QC'),
 ('G0R 0A4','SAINTE-PERPETUE-DE-L''ISLET','QC'),
 ('G0R 0B6','SAINTE-JUSTINE','QC'),
 ('G0R 0C8','SAINTE-ROSE-DE-WATFORD','QC'),
 ('G0R 0E6','SAINTE-CLAIRE','QC'),
 ('G0R 0G1','TOURVILLE','QC'),
 ('G0R 0G4','SAINTE-SABINE-DE-BELLECHASSE','QC'),
 ('G0R 0H2','ST-PIERRE-DE-LA-RIVIERE-DU-SUD','QC'),
 ('G0R 1A0','SAINTE-EUPHEMIE','QC'),
 ('G0R 1Z0','SAINTE-ANNE-DE-LA-POCATIERE','QC'),
 ('G0R 2P0','SAINTE-APOLLINE-DE-PATTON','QC'),
 ('G0R 3A0','ST-FRANCOIS-DE-LA-RIVIERE-DU-S','QC'),
 ('G0R 3L0','SAINTE-LUCIE-DE-BEAUREGARD','QC'),
 ('G0R 3R0','ST-MARCEL-DE-L''ISLET','QC'),
 ('G0R 3W0','ST-ONESIME','QC'),
 ('G0R 4L0','STANDON','QC'),
 ('G0R 4P0','SAINTE-FELICITE-DE-L''ISLET','QC'),
 ('G0S 0A5','SAINTE-FRANCOISE-DE-LOTBINIERE','QC'),
 ('G0S 0A7','SAINTE-HENEDINE','QC'),
 ('G0S 0C3','VAL-ALAIN','QC'),
 ('G0S 0C7','SAINTE-CROIX','QC'),
 ('G0S 0E3','VALLEE-JONCTION','QC'),
 ('G0S 0E4','STE-MARGUERITE-DE-DORCHESTER','QC'),
 ('G0S 1E2','SAINTE-HELENE-DE-BREAKEYVILLE','QC'),
 ('G0S 3E0','SAINTS-ANGES','QC'),
 ('G0S 3G0','SCOTT','QC'),
 ('G0S 3K0','VILLEROY','QC'),
 ('G0T 0A2','TADOUSSAC','QC'),
 ('G0V 0A9','SAINTE-ROSE-DU-NORD','QC'),
 ('G0W 0B5','SAINTE-JEANNE-D''ARC','QC'),
 ('G0W 2R0','SAINTE-HEDWIDGE-DE-ROBERVAL','QC'),
 ('G0W 2T0','SAINTE-MONIQUE-LAC-SAINT-JEAN','QC'),
 ('G0W 2V0','ST-NAZAIRE-DU-LAC-ST-JEAN','QC'),
 ('G0W 2X0','TAILLON','QC'),
 ('G0X 0A3','SAINTE-ANNE-DE-LA-PERADE','QC'),
 ('G0X 0A4','SAINTE-CECILE-DE-LEVRARD','QC'),
 ('G0X 0B1','SAINTE-THECLE','QC'),
 ('G0X 0B2','SAINTE-MARIE-DE-BLANDFORD','QC'),
 ('G0X 0B5','ST-BARNABE-NORD','QC'),
 ('G0X 0C2','TROIS-RIVES','QC'),
 ('G0X 0C3','SAINTE-GENEVIEVE-DE-BATISCAN','QC'),
 ('G0X 0C5','SAINTE-SOPHIE-DE-LEVRARD','QC'),
 ('G0X 0E4','YAMACHICHE','QC'),
 ('G0X 0E9','WEMOTACI','QC'),
 ('G0X 1B0','WOLINAK','QC'),
 ('G0Y 0A4','WOBURN','QC'),
 ('G0Y 0A7','STORNOWAY','QC'),
 ('G0Y 1E1','VAL-RACINE','QC'),
 ('G0Y 1J0','SAINTE-CECILE-DE-WHITTON','QC'),
 ('G0Z 0A1','SAINTE-EULALIE','QC'),
 ('G0Z 1C0','SAINTE-ANNE-DU-SAULT','QC'),
 ('G1A 0B2','QUEBEC','QC'),
 ('G3C 0B4','STONEHAM-ET-TEWKESBURY','QC'),
 ('G3N 0P4','STE-CATHERINE-DE-LA-J-CARTIER','QC'),
 ('G4R 0A3','UASHAT','QC'),
 ('G4R 0B7','SEPT-ILES','QC'),
 ('G4V 0B6','SAINTE-ANNE-DES-MONTS','QC'),
 ('G6E 0A3','SAINTE-MARIE','QC'),
 ('G6G 0B1','THETFORD MINES','QC'),
 ('G6P 0A2','VICTORIAVILLE','QC'),
 ('G7P 0A9','SHIPSHAW','QC'),
 ('G8L 8A4','SAINTE-ELISABETH-DE-PROULX','QC'),
 ('G8T 0B7','TROIS-RIVIERES','QC'),
 ('G9N 0B9','SHAWINIGAN','QC'),
 ('G9P 0A4','SHAWINIGAN-SUD','QC'),
 ('H1A 0B7','MONTREAL','QC'),
 ('H1B 0B4','MONTREAL-EST','QC'),
 ('H1G 1G2','MONTREAL-NORD','QC'),
 ('H1J 0A9','ANJOU','QC'),
 ('H3E 0A5','VERDUN','QC'),
 ('H3P 1E3','MONT-ROYAL','QC'),
 ('H3X 2V4','COTE SAINT-LUC','QC'),
 ('H4S 1Y9','DORVAL','QC'),
 ('H4X 1E4','MONTREAL-OUEST','QC'),
 ('H7A 0A1','LAVAL','QC'),
 ('H7M 2R3','VIMONT','QC'),
 ('H7R 2W6','LAVAL-OUEST','QC'),
 ('H7X 1A4','SAINTE-DOROTHEE','QC'),
 ('H8N 0A3','LASALLE','QC'),
 ('H8R 0A3','LACHINE','QC'),
 ('H8Y 3B8','DOLLARD-DES-ORMEAUX','QC'),
 ('H9C 1A7','L''ILE-BIZARD','QC'),
 ('H9H 1A4','SAINTE-GENEVIEVE','QC'),
 ('H9X 1B9','SENNEVILLE','QC'),
 ('H9X 1C5','SAINTE-ANNE-DE-BELLEVUE','QC'),
 ('J0A 0A1','WARWICK','QC'),
 ('J0A 0A3','TINGWICK','QC'),
 ('J0A 0A8','SAINTE-CLOTILDE-DE-HORTON','QC'),
 ('J0A 1E0','SAINTE-SERAPHINE','QC'),
 ('J0A 1M0','SAINTE-ELIZABETH-DE-WARWICK','QC'),
 ('J0A 1N0','WOTTON','QC'),
 ('J0B 0A2','SAINTE-EDWIDGE','QC'),
 ('J0B 0B9','SAWYERVILLE','QC'),
 ('J0B 0C4','WEEDON','QC'),
 ('J0B 0E4','ST-FRANCOIS-XAVIER-DE-BROMPTON','QC'),
 ('J0B 1E0','STANSTEAD','QC'),
 ('J0B 1R0','WESTBURY','QC'),
 ('J0B 1W0','SAINTE-CATHERINE-DE-HATLEY','QC'),
 ('J0B 2B0','ULVERTON','QC'),
 ('J0B 3B0','SCOTSTOWN','QC'),
 ('J0B 3G0','STOKE','QC'),
 ('J0C 0A6','SAINTE-BRIGITTE-DES-SAULTS','QC'),
 ('J0C 1R0','SAINTE-PERPETUE','QC'),
 ('J0E 0A6','SUTTON','QC'),
 ('J0E 2B0','SAINTE-ANNE-DE-LA-ROCHELLE','QC'),
 ('J0E 2C0','SAINTE-CECILE-DE-MILTON','QC'),
 ('J0E 2J0','STUKELY-SUD','QC'),
 ('J0E 2L0','VALCOURT','QC'),
 ('J0E 2M0','WARDEN','QC'),
 ('J0E 2P0','WEST BROME','QC'),
 ('J0G 0A1','YAMASKA-EST','QC'),
 ('J0G 0A4','SAINTE-MONIQUE','QC'),
 ('J0G 0B2','SAINTE-VICTOIRE-DE-SOREL','QC'),
 ('J0G 1X0','YAMASKA','QC'),
 ('J0H 0A2','UPTON','QC'),
 ('J0H 0C6','SAINTE-HELENE-DE-BAGOT','QC'),
 ('J0H 1H0','SAINTE-CHRISTINE','QC'),
 ('J0H 1S0','SAINTE-MADELEINE','QC'),
 ('J0H 2B0','ST-VALERIEN','QC'),
 ('J0J 0B4','VENISE-EN-QUEBEC','QC'),
 ('J0J 0C2','STANBRIDGE STATION','QC'),
 ('J0J 1X0','SAINTE-BRIGIDE-D''IBERVILLE','QC'),
 ('J0J 2B0','SAINTE-SABINE','QC'),
 ('J0J 2H0','STANBRIDGE EAST','QC'),
 ('J0K 0B6','SAINTE-ELISABETH','QC'),
 ('J0K 0C9','SAINTE-MELANIE','QC'),
 ('J0K 0E2','SAINTE-JULIENNE','QC'),
 ('J0K 0E5','SAINTE-BEATRIX','QC'),
 ('J0K 1R0','SAINTE-ANGELE-DE-PREMONT','QC'),
 ('J0K 2K0','SAINTE-EMELIE-DE-L''ENERGIE','QC'),
 ('J0K 2Y0','SAINTE-MARCELLINE-DE-KILDARE','QC'),
 ('J0K 2Z0','SAINTE-MARIE-SALOME','QC'),
 ('J0K 3M0','SAINTE-URSULE','QC'),
 ('J0L 0A7','SHERRINGTON','QC'),
 ('J0L 0B7','SAINTE-CLOTILDE-DE-CHATEAUGUAY','QC'),
 ('J0L 1P0','SAINTE-ANGELE-DE-MONNOIR','QC'),
 ('J0L 2R0','VERCHERES','QC'),
 ('J0M 0A1','SALLUIT','QC'),
 ('J0M 0A2','WEMINDJI','QC'),
 ('J0M 1R0','WASKAGANISH','QC'),
 ('J0M 1T0','TASIUJAQ','QC'),
 ('J0M 1Y0','UMIUJAQ','QC'),
 ('J0N 0A3','SAINTE-ANNE-DES-PLAINES','QC'),
 ('J0N 0A6','SAINTE-MARTHE-SUR-LE-LAC','QC'),
 ('J0N 1H0','TERREBONNE','QC'),
 ('J0P 0A7','SAINTE-JUSTINE-DE-NEWTON','QC'),
 ('J0P 1P1','TRES-SAINT-REDEMPTEUR','QC'),
 ('J0P 1W0','SAINTE-MARTHE','QC'),
 ('J0R 1B0','SAINTE-ANNE-DES-LACS','QC'),
 ('J0S 0A8','SAINTE-AGNES-DE-DUNDEE','QC'),
 ('J0S 1P0','SAINTE-BARBE','QC'),
 ('J0S 1V0','SAINTE-MARTINE','QC'),
 ('J0T 0B3','STE-MARGUERITE-DU-LAC-MASSON','QC'),
 ('J0T 0B5','VAL-MORIN','QC'),
 ('J0T 1B0','BREBEUF','QC'),
 ('J0T 1Y0','WENTWORTH-NORD','QC'),
 ('J0T 2J0','SAINTE-LUCIE-DES-LAURENTIDES','QC'),
 ('J0T 2L0','VENDEE','QC'),
 ('J0T 2N0','VAL-DAVID','QC'),
 ('J0T 2P0','VAL-DES-LACS','QC'),
 ('J0W 1V0','SAINTE-ANNE-DU-LAC','QC'),
 ('J0X 0A7','SHAWVILLE','QC'),
 ('J0X 0B5','SAINTE-CECILE-DE-MASHAM','QC'),
 ('J0X 0B9','THURSO','QC'),
 ('J0X 0C1','VAL-DES-BOIS','QC'),
 ('J0X 0E1','SAINTE-THERESE-DE-LA-GATINEAU','QC'),
 ('J0X 2Z0','SHEENBORO','QC'),
 ('J0X 3E0','VENOSTA','QC'),
 ('J0X 3H0','WALTHAM','QC'),
 ('J0Y 0B4','SENNETERRE','QC'),
 ('J0Y 0B7','SAINTE-GERTRUDE-MANNEVILLE','QC'),
 ('J0Y 0C2','TRECESSON','QC'),
 ('J0Y 0C3','WASWANIPI','QC'),
 ('J0Z 0A1','TASCHEREAU','QC'),
 ('J0Z 1M0','SAINTE-GERMAINE-BOULE','QC'),
 ('J0Z 2H0','TEMISCAMING','QC'),
 ('J0Z 3S0','VAL-PARADIS','QC'),
 ('J0Z 3T0','VAL-SAINT-GILLES','QC'),
 ('J0Z 3V0','VILLEBOIS','QC'),
 ('J1S 0E1','VAL-JOLI','QC'),
 ('J1X 0B1','MAGOG','QC'),
 ('J1Z 2A5','DRUMMONDVILLE','QC'),
 ('J2L 0A3','BROMONT','QC'),
 ('J2M 0A4','SHEFFORD','QC'),
 ('J3E 0A5','SAINTE-JULIE','QC'),
 ('J3P 0B5','SOREL-TRACY','QC'),
 ('J3P 0J5','SAINTE-ANNE-DE-SOREL','QC'),
 ('J3X 0A5','VARENNES','QC'),
 ('J4B 0A1','BOUCHERVILLE','QC'),
 ('J4G 1C5','LONGUEUIL','QC'),
 ('J4W 1C1','BROSSARD','QC'),
 ('J5C 0B3','SAINTE-CATHERINE','QC'),
 ('J5J 0B7','SAINTE-SOPHIE','QC'),
 ('J6E 0B3','JOLIETTE','QC'),
 ('J6E 3H3','VILLAGE SAINT-PIERRE','QC'),
 ('J6J 0A7','CHATEAUGUAY','QC'),
 ('J6S 0A6','SALABERRY-DE-VALLEYFIELD','QC'),
 ('J6Z 0A4','BOIS-DES-FILION','QC'),
 ('J7B 0A2','BLAINVILLE','QC'),
 ('J7E 0A4','SAINTE-THERESE','QC'),
 ('J7E 4H4','BOISBRIAND','QC'),
 ('J7J 0B2','MIRABEL','QC'),
 ('J7K 0A7','MASCOUCHE','QC'),
 ('J7R 0A2','DEUX-MONTAGNES','QC'),
 ('J7V 0B1','VAUDREUIL-DORION','QC'),
 ('J7V 3C3','L''ILE-PERROT','QC'),
 ('J7V 3L2','TERRASSE-VAUDREUIL','QC'),
 ('J7V 9R7','VAUDREUIL-SUR-LE-LAC','QC'),
 ('J8C 0C1','SAINTE-AGATHE-DES-MONTS','QC'),
 ('J8C 0T7','SAINTE-AGATHE-NORD','QC'),
 ('J8E 0A5','MONT-TREMBLANT','QC'),
 ('J8L 0E4','GATINEAU','QC'),
 ('J8N 0C2','VAL-DES-MONTS','QC'),
 ('J9E 3A9','BOIS-FRANC','QC'),
 ('J9P 0A3','VAL-D''OR','QC'),
 ('J9V 1A3','VILLE-MARIE','QC'),
 ('V0A 0A5','RADIUM HOT SPRINGS','BC'),
 ('V0A 1A0','ATHALMER','BC'),
 ('V0A 1B0','BRISCO','BC'),
 ('V0A 1E0','EDGEWATER','BC'),
 ('V0A 1H0','GOLDEN','BC'),
 ('V0A 1J0','HARROGATE','BC'),
 ('V0A 1K6','INVERMERE','BC'),
 ('V0A 1L0','PARSON','BC'),
 ('V0A 1P0','SPILLIMACHEEN','BC'),
 ('V0A 1T0','PANORAMA','BC'),
 ('V0B 0A8','SPARWOOD','BC'),
 ('V0B 0B1','CRAWFORD BAY','BC'),
 ('V0B 0B2','RIONDEL','BC'),
 ('V0B 0B3','CANAL FLATS','BC'),
 ('V0B 0B8','BOSWELL','BC'),
 ('V0B 1A1','KUSKANOOK','BC'),
 ('V0B 1A2','SANCA','BC'),
 ('V0B 1A3','DESTINY BAY','BC'),
 ('V0B 1C0','CANYON','BC'),
 ('V0B 1G7','WEST CRESTON','BC'),
 ('V0B 1G9','ARROW CREEK','BC'),
 ('V0B 1H0','ELKFORD','BC'),
 ('V0B 1L1','FAIRMONT HOT SPRINGS','BC'),
 ('V0B 1M5','FERNIE','BC'),
 ('V0B 1N0','FORT STEELE','BC'),
 ('A0A 0A1','AVONDALE','NL'),
 ('A0A 0A2','HOLYROOD','NL'),
 ('A0A 0A4','SOUTH RIVER','NL'),
 ('A0A 0A5','NORTHERN BAY','NL'),
 ('A0A 0A6','CLARKES BEACH','NL'),
 ('A0A 0A7','CONCEPTION HARBOUR','NL'),
 ('A0A 0A8','HARBOUR MAIN','NL'),
 ('A0A 0B2','CAPE BROYLE','NL'),
 ('A0A 0B3','AQUAFORTE','NL'),
 ('A0A 0B4','COLLIERS RIVERHEAD','NL'),
 ('A0A 0B6','PETTY HARBOUR','NL'),
 ('A0A 0B8','BROAD COVE BDV','NL'),
 ('A0A 0B9','BURNT POINT BDV','NL'),
 ('A0A 0C2','RED HEAD COVE','NL'),
 ('A0A 0C3','FERRYLAND','NL'),
 ('A0A 0C5','BAY ROBERTS','NL'),
 ('A0A 0C7','COLEYS POINT SOUTH','NL'),
 ('A0A 0C8','MAKINSONS','NL'),
 ('A0A 0C9','HARBOUR GRACE','NL'),
 ('A0A 0E1','LOWER ISLAND COVE','NL'),
 ('A0A 0E2','PORT DE GRAVE','NL'),
 ('X0A 0A0','ARCTIC BAY','NU'),
 ('X0A 0A2','RESOLUTE','NU'),
 ('X0A 0A3','SANIKILUAQ','NU'),
 ('X0A 0A4','PANGNIRTUNG','NU'),
 ('X0A 0A5','POND INLET','NU'),
 ('X0A 0A6','HALL BEACH','NU'),
 ('X0A 0A8','GRISE FIORD','NU'),
 ('X0A 0A9','QIKIQTARJUAQ','NU'),
 ('X0A 0B1','KIMMIRUT','NU'),
 ('X0A 0B2','CAPE DORSET','NU'),
 ('X0A 0H0','IQALUIT','NU'),
 ('X0A 0L0','IGLOOLIK','NU'),
 ('X0B 0A2','KUGLUKTUK','NU'),
 ('X0B 0A5','TALOYOAK','NU'),
 ('X0B 0C0','CAMBRIDGE BAY','NU'),
 ('X0B 1J0','GJOA HAVEN','NU'),
 ('X0B 1K0','KUGAARUK','NU'),
 ('X0B 2A0','BAY CHIMO','NU'),
 ('X0C 0A0','BAKER LAKE','NU'),
 ('X0C 0A2','CORAL HARBOUR','NU'),
 ('X0C 0A5','ARVIAT','NU'),
 ('X0C 0B0','CHESTERFIELD INLET','NU'),
 ('X0C 0G0','RANKIN INLET','NU'),
 ('X0C 0H0','REPULSE BAY','NU'),
 ('X0C 0J0','WHALE COVE','NU'),
 ('K0A 0A1','CASSELMAN','ON'),
 ('K0A 0A2','SAINT-PASCAL-BAYLON','ON'),
 ('K0A 0A3','PAKENHAM','ON'),
 ('K0A 0A6','EDWARDS','ON'),
 ('K0A 0A7','FITZROY HARBOUR','ON'),
 ('K0A 0A9','EMBRUN','ON'),
 ('K0A 0B1','BOURGET','ON'),
 ('K0A 0B6','SARSFIELD','ON'),
 ('K0A 0B7','WOODLAWN','ON'),
 ('K0A 0C2','LIMOGES','ON'),
 ('K0A 0C3','METCALFE','ON'),
 ('K0A 0C4','CLARENCE CREEK','ON'),
 ('K0A 0C8','ASHTON','ON'),
 ('K0A 0C9','VERNON','ON'),
 ('K0A 1A0','ALMONTE','ON'),
 ('K0A 1G0','BRAESIDE','ON'),
 ('K0A 1K0','CARLSBAD SPRINGS','ON'),
 ('K0A 1L0','CARP','ON'),
 ('K0A 1P0','CLAYTON','ON'),
 ('K0A 1R0','CRYSLER','ON'),
 ('R0A 0A1','NIVERVILLE','MB'),
 ('R0A 0A6','BLUMENORT','MB'),
 ('R0A 0A8','PINEY','MB'),
 ('R0A 0B0','ARNAUD','MB'),
 ('R0A 0B1','PANSY','MB'),
 ('R0A 0B4','TOUROND','MB'),
 ('R0A 0B5','LORETTE','MB'),
 ('R0A 0B6','DOMINION CITY','MB'),
 ('R0A 0B7','EMERSON','MB'),
 ('R0A 0B8','LA BROQUERIE','MB'),
 ('R0A 0C2','OTTERBURNE','MB'),
 ('R0A 0C4','SANDILANDS','MB'),
 ('R0A 0C8','NEW BOTHWELL','MB'),
 ('R0A 0E1','ROSA','MB'),
 ('R0A 0G0','CARLOWRIE','MB'),
 ('R0A 0J0','DUFRESNE','MB'),
 ('R0A 0K0','DUFROST','MB'),
 ('R0A 0M0','GARDENTON','MB'),
 ('R0A 0N0','GIROUX','MB'),
 ('R0A 0P0','GREEN RIDGE','MB'),
 ('B0C 0A3','NEILS HARBOUR','NS'),
 ('B0C 0A4','ENGLISHTOWN','NS'),
 ('B0C 0A5','INGONISH','NS'),
 ('B0C 0A6','INGONISH BEACH','NS'),
 ('B0C 1C0','CAPE NORTH','NS'),
 ('B0C 1E0','CAPSTICK','NS'),
 ('B0C 1G0','DINGWALL','NS'),
 ('B0C 1P0','NEW HAVEN','NS'),
 ('B0C 1R0','ST MARGARET VILLAGE','NS'),
 ('B0E 0A3','JUDIQUE','NS'),
 ('B0E 0A5','WEST BAY','NS'),
 ('B0E 0A6','WHYCOCOMAGH','NS'),
 ('B0E 0A7','MABOU','NS'),
 ('B0E 0A8','ARICHAT','NS'),
 ('B0E 0A9','CLEVELAND','NS'),
 ('B0E 0B2','INVERNESS','NS'),
 ('B0E 0B3','WAGMATCOOK','NS'),
 ('B0E 0B4','GRAND ETANG','NS'),
 ('B0E 0B5','ST PETERS','NS'),
 ('B0E 0B8','WEST ARICHAT','NS'),
 ('B0E 0B9','D''ESCOUSSE','NS'),
 ('B0E 0C1','MARGAREE FORKS','NS');
 
 insert into Company (CompID, CompName, PostalCode, username) values (1, 'Gibson Group', 'J0T 2P0', 'loffiler0');
insert into Company (CompID, CompName, PostalCode, username) values (2, 'Cole-Emard', 'J7V 3C3', 'lebertz1');
insert into Company (CompID, CompName, PostalCode, username) values (3, 'Cole, Ruecker and West', 'J0X 3E0', 'wcasazza2');
insert into Company (CompID, CompName, PostalCode, username) values (4, 'Spencer, Hettinger and Cassin', 'G0R 3W0', 'vfletcher3');
insert into Company (CompID, CompName, PostalCode, username) values (5, 'Luettgen, Greenholt and Will', 'K0A 0C9', 'ameffin4');
insert into Company (CompID, CompName, PostalCode, username) values (6, 'Schroeder-Quigley', 'G0N 1C0', 'abaigent5');
insert into Company (CompID, CompName, PostalCode, username) values (7, 'Ullrich-Casper', 'J0M 1T0', 'baberhart6');
insert into Company (CompID, CompName, PostalCode, username) values (8, 'Stanton, Rohan and Bergstrom', 'E1G 3K2', 'dradeliffe7');
insert into Company (CompID, CompName, PostalCode, username) values (9, 'Conroy Group', 'G0K 1P0', 'shelian8');
insert into Company (CompID, CompName, PostalCode, username) values (10, 'Hilll Group', 'C0A 1G0', 'ishearstone9');
insert into Company (CompID, CompName, PostalCode, username) values (11, 'Prohaska LLC', 'G0W 2V0', 'sgooderea');
insert into Company (CompID, CompName, PostalCode, username) values (12, 'Pollich-Hane', 'X0A 0A9', 'hsclaterb');
insert into Company (CompID, CompName, PostalCode, username) values (13, 'Mills, Miller and Olson', 'E1H 0H7', 'cmayowc');
insert into Company (CompID, CompName, PostalCode, username) values (14, 'Durgan-Blanda', 'G0C 0E2', 'rlandord');
insert into Company (CompID, CompName, PostalCode, username) values (15, 'Ryan-Morar', 'X0C 0H0', 'kbroadye');
insert into Company (CompID, CompName, PostalCode, username) values (16, 'Auer, Wilderman and McLaughlin', 'A0A 0A7', 'edudhillf');
insert into Company (CompID, CompName, PostalCode, username) values (17, 'Kuphal-Fahey', 'A0A 0B2', 'hgoningg');
insert into Company (CompID, CompName, PostalCode, username) values (18, 'Collier LLC', 'J0J 0C2', 'ssilwoodh');
insert into Company (CompID, CompName, PostalCode, username) values (19, 'Hermann-Cole', 'X0E 0V0', 'abonnori');
insert into Company (CompID, CompName, PostalCode, username) values (20, 'Beatty, Mueller and Luettgen', 'J0N 0A6', 'sbunnj');


INSERT INTO `Contracts` (ContID,CompID,RespoID,AVC,IV,StartDate,Category,TypeOfService,FirstDeliv,SecondDeliv,ThirdDeliv,FourthDeliv,Rating) VALUES (1,17,55,69709.65,7601.07,'2018-02-22','Premium','On-premises','2018-02-25','2018-02-26','2018-08-09',null,2),
 (2,5,26,61579.3,11573.41,'2017-04-12','Gold','Cloud','2017-04-12','2017-04-14','2017-04-15',null,4),
 (3,15,17,67619.97,10504.1,'2017-12-14','Diamond','On-premises','2017-12-14','2017-12-17','2017-12-17',null,1),
 (4,10,50,82574.17,11965.6,'2018-07-25','Silver','Cloud','2018-07-31','2018-08-03','2018-08-11','2018-08-17',3),
 (5,8,27,81981.07,9015.76,'2017-11-17','Gold','On-premises','2017-11-17','2017-11-20','2017-11-20',null,4),
 (6,2,57,42834.56,6436.0,'2016-02-08','Premium','Cloud','2016-02-12','2016-02-13','2016-02-18',null,2),
 (7,12,11,90099.02,11914.67,'2017-07-18','Silver','On-premises','2017-07-18','2017-07-22','2017-07-28','2017-08-02',2),
 (8,15,50,85534.14,10678.58,'2017-10-23','Diamond','On-premises','2017-10-23','2017-10-27','2017-10-27',null,3),
 (9,8,48,33095.69,10586.41,'2017-09-21','Premium','On-premises','2017-09-21','2017-09-21','2017-09-26',null,2),
 (10,2,52,40331.38,7718.27,'2017-07-10','Gold','Cloud','2017-07-10','2017-07-14','2017-07-16',null,7),
 (11,13,15,75839.73,6584.09,'2016-07-06','Premium','On-premises','2016-07-08','2016-07-10','2016-07-10',null,1),
 (12,19,53,50772.93,5208.74,'2015-12-25','Silver','Cloud','2016-01-03','2016-01-06','2016-01-06','2016-01-12',3),
 (13,18,38,86676.76,9876.08,'2018-03-20','Premium','On-premises','2018-03-21','2018-03-21','2018-03-25',null,5),
 (14,7,16,102734.72,5096.46,'2015-02-19','Gold','Cloud','2015-02-27','2015-02-27','2015-03-03',null,3),
 (15,6,32,99726.49,7925.78,'2016-02-05','Premium','Cloud','2016-02-10','2016-02-12','2016-02-16',null,1),
 (16,5,23,50809.12,11352.66,'2015-03-11','Diamond','On-premises','2015-03-14','2015-03-16','2015-03-21',null,1),
 (17,14,7,93342.26,7659.7,'2015-05-05','Gold','On-premises','2015-05-12','2015-05-14','2015-05-15',null,2),
 (18,5,15,91595.71,11867.73,'2015-05-07','Silver','On-premises','2015-05-14','2015-05-17','2015-05-17','2015-05-25',4),
 (19,4,10,112276.25,7098.69,'2016-03-23','Gold','On-premises','2016-03-30','2016-04-02','2016-04-04',null,3),
 (20,15,48,94354.03,8377.82,'2015-05-03','Gold','Cloud','2015-05-10','2015-05-15','2015-05-17',null,5),
 (21,4,20,68382.76,9564.59,'2015-03-21','Silver','On-premises','2015-03-28','2015-03-30','2015-04-02','2015-04-09',1),
 (22,3,8,37005.45,5619.67,'2016-10-08','Diamond','Cloud','2016-10-13','2016-10-13','2016-10-18',null,1),
 (23,14,51,74942.12,7000.2,'2017-12-20','Premium','Cloud','2017-12-22','2017-12-22','2017-12-26',null,2),
 (24,20,28,109504.83,11689.84,'2018-01-26','Gold','On-premises','2018-02-07','2018-02-09','2018-02-09',null,1),
 (25,6,46,115034.85,7405.14,'2016-05-14','Premium','Cloud','2016-05-19','2016-05-20','2016-05-24',null,3),
 (26,2,1,88938.43,10000.0,'2016-09-21','Silver','On-premises','2016-09-28','2016-09-29','2016-09-29','2016-10-07',5),
 (27,15,10,47655.52,5680.61,'2017-03-02','Gold','On-premises','2017-03-02','2017-03-07','2017-03-08',null,1),
 (28,15,43,41147.73,11527.99,'2016-02-06','Gold','On-premises','2016-02-16','2016-02-20','2016-02-20',null,3),
 (29,19,6,38192.17,8591.19,'2015-05-20','Gold','On-premises','2015-05-30','2015-05-31','2015-06-04',null,2),
 (30,4,55,40090.72,6292.61,'2018-04-22','Premium','Cloud','2018-04-25','2018-04-25','2018-04-28',null,3),
 (31,11,14,99084.97,9534.54,'2017-05-10','Silver','On-premises','2017-05-10','2017-05-15','2017-05-22','2017-05-30',5),
 (32,13,16,117852.97,10980.15,'2017-12-14','Gold','Cloud','2017-12-14','2017-12-18','2017-12-19',null,5),
 (33,2,11,60390.02,11843.01,'2016-12-29','Diamond','On-premises','2017-01-05','2017-01-05','2017-01-10',null,5),
 (34,17,51,93369.94,5866.68,'2017-07-03','Diamond','On-premises','2017-07-07','2017-07-10','2017-07-13',null,2),
 (35,20,46,113696.8,6135.59,'2016-06-18','Silver','On-premises','2016-06-23','2016-06-24','2016-07-02','2016-07-08',4),
 (36,18,52,105193.64,6643.72,'2018-04-19','Diamond','Cloud','2018-04-26','2018-04-28','2018-05-04',null,2),
 (37,6,28,110094.74,6866.98,'2017-10-03','Premium','Cloud','2017-10-07','2017-10-07','2017-10-11',null,3),
 (38,15,33,68756.9,7114.85,'2017-08-14','Diamond','Cloud','2017-08-21','2017-08-21','2017-08-23',null,1),
 (39,5,31,91014.6,10235.75,'2018-08-03','Silver','Cloud','2018-08-11','2018-08-18','2018-08-19','2018-08-27',2),
 (40,17,60,36486.28,11441.81,'2015-05-09','Gold','On-premises','2015-05-16','2015-05-20','2015-05-21',null,2),
 (41,10,58,70261.09,6579.81,'2016-09-12','Silver','On-premises','2016-09-19','2016-09-25','2016-09-25','2016-10-02',4),
 (42,7,5,93905.82,6828.51,'2018-03-06','Premium','On-premises','2018-03-09','2018-03-10','2018-03-15',null,5),
 (43,12,59,82990.1,9228.59,'2015-04-10','Diamond','Cloud','2015-04-16','2015-04-18','2015-04-19',null,5),
 (44,13,40,37792.83,11621.34,'2015-12-28','Premium','Cloud','2015-12-29','2015-12-29','2015-12-31',null,4),
 (45,19,35,83265.73,7464.75,'2017-05-22','Diamond','Cloud','2017-05-26','2017-05-26','2017-06-02',null,1),
 (46,19,27,109767.25,8959.63,'2016-09-05','Gold','On-premises','2016-09-13','2016-09-14','2016-09-18',null,4),
 (47,19,58,118853.9,11817.89,'2017-04-01','Premium','On-premises','2017-04-04','2017-04-06','2017-04-06',null,1),
 (48,6,7,90547.32,10302.05,'2017-04-15','Diamond','On-premises','2017-04-20','2017-04-23','2017-04-25',null,2),
 (49,18,19,45003.1,6742.45,'2016-03-14','Diamond','Cloud','2016-03-20','2016-03-23','2016-03-29',null,5),
 (50,5,27,70941.07,10171.7,'2016-05-27','Premium','Cloud','2016-05-29','2016-05-31','2016-06-01',null,2),
 (51,6,37,74827.05,11266.31,'2017-09-28','Silver','On-premises','2017-09-28','2017-09-30','2017-10-01','2017-10-07',5),
 (52,17,14,32830.8,11933.55,'2017-11-18','Diamond','Cloud','2017-11-23','2017-11-23','2017-11-28',null,1),
 (53,10,33,76223.77,6085.4,'2017-12-06','Gold','On-premises','2017-12-06','2017-12-09','2017-12-12',null,1),
 (54,16,21,70897.98,8552.13,'2016-07-28','Silver','Cloud','2016-08-04','2016-08-08','2016-08-12','2016-08-20',3),
 (55,6,35,52858.8,8890.63,'2016-12-28','Silver','On-premises','2017-01-07','2017-01-11','2017-01-18','2017-01-24',5),
 (56,5,42,62484.0,7105.32,'2016-10-23','Premium','On-premises','2016-10-26','2016-10-27','2016-10-28',null,4),
 (57,6,59,89607.26,10831.28,'2016-01-13','Premium','On-premises','2016-01-18','2016-01-19','2016-01-23',null,4),
 (58,12,47,79690.19,11901.64,'2015-05-26','Silver','On-premises','2015-06-03','2015-06-08','2015-06-13','2015-06-20',5),
 (59,6,53,64803.04,5088.71,'2017-06-19','Silver','Cloud','2017-06-19','2017-06-24','2017-07-02','2017-07-08',2),
 (60,12,17,43266.65,5000.64,'2017-10-24','Diamond','Cloud','2017-10-30','2017-11-02','2017-11-08',null,1),
 (61,2,21,95289.5,5255.44,'2017-09-13','Diamond','On-premises','2017-09-20','2017-09-22','2017-09-24',null,5),
 (62,1,11,89152.95,9176.41,'2017-11-21','Gold','On-premises','2017-11-21','2017-11-24','2017-11-27',null,0),
 (63,5,18,51710.18,5629.76,'2015-02-28','Premium','On-premises','2015-03-02','2015-03-02','2015-03-07',null,1),
 (64,13,58,108380.51,10252.68,'2017-02-01','Silver','Cloud','2017-02-01','2017-02-05','2017-02-09','2017-02-17',4),
 (65,10,46,50483.47,11905.81,'2015-05-24','Gold','Cloud','2015-05-31','2015-06-03','2015-06-04',null,5),
 (66,18,51,40243.9,5051.61,'2016-10-12','Silver','On-premises','2016-10-18','2016-10-21','2016-10-29','2016-11-05',3),
 (67,10,5,55813.64,7782.66,'2015-04-10','Diamond','Cloud','2015-04-14','2015-04-15','2015-04-17',null,2),
 (68,20,3,107961.92,9971.44,'2016-09-03','Silver','On-premises','2016-09-08','2016-09-11','2016-09-15','2016-09-20',4),
 (69,4,5,94486.18,10652.71,'2018-07-30','Diamond','On-premises','2018-08-04','2018-08-07','2018-08-11',null,3),
 (70,16,55,77096.89,5038.92,'2016-10-20','Diamond','On-premises','2016-10-24','2016-10-26','2016-10-28',null,1),
 (71,12,55,101797.82,8450.9,'2015-10-03','Silver','On-premises','2015-10-13','2015-10-14','2015-10-15','2015-10-22',1),
 (72,4,46,50554.66,6600.66,'2015-12-09','Premium','Cloud','2015-12-11','2015-12-11','2015-12-15',null,4),
 (73,7,23,51596.5,5337.49,'2016-02-27','Premium','On-premises','2016-02-28','2016-02-29','2016-03-02',null,5),
 (74,12,12,116638.27,6058.4,'2015-03-19','Silver','On-premises','2015-03-28','2015-04-04','2015-04-06','2015-04-11',3),
 (75,4,57,98995.61,7851.6,'2018-07-31','Gold','Cloud','2018-08-09','2018-08-10','2018-08-13',null,5),
 (76,7,6,60392.27,9999.86,'2018-07-28','Silver','On-premises','2018-08-04','2018-08-11','2018-08-13','2018-08-18',5),
 (77,1,5,57710.95,10746.8,'2016-05-22','Silver','On-premises','2016-05-27','2016-05-30','2016-06-05','2016-06-11',1),
 (78,10,29,34197.5,7630.52,'2016-06-09','Diamond','On-premises','2016-06-14','2016-06-14','2016-06-19',null,2),
 (79,11,10,77639.57,5808.38,'2018-07-11','Gold','Cloud','2018-07-19','2018-07-19','2018-07-22',null,4),
 (80,9,53,80054.65,9834.47,'2017-12-07','Premium','On-premises','2017-12-12','2017-12-14','2017-12-14',null,5),
 (81,10,15,113809.22,6555.51,'2015-11-29','Gold','On-premises','2015-12-08','2015-12-13','2015-12-15',null,4),
 (82,12,48,83676.67,11763.93,'2016-02-02','Diamond','Cloud','2016-02-05','2016-02-06','2016-02-10',null,1),
 (83,2,10,77198.24,9357.0,'2016-01-04','Diamond','On-premises','2016-01-09','2016-01-11','2016-01-15',null,2),
 (84,19,33,50885.4,5815.94,'2018-01-20','Premium','On-premises','2018-01-25','2018-01-26','2018-01-29',null,3),
 (85,8,59,38441.56,5106.51,'2016-09-08','Diamond','On-premises','2016-09-15','2016-09-17','2016-09-22',null,4),
 (86,3,49,46159.01,9686.38,'2016-09-26','Silver','Cloud','2016-10-06','2016-10-10','2016-10-12','2016-10-20',5),
 (87,17,48,46308.54,9451.02,'2017-10-12','Silver','On-premises','2017-10-12','2017-10-19','2017-10-22','2017-10-30',4),
 (88,16,20,53359.26,7075.24,'2017-04-06','Gold','Cloud','2017-04-06','2017-04-06','2017-04-08',null,1),
 (89,18,45,33374.25,10081.32,'2017-07-02','Diamond','Cloud','2017-07-08','2017-07-10','2017-07-15',null,1),
 (90,3,26,82134.86,5502.81,'2015-10-18','Premium','Cloud','2015-10-19','2015-10-20','2015-10-20',null,4),
 (91,11,9,83475.72,9000.18,'2015-08-09','Diamond','Cloud','2015-08-16','2015-08-19','2015-08-20',null,1),
 (92,18,55,84245.21,7165.46,'2016-02-23','Silver','On-premises','2016-03-04','2016-03-08','2016-03-15','2016-03-22',3),
 (93,11,50,58384.06,5057.91,'2016-10-14','Gold','On-premises','2016-10-25','2016-10-25','2016-10-25',null,3),
 (94,16,1,35622.2,6872.96,'2015-02-11','Gold','Cloud','2015-02-22','2015-02-25','2015-02-26',null,4),
 (95,18,17,54741.61,5114.5,'2016-04-21','Silver','Cloud','2016-04-28','2016-05-05','2016-05-07','2016-05-14',3),
 (96,16,14,67847.75,7999.26,'2017-12-12','Silver','On-premises','2017-12-12','2017-12-12','2017-12-13','2017-12-20',2),
 (97,5,11,58142.96,5920.85,'2016-05-17','Diamond','On-premises','2016-05-20','2016-05-21','2016-05-27',null,4),
 (98,12,32,91834.87,6747.62,'2015-09-15','Silver','Cloud','2015-09-25','2015-09-25','2015-09-25','2015-10-03',4),
 (99,6,38,53933.19,10452.74,'2017-06-17','Premium','On-premises','2017-06-20','2017-06-20','2017-06-25',null,4),
 (100,9,36,59992.06,8568.14,'2018-04-22','Gold','On-premises','2018-05-02','2018-05-04','2018-05-07',null,5),
 (101,18,42,92292.87,6934.43,'2018-06-20','Diamond','On-premises','2018-06-26','2018-06-27','2018-06-27',null,1),
 (102,11,12,103112.84,8247.14,'2017-04-12','Premium','Cloud','2017-04-17','2017-04-18','2017-04-23',null,4),
 (103,20,25,75713.5,5928.37,'2017-10-07','Premium','Cloud','2017-10-09','2017-10-09','2017-10-09',null,5),
 (104,19,9,97420.27,10005.79,'2017-08-13','Gold','On-premises','2017-08-13','2017-08-18','2017-08-21',null,3),
 (105,18,18,102393.31,7037.06,'2015-03-22','Diamond','Cloud','2015-03-29','2015-03-29','2015-04-02',null,4),
 (106,16,60,40391.75,10100.18,'2017-02-10','Diamond','On-premises','2017-02-16','2017-02-16','2017-02-21',null,3),
 (107,12,10,64055.11,9137.85,'2018-08-03','Diamond','Cloud','2018-08-10','2018-08-11','2018-08-17',null,2),
 (108,1,13,50659.94,5675.56,'2015-03-16','Premium','On-premises','2015-03-17','2015-03-19','2015-03-22',null,4),
 (109,18,42,89552.67,8380.42,'2015-01-23','Premium','On-premises','2015-01-26','2015-01-26','2015-01-31',null,2),
 (110,7,42,34836.64,6946.7,'2017-03-02','Diamond','Cloud','2017-03-07','2017-03-09','2017-03-16',null,3),
 (111,16,27,69464.98,8118.98,'2017-10-17','Diamond','On-premises','2017-10-24','2017-10-25','2017-10-29',null,4),
 (112,8,33,113712.55,8174.49,'2016-07-13','Premium','Cloud','2016-07-14','2016-07-16','2016-07-16',null,2),
 (113,3,34,53876.01,5248.06,'2018-02-05','Diamond','Cloud','2018-02-12','2018-02-12','2018-02-13',null,3),
 (114,5,43,69088.32,8729.05,'2016-02-25','Gold','Cloud','2016-03-07','2016-03-07','2016-03-10',null,2),
 (115,18,19,97605.51,7010.62,'2016-09-20','Gold','Cloud','2016-09-30','2016-10-04','2016-10-06',null,2),
 (116,5,39,38894.87,5295.82,'2016-07-20','Gold','Cloud','2016-07-28','2016-07-31','2016-08-02',null,1),
 (117,13,7,37248.26,8091.06,'2017-02-27','Gold','On-premises','2017-02-27','2017-03-02','2017-03-04',null,5),
 (118,9,12,115317.44,5723.23,'2015-05-10','Premium','Cloud','2015-05-15','2015-05-15','2015-05-15',null,3),
 (119,17,33,59859.53,11980.28,'2016-04-12','Diamond','On-premises','2016-04-17','2016-04-21','2016-04-22',null,4),
 (120,17,35,114978.61,6663.71,'2015-12-14','Gold','On-premises','2015-12-24','2015-12-27','2015-12-28',null,2),
 (121,3,12,62302.91,7758.1,'2016-03-15','Premium','On-premises','2016-03-19','2016-03-21','2016-03-24',null,2),
 (122,17,43,103324.26,9387.81,'2017-03-29','Silver','Cloud','2017-03-29','2017-04-05','2017-04-08','2017-04-16',2),
 (123,9,4,45768.71,5886.25,'2018-01-21','Gold','Cloud','2018-01-29','2018-01-31','2018-02-02',null,3),
 (124,19,7,70226.0,6464.79,'2015-02-08','Premium','On-premises','2015-02-12','2015-02-12','2015-02-12',null,3),
 (125,20,22,103674.32,10249.6,'2017-08-13','Gold','On-premises','2017-08-13','2017-08-17','2017-08-21',null,3),
 (126,13,37,63847.96,11632.95,'2015-05-17','Gold','Cloud','2015-05-27','2015-05-28','2015-05-28',null,4),
 (127,2,41,104658.44,8347.85,'2016-03-31','Diamond','Cloud','2016-04-07','2016-04-10','2016-04-16',null,2),
 (128,9,4,77936.9,6265.4,'2016-08-09','Gold','On-premises','2016-08-20','2016-08-20','2016-08-24',null,5),
 (129,13,55,76286.84,8626.89,'2016-04-09','Gold','Cloud','2016-04-16','2016-04-21','2016-04-23',null,3),
 (130,4,59,63394.26,8822.8,'2017-02-05','Premium','Cloud','2017-02-07','2017-02-09','2017-02-12',null,5),
 (131,10,15,102515.98,11457.83,'2017-12-31','Premium','On-premises','2018-01-01','2018-01-02','2018-01-06',null,5),
 (132,8,28,42929.18,8439.71,'2018-01-16','Silver','Cloud','2018-01-24','2018-01-25','2018-01-30','2018-02-06',1),
 (133,15,5,58122.82,9902.23,'2015-12-21','Premium','On-premises','2015-12-22','2015-12-22','2015-12-26',null,5),
 (134,8,40,30401.44,5495.67,'2017-02-04','Diamond','Cloud','2017-02-10','2017-02-13','2017-02-16',null,4),
 (135,12,42,109001.57,9586.33,'2017-08-24','Gold','Cloud','2017-08-24','2017-08-27','2017-08-27',null,3),
 (136,3,10,77790.82,10716.49,'2015-12-23','Diamond','Cloud','2015-12-29','2015-12-30','2016-01-04',null,5),
 (137,5,9,105610.68,8853.59,'2016-09-17','Diamond','On-premises','2016-09-20','2016-09-22','2016-09-24',null,3),
 (138,16,20,71675.14,8445.61,'2016-07-18','Diamond','Cloud','2016-07-25','2016-07-28','2016-08-01',null,4),
 (139,6,4,106153.84,11962.16,'2017-08-01','Diamond','Cloud','2017-08-05','2017-08-05','2017-08-12',null,3),
 (140,8,47,77023.86,5547.82,'2017-01-25','Silver','Cloud','2017-01-25','2017-01-26','2017-01-29','2017-02-04',4),
 (141,8,4,108628.16,8488.11,'2016-10-24','Diamond','On-premises','2016-10-31','2016-11-01','2016-11-05',null,5),
 (142,12,19,112593.74,11383.18,'2016-04-06','Premium','Cloud','2016-04-10','2016-04-12','2016-04-12',null,1),
 (143,20,5,51523.08,5976.77,'2017-06-23','Diamond','Cloud','2017-06-26','2017-06-27','2017-06-27',null,4),
 (144,11,15,63392.3,9055.43,'2016-10-30','Gold','On-premises','2016-11-11','2016-11-14','2016-11-15',null,4),
 (145,15,47,54520.3,10396.23,'2016-02-24','Diamond','Cloud','2016-02-27','2016-02-29','2016-03-04',null,3),
 (146,16,15,63804.89,7805.22,'2018-06-04','Silver','Cloud','2018-06-09','2018-06-11','2018-06-18','2018-06-24',5),
 (147,1,4,47886.22,10193.05,'2016-10-08','Diamond','Cloud','2016-10-13','2016-10-16','2016-10-19',null,4),
 (148,7,6,68047.06,5163.45,'2016-07-05','Diamond','On-premises','2016-07-10','2016-07-13','2016-07-16',null,4),
 (149,3,57,108166.38,11450.3,'2016-07-25','Diamond','On-premises','2016-07-30','2016-08-03','2016-08-07',null,5),
 (150,5,26,80235.42,9591.66,'2018-06-30','Diamond','Cloud','2018-07-05','2018-07-08','2018-07-08',null,2),
 (151,6,5,60913.32,8423.95,'2016-08-28','Diamond','On-premises','2016-08-31','2016-09-04','2016-09-10',null,2),
 (152,18,41,38328.11,6684.09,'2017-01-20','Diamond','On-premises','2017-01-25','2017-01-29','2017-01-29',null,5),
 (153,11,4,53178.71,6317.05,'2016-03-21','Silver','Cloud','2016-03-30','2016-04-02','2016-04-03','2016-04-09',5),
 (154,11,57,117774.38,8905.99,'2016-01-13','Premium','On-premises','2016-01-14','2016-01-16','2016-01-20',null,3),
 (155,19,36,70990.21,11130.27,'2018-03-23','Silver','Cloud','2018-04-02','2018-04-06','2018-04-09','2018-04-14',4),
 (156,12,25,107269.0,6804.29,'2017-06-07','Diamond','On-premises','2017-06-14','2017-06-18','2017-06-22',null,5),
 (157,6,38,97702.58,8316.58,'2015-04-27','Silver','On-premises','2015-05-07','2015-05-09','2015-05-15','2015-05-20',1),
 (158,18,26,80725.1,9402.82,'2015-05-01','Gold','Cloud','2015-05-09','2015-05-13','2015-05-16',null,5),
 (159,13,23,101536.0,9734.02,'2016-05-26','Diamond','On-premises','2016-06-02','2016-06-05','2016-06-12',null,5),
 (160,19,4,108125.3,5253.48,'2017-05-22','Silver','Cloud','2017-05-22','2017-05-26','2017-06-01','2017-06-08',4),
 (161,19,58,115692.21,6098.54,'2018-05-14','Gold','Cloud','2018-05-25','2018-05-25','2018-05-29',null,4),
 (162,3,48,84858.69,9417.38,'2017-03-14','Premium','Cloud','2017-03-19','2017-03-21','2017-03-25',null,2),
 (163,10,9,55187.96,11248.78,'2015-08-22','Gold','Cloud','2015-09-03','2015-09-08','2015-09-12',null,4),
 (164,4,10,59733.73,11956.38,'2016-11-17','Silver','On-premises','2016-11-27','2016-12-03','2016-12-03','2016-12-11',4),
 (165,14,49,56158.91,5100.38,'2018-01-28','Premium','On-premises','2018-01-31','2018-01-31','2018-02-03',null,5),
 (166,13,39,93270.14,11985.89,'2016-01-26','Gold','On-premises','2016-02-07','2016-02-12','2016-02-16',null,3),
 (167,11,27,116063.36,6672.87,'2015-05-02','Gold','On-premises','2015-05-09','2015-05-10','2015-05-13',null,3),
 (168,15,51,67352.08,10072.04,'2015-03-02','Silver','Cloud','2015-03-09','2015-03-11','2015-03-15','2015-03-23',5),
 (169,2,41,64306.46,6468.3,'2017-07-12','Silver','On-premises','2017-07-12','2017-07-17','2017-07-20','2017-07-27',5),
 (170,20,39,80448.12,7113.55,'2015-01-04','Premium','Cloud','2015-01-05','2015-01-06','2015-01-11',null,1),
 (171,13,39,59700.68,7762.93,'2015-05-28','Gold','On-premises','2015-06-09','2015-06-10','2015-06-11',null,5),
 (172,18,23,32263.03,7640.13,'2015-12-30','Silver','On-premises','2016-01-08','2016-01-08','2016-01-09','2016-01-15',5),
 (173,11,16,70663.43,8984.72,'2017-11-16','Premium','On-premises','2017-11-20','2017-11-22','2017-11-24',null,4),
 (174,9,38,81221.96,8999.14,'2017-04-03','Gold','On-premises','2017-04-03','2017-04-08','2017-04-08',null,4),
 (175,17,14,85623.25,10529.98,'2018-07-23','Premium','On-premises','2018-07-25','2018-07-26','2018-07-31',null,3),
 (176,9,10,69263.0,7826.96,'2017-08-12','Premium','Cloud','2017-08-14','2017-08-16','2017-08-18',null,4),
 (177,1,12,63365.06,10109.12,'2016-07-02','Silver','On-premises','2016-07-08','2016-07-14','2016-07-21','2016-07-26',2),
 (178,9,11,36596.12,7817.59,'2017-02-10','Gold','On-premises','2017-02-10','2017-02-10','2017-02-14',null,3),
 (179,8,26,74231.55,9973.51,'2015-01-11','Gold','On-premises','2015-01-22','2015-01-23','2015-01-23',null,5),
 (180,17,29,101261.86,7352.0,'2016-02-19','Silver','On-premises','2016-02-25','2016-02-26','2016-03-03','2016-03-11',2),
 (181,11,40,114968.37,7575.56,'2018-06-28','Diamond','On-premises','2018-07-04','2018-07-04','2018-07-06',null,2),
 (182,12,48,77243.65,7896.06,'2015-11-25','Gold','On-premises','2015-12-04','2015-12-08','2015-12-11',null,5),
 (183,4,16,82385.93,8010.84,'2018-02-03','Diamond','Cloud','2018-02-06','2018-02-06','2018-02-06',null,5),
 (184,19,49,117627.98,6004.3,'2015-12-15','Silver','Cloud','2015-12-21','2015-12-26','2015-12-31','2016-01-07',1),
 (185,18,48,99791.17,6251.28,'2015-11-02','Premium','On-premises','2015-11-07','2015-11-07','2015-11-08',null,2),
 (186,15,30,48519.26,9995.39,'2015-01-05','Silver','Cloud','2015-01-10','2015-01-12','2015-01-20','2015-01-27',2),
 (187,7,50,57791.79,8655.44,'2017-04-23','Premium','Cloud','2017-04-27','2017-04-29','2017-04-29',null,4),
 (188,11,56,57832.27,10761.14,'2015-05-22','Gold','Cloud','2015-05-30','2015-05-31','2015-06-03',null,4),
 (189,4,30,59826.72,10163.25,'2016-01-08','Silver','On-premises','2016-01-16','2016-01-16','2016-01-23','2016-01-30',3),
 (190,2,33,84369.66,7233.14,'2016-05-05','Gold','On-premises','2016-05-17','2016-05-18','2016-05-18',null,4),
 (191,5,39,76773.6,6467.91,'2015-08-05','Gold','On-premises','2015-08-15','2015-08-16','2015-08-18',null,4),
 (192,20,56,83074.63,11036.89,'2016-08-14','Silver','Cloud','2016-08-23','2016-08-25','2016-08-30','2016-09-05',4),
 (193,16,18,98162.05,9015.76,'2015-12-18','Premium','Cloud','2015-12-21','2015-12-23','2015-12-27',null,3),
 (194,14,15,97818.55,7025.15,'2016-05-07','Diamond','On-premises','2016-05-13','2016-05-13','2016-05-15',null,2),
 (195,9,57,110581.5,9439.9,'2017-07-06','Silver','On-premises','2017-07-06','2017-07-09','2017-07-15','2017-07-23',1),
 (196,2,29,110016.57,5704.98,'2017-02-13','Premium','On-premises','2017-02-15','2017-02-17','2017-02-17',null,2),
 (197,2,60,100053.46,10379.94,'2015-03-26','Diamond','On-premises','2015-04-01','2015-04-04','2015-04-05',null,2),
 (198,13,4,71786.03,5239.11,'2015-03-21','Diamond','On-premises','2015-03-28','2015-03-30','2015-04-05',null,4),
 (199,10,55,86725.45,8843.71,'2018-03-23','Diamond','On-premises','2018-03-26','2018-03-26','2018-04-02',null,2),
 (200,4,54,80058.09,10772.0,'2017-02-14','Silver','Cloud','2017-02-14','2017-02-15','2017-02-19','2017-02-24',4),
 (201,18,54,96984.28,6722.01,'2016-01-20','Diamond','On-premises','2016-01-26','2016-01-29','2016-02-02',null,3),
 (202,18,41,94085.08,5939.64,'2018-07-16','Gold','Cloud','2018-07-28','2018-07-28','2018-07-31',null,4),
 (203,14,8,95541.66,9705.39,'2016-12-30','Diamond','Cloud','2017-01-06','2017-01-08','2017-01-11',null,4),
 (204,7,8,119015.51,9234.69,'2018-07-18','Silver','On-premises','2018-07-26','2018-07-29','2018-07-31','2018-08-05',1),
 (205,9,55,109216.74,11654.31,'2015-04-24','Diamond','Cloud','2015-04-29','2015-05-03','2015-05-08',null,4),
 (206,1,27,109692.49,10472.98,'2015-12-22','Silver','Cloud','2015-12-28','2015-12-31','2015-12-31','2016-01-08',3),
 (207,1,10,106366.6,6359.7,'2017-01-28','Premium','Cloud','2017-01-29','2017-01-30','2017-02-04',null,1),
 (208,1,54,107873.7,7450.65,'2015-02-21','Gold','On-premises','2015-03-01','2015-03-01','2015-03-01',null,2),
 (209,2,42,67661.97,5167.93,'2017-02-15','Silver','Cloud','2017-02-15','2017-02-15','2017-02-17','2017-02-23',2),
 (210,3,31,119735.25,10196.68,'2018-04-28','Premium','Cloud','2018-05-01','2018-05-02','2018-05-06',null,2),
 (211,10,26,89093.92,9509.38,'2015-05-14','Gold','On-premises','2015-05-21','2015-05-26','2015-05-28',null,1),
 (212,1,18,68619.27,9602.26,'2015-03-20','Silver','Cloud','2015-03-25','2015-03-31','2015-04-05','2015-04-13',3),
 (213,12,57,88042.66,9757.02,'2018-02-25','Diamond','Cloud','2018-02-28','2018-03-04','2018-03-08',null,1),
 (214,5,54,36711.96,10587.64,'2016-10-03','Diamond','On-premises','2016-10-10','2016-10-14','2016-10-20',null,2),
 (215,3,14,99574.6,5483.72,'2016-01-29','Premium','Cloud','2016-02-01','2016-02-01','2016-02-06',null,4),
 (216,1,22,37061.1,11194.36,'2016-11-16','Gold','Cloud','2016-11-25','2016-11-27','2016-11-29',null,8),
 (217,5,28,87695.53,11448.86,'2015-12-11','Gold','Cloud','2015-12-19','2015-12-20','2015-12-20',null,4),
 (218,18,52,88532.2,7187.33,'2017-09-26','Gold','Cloud','2017-09-26','2017-09-29','2017-10-02',null,1),
 (219,19,23,75776.81,10044.39,'2018-03-23','Gold','On-premises','2018-04-01','2018-04-02','2018-04-06',null,5),
 (220,18,3,38181.87,5454.04,'2015-06-28','Diamond','Cloud','2015-07-01','2015-07-05','2015-07-07',null,5),
 (221,16,38,47268.55,6975.77,'2017-05-27','Diamond','On-premises','2017-06-02','2017-06-06','2017-06-12',null,4),
 (222,18,49,78855.44,6875.19,'2015-02-23','Silver','Cloud','2015-03-02','2015-03-09','2015-03-13','2015-03-19',4),
 (223,5,31,31296.88,9264.51,'2016-05-26','Premium','Cloud','2016-05-31','2016-06-01','2016-06-02',null,1),
 (224,7,30,105770.78,7426.63,'2018-03-30','Premium','Cloud','2018-04-02','2018-04-02','2018-04-07',null,4),
 (225,6,48,76756.68,5870.96,'2017-10-23','Diamond','On-premises','2017-10-29','2017-10-31','2017-11-04',null,5),
 (226,3,41,101197.81,7259.14,'2016-09-26','Diamond','Cloud','2016-09-29','2016-10-03','2016-10-09',null,5),
 (227,4,10,72777.72,10038.08,'2016-08-23','Gold','Cloud','2016-09-03','2016-09-03','2016-09-03',null,2),
 (228,8,27,62429.49,10523.65,'2016-07-09','Silver','On-premises','2016-07-14','2016-07-15','2016-07-22','2016-07-29',2),
 (229,5,7,39205.52,7911.73,'2015-06-11','Premium','On-premises','2015-06-15','2015-06-16','2015-06-20',null,3),
 (230,2,5,57733.49,9699.07,'2016-03-03','Premium','On-premises','2016-03-05','2016-03-07','2016-03-09',null,4),
 (231,14,9,109635.39,8821.34,'2017-01-15','Premium','On-premises','2017-01-20','2017-01-20','2017-01-21',null,5),
 (232,5,23,64316.71,8128.04,'2018-03-10','Gold','On-premises','2018-03-17','2018-03-18','2018-03-19',null,2),
 (233,11,11,47654.17,5885.53,'2017-04-04','Gold','Cloud','2017-04-04','2017-04-06','2017-04-07',null,4),
 (234,8,51,72717.93,10197.72,'2017-11-12','Premium','On-premises','2017-11-14','2017-11-15','2017-11-18',null,5),
 (235,12,10,117361.64,8177.44,'2016-01-06','Diamond','On-premises','2016-01-09','2016-01-13','2016-01-14',null,3),
 (236,8,9,104139.62,11141.36,'2017-07-15','Gold','Cloud','2017-07-15','2017-07-17','2017-07-18',null,5),
 (237,2,29,42181.86,5689.57,'2017-05-17','Silver','Cloud','2017-05-17','2017-05-18','2017-05-20','2017-05-26',3),
 (238,15,10,67078.62,7301.19,'2015-09-17','Gold','Cloud','2015-09-29','2015-10-01','2015-10-03',null,2),
 (239,4,9,90720.02,9495.62,'2017-03-09','Diamond','On-premises','2017-03-16','2017-03-18','2017-03-24',null,2),
 (240,16,44,51013.54,5379.0,'2015-04-02','Diamond','On-premises','2015-04-07','2015-04-07','2015-04-09',null,3),
 (241,3,41,75977.14,5733.99,'2016-04-21','Silver','Cloud','2016-04-27','2016-05-02','2016-05-04','2016-05-11',1),
 (242,13,46,35935.43,7875.17,'2015-07-29','Premium','On-premises','2015-07-30','2015-07-31','2015-08-01',null,4),
 (243,7,1,88666.73,10434.23,'2017-10-31','Premium','Cloud','2017-11-01','2017-11-03','2017-11-08',null,3),
 (244,10,59,33169.75,10321.57,'2016-06-02','Gold','Cloud','2016-06-11','2016-06-11','2016-06-13',null,3),
 (245,15,39,53097.77,7996.43,'2018-07-16','Gold','Cloud','2018-07-28','2018-07-30','2018-08-03',null,5),
 (246,19,2,43278.79,7310.28,'2015-10-13','Diamond','On-premises','2015-10-19','2015-10-19','2015-10-21',null,4),
 (247,14,20,64211.98,9730.55,'2015-09-06','Silver','Cloud','2015-09-13','2015-09-16','2015-09-21','2015-09-27',5),
 (248,13,52,68604.94,10134.7,'2015-08-24','Premium','Cloud','2015-08-29','2015-08-30','2015-09-01',null,4),
 (249,9,2,78778.14,9917.3,'2016-09-18','Premium','Cloud','2016-09-19','2016-09-21','2016-09-25',null,3),
 (250,20,43,63951.78,6707.17,'2018-03-16','Silver','On-premises','2018-03-22','2018-03-29','2018-04-01','2018-04-08',1),
 (251,12,45,32560.4,6086.25,'2017-07-01','Premium','On-premises','2017-07-04','2017-07-06','2017-07-08',null,3),
 (252,17,32,102118.66,6806.56,'2016-07-19','Gold','Cloud','2016-07-28','2016-07-31','2016-08-01',null,4),
 (253,17,14,95519.91,6495.13,'2017-06-24','Gold','On-premises','2017-06-24','2017-06-27','2017-06-28',null,4),
 (254,1,7,53917.94,8072.45,'2015-05-14','Premium','On-premises','2015-05-16','2015-05-17','2015-05-21',null,1),
 (255,2,15,45446.39,6914.0,'2017-06-02','Gold','Cloud','2017-06-02','2017-06-05','2017-06-05',null,1),
 (256,11,24,45933.07,11285.7,'2018-06-10','Premium','Cloud','2018-06-15','2018-06-15','2018-06-19',null,2),
 (257,20,23,55835.82,7259.38,'2018-03-27','Gold','Cloud','2018-04-07','2018-04-11','2018-04-14',null,4),
 (258,7,32,41233.31,7845.05,'2016-01-14','Gold','Cloud','2016-01-23','2016-01-24','2016-01-24',null,5),
 (259,9,53,107030.75,5248.13,'2017-10-22','Diamond','On-premises','2017-10-25','2017-10-27','2017-11-02',null,3),
 (260,3,27,35401.06,8466.61,'2015-07-11','Silver','Cloud','2015-07-20','2015-07-21','2015-07-24','2015-07-31',1),
 (261,6,6,94576.75,11513.79,'2016-08-16','Gold','Cloud','2016-08-28','2016-08-29','2016-08-31',null,2),
 (262,6,8,98479.14,9929.68,'2017-12-19','Premium','On-premises','2017-12-22','2017-12-24','2017-12-24',null,2),
 (263,10,26,91172.69,7536.4,'2015-08-21','Diamond','On-premises','2015-08-27','2015-08-29','2015-09-01',null,1),
 (264,17,43,62317.88,6203.15,'2018-04-26','Silver','Cloud','2018-05-05','2018-05-12','2018-05-16','2018-05-22',2),
 (265,14,18,42862.34,8747.06,'2016-02-10','Premium','On-premises','2016-02-12','2016-02-14','2016-02-14',null,4),
 (266,18,13,113566.55,6183.77,'2017-02-12','Premium','On-premises','2017-02-14','2017-02-14','2017-02-19',null,3),
 (267,7,8,101239.55,7055.02,'2015-05-05','Gold','On-premises','2015-05-16','2015-05-20','2015-05-21',null,3),
 (268,14,52,61296.81,5955.18,'2016-04-27','Diamond','Cloud','2016-05-03','2016-05-05','2016-05-12',null,2),
 (269,10,39,84487.85,9116.34,'2016-08-18','Premium','On-premises','2016-08-20','2016-08-20','2016-08-20',null,4),
 (270,6,22,116868.85,7770.82,'2016-03-26','Gold','On-premises','2016-04-06','2016-04-08','2016-04-12',null,5),
 (271,8,18,99759.92,11245.67,'2017-03-14','Diamond','On-premises','2017-03-17','2017-03-19','2017-03-21',null,5),
 (272,3,35,51429.52,11320.86,'2018-03-09','Silver','On-premises','2018-03-18','2018-03-19','2018-03-21','2018-03-26',4),
 (273,15,59,61208.39,5575.9,'2017-07-10','Premium','Cloud','2017-07-15','2017-07-15','2017-07-18',null,1),
 (274,13,38,97849.02,7446.15,'2015-08-18','Diamond','Cloud','2015-08-25','2015-08-27','2015-09-01',null,1),
 (275,12,5,73415.55,9775.32,'2016-03-09','Premium','Cloud','2016-03-11','2016-03-13','2016-03-16',null,2),
 (276,6,23,31485.57,11294.46,'2017-07-27','Diamond','Cloud','2017-07-31','2017-08-02','2017-08-05',null,2),
 (277,16,9,44621.04,7158.68,'2017-12-14','Diamond','On-premises','2017-12-21','2017-12-22','2017-12-28',null,4),
 (278,7,46,116458.45,8862.72,'2018-05-11','Silver','Cloud','2018-05-20','2018-05-25','2018-05-30','2018-06-04',4),
 (279,9,10,30825.73,9819.41,'2017-04-03','Silver','On-premises','2017-04-03','2017-04-09','2017-04-17','2017-04-23',1),
 (280,13,31,107131.47,7163.75,'2016-09-14','Premium','On-premises','2016-09-15','2016-09-15','2016-09-16',null,5),
 (281,19,44,109755.89,6004.44,'2017-01-10','Silver','Cloud','2017-01-10','2017-01-13','2017-01-17','2017-01-24',2),
 (282,14,5,40654.57,6733.11,'2015-01-30','Premium','On-premises','2015-02-01','2015-02-01','2015-02-02',null,1),
 (283,6,57,51009.57,10678.57,'2017-02-08','Premium','On-premises','2017-02-12','2017-02-12','2017-02-14',null,4),
 (284,14,28,70462.44,10332.19,'2018-07-30','Silver','On-premises','2018-08-08','2018-08-09','2018-08-12','2018-08-19',1),
 (285,11,55,80944.97,9587.18,'2018-02-09','Gold','On-premises','2018-02-19','2018-02-22','2018-02-26',null,5),
 (286,15,32,59325.31,5312.33,'2015-08-03','Premium','Cloud','2015-08-04','2015-08-05','2015-08-09',null,4),
 (287,13,48,84301.31,6659.82,'2017-05-20','Gold','Cloud','2017-05-20','2017-05-25','2017-05-26',null,3),
 (288,14,49,72687.99,6911.31,'2017-01-30','Gold','Cloud','2017-01-30','2017-02-03','2017-02-04',null,1),
 (289,1,13,59826.15,10627.42,'2017-01-31','Diamond','Cloud','2017-02-03','2017-02-03','2017-02-07',null,2),
 (290,12,11,119957.22,11468.5,'2016-04-15','Diamond','Cloud','2016-04-21','2016-04-25','2016-04-25',null,1),
 (291,7,31,75573.91,9430.84,'2017-02-09','Silver','On-premises','2017-02-09','2017-02-10','2017-02-14','2017-02-21',3),
 (292,12,8,70639.62,10017.84,'2015-11-26','Premium','Cloud','2015-12-01','2015-12-01','2015-12-04',null,2),
 (293,3,11,91614.31,7665.23,'2017-06-20','Diamond','On-premises','2017-06-25','2017-06-28','2017-06-28',null,1),
 (294,19,46,35136.02,9920.4,'2017-04-24','Premium','On-premises','2017-04-25','2017-04-27','2017-04-27',null,1),
 (295,3,48,72296.82,8549.98,'2016-04-01','Premium','Cloud','2016-04-06','2016-04-06','2016-04-06',null,2),
 (296,17,35,91049.56,7528.23,'2015-01-11','Gold','Cloud','2015-01-20','2015-01-20','2015-01-22',null,3),
 (297,9,47,48672.81,8614.84,'2018-04-10','Silver','On-premises','2018-04-16','2018-04-19','2018-04-23','2018-04-28',2),
 (298,3,33,33151.04,11269.16,'2016-09-01','Gold','Cloud','2016-09-09','2016-09-10','2016-09-10',null,4),
 (299,3,60,100374.64,6144.46,'2016-05-08','Diamond','Cloud','2016-05-15','2016-05-19','2016-05-24',null,5),
 (300,9,11,48524.87,11864.7,'2016-08-31','Diamond','On-premises','2016-09-05','2016-09-07','2016-09-13',null,1),
 (301,17,28,30205.93,6570.07,'2016-01-09','Diamond','On-premises','2016-01-15','2016-01-19','2016-01-19',null,3),
 (302,2,55,79516.3,11659.88,'2017-03-07','Silver','On-premises','2017-03-07','2017-03-12','2017-03-15','2017-03-23',2),
 (303,8,16,100518.96,8210.44,'2015-01-10','Diamond','On-premises','2015-01-16','2015-01-17','2015-01-22',null,1),
 (304,18,41,34004.12,11622.0,'2016-01-04','Diamond','Cloud','2016-01-11','2016-01-13','2016-01-17',null,2),
 (305,10,47,83392.12,11903.16,'2015-11-16','Gold','On-premises','2015-11-25','2015-11-28','2015-11-28',null,2),
 (306,15,48,68345.31,11319.27,'2016-03-05','Silver','Cloud','2016-03-11','2016-03-17','2016-03-17','2016-03-23',1),
 (307,8,50,52773.93,8988.92,'2016-08-04','Diamond','Cloud','2016-08-11','2016-08-13','2016-08-20',null,4),
 (308,19,40,51827.98,6494.62,'2016-08-29','Silver','Cloud','2016-09-03','2016-09-04','2016-09-05','2016-09-10',2),
 (309,6,8,91015.94,7676.72,'2015-08-06','Silver','On-premises','2015-08-14','2015-08-19','2015-08-27','2015-09-01',4),
 (310,5,59,54948.8,9943.74,'2017-04-28','Premium','On-premises','2017-04-29','2017-05-01','2017-05-02',null,3),
 (311,19,14,105081.54,10213.14,'2016-05-20','Premium','On-premises','2016-05-21','2016-05-23','2016-05-26',null,5),
 (312,6,3,85180.45,9809.35,'2018-02-25','Diamond','On-premises','2018-03-01','2018-03-01','2018-03-03',null,2),
 (313,5,50,114355.12,11821.72,'2016-06-19','Silver','Cloud','2016-06-24','2016-06-29','2016-07-06','2016-07-11',1),
 (314,16,39,96123.41,11681.54,'2018-07-18','Silver','Cloud','2018-07-25','2018-07-26','2018-08-02','2018-08-09',5),
 (315,11,21,41199.37,6116.39,'2018-06-22','Gold','Cloud','2018-07-03','2018-07-07','2018-07-09',null,1),
 (316,15,48,93102.09,11402.74,'2017-02-06','Gold','Cloud','2017-02-06','2017-02-11','2017-02-15',null,1),
 (317,3,36,68085.13,11427.41,'2015-11-30','Diamond','On-premises','2015-12-04','2015-12-07','2015-12-12',null,4),
 (318,18,39,71258.2,8122.71,'2016-08-13','Premium','Cloud','2016-08-15','2016-08-15','2016-08-15',null,2),
 (319,1,51,98306.96,7961.67,'2018-02-24','Gold','On-premises','2018-03-03','2018-03-03','2018-03-04',null,3),
 (320,12,12,97655.31,10807.35,'2016-10-04','Diamond','On-premises','2016-10-07','2016-10-07','2016-10-11',null,2),
 (321,17,59,79127.32,8965.68,'2015-01-14','Gold','Cloud','2015-01-25','2015-01-26','2015-01-29',null,4),
 (322,7,29,92077.26,8853.82,'2015-09-29','Gold','Cloud','2015-10-08','2015-10-10','2015-10-10',null,1),
 (323,18,22,86460.78,6513.39,'2015-11-03','Diamond','Cloud','2015-11-09','2015-11-09','2015-11-15',null,4),
 (324,19,19,90717.9,11472.43,'2015-06-13','Premium','Cloud','2015-06-15','2015-06-17','2015-06-20',null,2),
 (325,10,31,64754.06,9064.11,'2015-05-23','Premium','Cloud','2015-05-27','2015-05-28','2015-06-02',null,2),
 (326,5,4,36582.15,8018.44,'2015-05-25','Gold','On-premises','2015-06-02','2015-06-03','2015-06-04',null,5),
 (327,14,11,99960.53,11591.21,'2015-08-05','Diamond','On-premises','2015-08-12','2015-08-13','2015-08-19',null,4),
 (328,4,21,105917.44,9939.82,'2015-12-27','Gold','Cloud','2016-01-08','2016-01-10','2016-01-14',null,3),
 (329,7,50,78717.99,9980.4,'2016-04-29','Silver','Cloud','2016-05-08','2016-05-15','2016-05-20','2016-05-28',3),
 (330,14,52,42611.26,9955.47,'2015-03-16','Silver','On-premises','2015-03-22','2015-03-29','2015-04-02','2015-04-10',1),
 (331,16,40,116339.7,5701.41,'2015-11-30','Silver','Cloud','2015-12-08','2015-12-11','2015-12-18','2015-12-24',4),
 (332,2,60,52278.25,5744.17,'2018-01-27','Silver','Cloud','2018-02-01','2018-02-05','2018-02-09','2018-02-14',2),
 (333,18,22,74831.15,6856.87,'2016-10-26','Gold','Cloud','2016-11-06','2016-11-07','2016-11-08',null,4),
 (334,6,12,67907.34,5153.05,'2015-12-17','Gold','Cloud','2015-12-27','2015-12-29','2015-12-30',null,1),
 (335,10,26,65889.92,8449.6,'2018-01-29','Premium','On-premises','2018-01-31','2018-01-31','2018-02-02',null,1),
 (336,3,24,103378.92,11067.84,'2017-01-19','Premium','On-premises','2017-01-21','2017-01-21','2017-01-26',null,1),
 (337,9,49,31432.72,6868.59,'2015-11-29','Silver','Cloud','2015-12-06','2015-12-11','2015-12-12','2015-12-18',5),
 (338,12,17,84859.61,11191.68,'2018-03-19','Silver','On-premises','2018-03-28','2018-03-28','2018-03-29','2018-04-05',4),
 (339,1,24,81494.33,9792.04,'2017-04-29','Silver','On-premises','2017-04-29','2017-04-29','2017-05-01','2017-05-08',4),
 (340,2,48,65263.13,7680.52,'2017-05-23','Premium','On-premises','2017-05-28','2017-05-30','2017-06-02',null,1),
 (341,20,39,107287.49,7175.66,'2015-01-12','Gold','Cloud','2015-01-24','2015-01-28','2015-01-31',null,5),
 (342,14,21,83284.6,9307.63,'2017-04-22','Diamond','Cloud','2017-04-29','2017-05-01','2017-05-04',null,4),
 (343,16,42,102516.52,8466.0,'2016-11-22','Silver','Cloud','2016-11-30','2016-12-03','2016-12-06','2016-12-11',4),
 (344,5,34,92852.8,9591.82,'2016-01-23','Diamond','Cloud','2016-01-29','2016-01-31','2016-02-03',null,3),
 (345,9,21,64628.06,8409.04,'2016-01-07','Gold','On-premises','2016-01-14','2016-01-17','2016-01-19',null,5),
 (346,20,43,44804.53,7813.48,'2015-01-24','Premium','On-premises','2015-01-27','2015-01-29','2015-02-02',null,3),
 (347,14,56,68096.32,8882.59,'2017-05-08','Diamond','Cloud','2017-05-11','2017-05-14','2017-05-21',null,3),
 (348,13,14,39207.39,11504.8,'2017-05-17','Silver','On-premises','2017-05-17','2017-05-24','2017-05-30','2017-06-05',2),
 (349,5,33,90452.06,11644.75,'2017-04-03','Diamond','On-premises','2017-04-09','2017-04-12','2017-04-17',null,4),
 (350,10,32,99395.63,5028.85,'2015-01-11','Gold','On-premises','2015-01-22','2015-01-22','2015-01-23',null,3),
 (351,19,54,35064.19,5439.34,'2015-07-13','Silver','Cloud','2015-07-21','2015-07-25','2015-07-28','2015-08-05',3),
 (352,8,49,90193.39,7968.66,'2016-12-14','Gold','On-premises','2016-12-26','2016-12-26','2016-12-30',null,1),
 (353,18,16,45003.65,6850.44,'2017-04-09','Gold','Cloud','2017-04-09','2017-04-13','2017-04-14',null,1),
 (354,10,52,35073.08,6582.9,'2015-03-29','Premium','On-premises','2015-04-03','2015-04-04','2015-04-05',null,2),
 (355,16,55,85673.22,7893.69,'2017-05-21','Silver','On-premises','2017-05-21','2017-05-23','2017-05-31','2017-06-05',1),
 (356,6,31,43663.46,9527.4,'2017-03-31','Premium','On-premises','2017-04-02','2017-04-04','2017-04-08',null,2),
 (357,19,18,81868.0,8277.33,'2016-12-12','Diamond','Cloud','2016-12-18','2016-12-18','2016-12-25',null,3),
 (358,20,19,78011.69,8624.24,'2015-08-17','Gold','Cloud','2015-08-27','2015-08-29','2015-09-02',null,2),
 (359,2,43,32551.08,10583.6,'2017-06-02','Gold','On-premises','2017-06-02','2017-06-06','2017-06-08',null,3),
 (360,6,56,88613.37,9079.79,'2015-11-26','Silver','On-premises','2015-12-06','2015-12-11','2015-12-15','2015-12-23',4),
 (361,10,51,56100.74,11886.65,'2016-12-05','Gold','Cloud','2016-12-14','2016-12-15','2016-12-19',null,3),
 (362,17,8,62814.93,6688.0,'2018-01-28','Gold','Cloud','2018-02-07','2018-02-11','2018-02-12',null,1),
 (363,8,1,80253.68,9231.57,'2015-11-16','Diamond','On-premises','2015-11-23','2015-11-24','2015-11-24',null,4),
 (364,7,35,60775.8,10641.34,'2017-03-20','Gold','On-premises','2017-03-20','2017-03-25','2017-03-25',null,3),
 (365,16,44,85961.56,11525.08,'2015-04-08','Diamond','Cloud','2015-04-11','2015-04-14','2015-04-16',null,1),
 (366,4,14,47823.91,11769.8,'2017-01-20','Gold','On-premises','2017-01-20','2017-01-21','2017-01-23',null,3),
 (367,6,4,50228.48,5630.06,'2017-10-08','Diamond','On-premises','2017-10-14','2017-10-14','2017-10-14',null,3),
 (368,18,46,100329.2,9396.58,'2015-01-07','Gold','On-premises','2015-01-19','2015-01-19','2015-01-21',null,1),
 (369,3,31,63331.22,6666.28,'2015-11-27','Silver','Cloud','2015-12-04','2015-12-11','2015-12-14','2015-12-22',3),
 (370,1,19,114987.26,7291.62,'2016-10-23','Diamond','Cloud','2016-10-28','2016-10-29','2016-11-04',null,2),
 (371,11,59,54918.98,7696.09,'2016-11-11','Silver','On-premises','2016-11-16','2016-11-16','2016-11-20','2016-11-27',1),
 (372,20,30,106370.74,5982.76,'2016-06-07','Silver','On-premises','2016-06-14','2016-06-17','2016-06-21','2016-06-29',2),
 (373,7,32,109526.32,10570.92,'2015-09-22','Diamond','Cloud','2015-09-25','2015-09-29','2015-10-03',null,4),
 (374,20,31,73293.45,8225.41,'2017-07-04','Silver','Cloud','2017-07-04','2017-07-09','2017-07-13','2017-07-20',4),
 (375,18,55,92519.26,10085.29,'2017-07-19','Diamond','On-premises','2017-07-24','2017-07-24','2017-07-26',null,4),
 (376,11,2,72113.43,5232.16,'2017-11-27','Gold','Cloud','2017-11-27','2017-11-28','2017-12-02',null,2),
 (377,10,15,78890.52,8368.14,'2015-11-23','Silver','Cloud','2015-12-03','2015-12-03','2015-12-09','2015-12-17',3),
 (378,4,41,39618.54,6014.36,'2017-03-16','Silver','On-premises','2017-03-16','2017-03-22','2017-03-28','2017-04-05',5),
 (379,19,43,119339.94,10648.72,'2015-06-12','Silver','Cloud','2015-06-20','2015-06-21','2015-06-28','2015-07-05',2),
 (380,7,60,116084.86,10434.67,'2018-04-11','Gold','Cloud','2018-04-18','2018-04-20','2018-04-20',null,2),
 (381,2,4,108352.11,5622.22,'2018-03-26','Diamond','Cloud','2018-03-30','2018-04-01','2018-04-05',null,1),
 (382,16,53,78799.38,8001.96,'2018-02-21','Gold','On-premises','2018-03-03','2018-03-08','2018-03-10',null,5),
 (383,18,4,81594.86,11870.52,'2015-04-09','Gold','On-premises','2015-04-18','2015-04-18','2015-04-21',null,5),
 (384,18,38,53507.55,9060.11,'2015-07-25','Gold','Cloud','2015-08-03','2015-08-03','2015-08-07',null,1),
 (385,10,32,65338.22,5886.81,'2015-03-05','Silver','Cloud','2015-03-10','2015-03-10','2015-03-11','2015-03-18',5),
 (386,9,24,85300.31,5247.01,'2016-03-26','Premium','Cloud','2016-03-30','2016-03-30','2016-03-30',null,1),
 (387,20,2,38055.08,11269.81,'2017-01-14','Premium','On-premises','2017-01-17','2017-01-18','2017-01-21',null,4),
 (388,16,31,110254.43,8193.86,'2016-09-02','Silver','Cloud','2016-09-09','2016-09-10','2016-09-10','2016-09-15',5),
 (389,17,54,52328.99,6554.74,'2015-12-23','Premium','Cloud','2015-12-24','2015-12-26','2015-12-29',null,5),
 (390,9,55,66372.58,9651.1,'2016-04-14','Diamond','Cloud','2016-04-21','2016-04-22','2016-04-22',null,1),
 (391,9,34,34964.92,10909.9,'2015-10-30','Silver','On-premises','2015-11-09','2015-11-14','2015-11-21','2015-11-28',1),
 (392,16,12,64676.83,7646.49,'2015-01-07','Premium','Cloud','2015-01-12','2015-01-12','2015-01-15',null,1),
 (393,8,59,114713.99,6548.65,'2018-05-03','Diamond','Cloud','2018-05-08','2018-05-08','2018-05-12',null,4),
 (394,14,11,44154.37,5850.0,'2018-03-28','Premium','Cloud','2018-03-29','2018-03-31','2018-04-03',null,3),
 (395,2,3,97513.51,10216.75,'2016-09-04','Diamond','Cloud','2016-09-10','2016-09-10','2016-09-10',null,4),
 (396,7,50,103446.43,9315.56,'2016-01-14','Premium','Cloud','2016-01-19','2016-01-20','2016-01-20',null,4),
 (397,2,37,111025.04,9351.0,'2018-01-21','Diamond','Cloud','2018-01-24','2018-01-25','2018-01-28',null,3),
 (398,12,23,64968.27,9975.67,'2015-02-08','Silver','On-premises','2015-02-14','2015-02-15','2015-02-22','2015-03-02',1),
 (399,7,21,50721.89,7372.91,'2017-12-31','Premium','On-premises','2018-01-02','2018-01-03','2018-01-07',null,3),
 (400,19,11,58412.22,8627.9,'2018-04-03','Diamond','Cloud','2018-04-08','2018-04-12','2018-04-13',null,1),
 (401,12,48,112806.5,7586.96,'2015-12-24','Diamond','Cloud','2015-12-31','2016-01-01','2016-01-02',null,2),
 (402,4,31,100754.02,6607.94,'2017-10-25','Diamond','Cloud','2017-10-28','2017-10-29','2017-10-31',null,2),
 (403,6,44,39339.56,7803.75,'2016-05-01','Silver','On-premises','2016-05-06','2016-05-08','2016-05-11','2016-05-16',5),
 (404,20,2,100694.85,7919.21,'2016-10-16','Silver','On-premises','2016-10-21','2016-10-25','2016-10-31','2016-11-08',5),
 (405,11,44,102014.68,9838.43,'2016-07-18','Diamond','On-premises','2016-07-21','2016-07-25','2016-08-01',null,3),
 (406,14,28,95726.2,10966.69,'2018-04-08','Gold','Cloud','2018-04-16','2018-04-17','2018-04-21',null,5),
 (407,15,56,78051.6,8030.8,'2016-10-10','Diamond','Cloud','2016-10-16','2016-10-16','2016-10-16',null,5),
 (408,13,47,38560.75,9863.58,'2016-01-07','Premium','On-premises','2016-01-12','2016-01-13','2016-01-13',null,4),
 (409,15,48,55927.9,8873.44,'2015-05-12','Silver','On-premises','2015-05-19','2015-05-23','2015-05-26','2015-06-02',5),
 (410,15,38,45202.57,11813.64,'2017-01-09','Silver','Cloud','2017-01-09','2017-01-14','2017-01-15','2017-01-23',5),
 (411,13,49,68170.25,6428.85,'2016-04-28','Silver','Cloud','2016-05-04','2016-05-07','2016-05-12','2016-05-19',1),
 (412,12,31,67424.24,5524.99,'2015-05-16','Diamond','On-premises','2015-05-21','2015-05-21','2015-05-25',null,4),
 (413,13,20,51097.15,11847.0,'2015-03-31','Silver','On-premises','2015-04-08','2015-04-13','2015-04-18','2015-04-26',4),
 (414,18,28,87178.0,10202.4,'2016-05-30','Diamond','On-premises','2016-06-04','2016-06-08','2016-06-15',null,1),
 (415,11,32,45117.88,5177.32,'2017-12-22','Premium','On-premises','2017-12-27','2017-12-27','2018-01-01',null,5),
 (416,1,6,107779.05,6116.39,'2017-07-05','Diamond','On-premises','2017-07-11','2017-07-15','2017-07-21',null,3),
 (417,15,60,109201.23,7038.45,'2017-02-01','Silver','Cloud','2017-02-01','2017-02-04','2017-02-04','2017-02-10',2),
 (418,6,10,110299.0,9273.25,'2018-01-10','Gold','On-premises','2018-01-17','2018-01-21','2018-01-24',null,1),
 (419,10,35,63276.44,9209.44,'2016-11-30','Premium','Cloud','2016-12-01','2016-12-01','2016-12-05',null,5),
 (420,9,41,39322.63,8698.32,'2016-03-30','Gold','Cloud','2016-04-10','2016-04-10','2016-04-10',null,5),
 (421,2,60,113102.09,5914.45,'2017-11-12','Gold','Cloud','2017-11-12','2017-11-16','2017-11-16',null,2),
 (422,1,12,87305.82,10827.11,'2015-01-19','Silver','Cloud','2015-01-25','2015-01-28','2015-01-29','2015-02-05',1),
 (423,7,55,39829.56,7366.51,'2018-04-25','Premium','On-premises','2018-04-28','2018-04-30','2018-05-01',null,2),
 (424,18,26,116476.79,11844.47,'2017-04-03','Gold','On-premises','2017-04-03','2017-04-07','2017-04-10',null,5),
 (425,11,11,87368.25,10916.47,'2015-06-08','Silver','Cloud','2015-06-14','2015-06-18','2015-06-20','2015-06-28',4),
 (426,20,44,59335.44,10652.48,'2015-12-17','Premium','On-premises','2015-12-19','2015-12-21','2015-12-25',null,3),
 (427,15,18,104761.4,9940.56,'2016-01-24','Gold','Cloud','2016-02-02','2016-02-06','2016-02-08',null,1),
 (428,16,53,78036.33,9148.68,'2017-09-05','Gold','Cloud','2017-09-05','2017-09-05','2017-09-05',null,1),
 (429,13,12,44961.58,9879.95,'2017-03-07','Gold','On-premises','2017-03-07','2017-03-12','2017-03-13',null,2),
 (430,5,22,79788.79,9118.71,'2018-03-29','Diamond','Cloud','2018-04-04','2018-04-07','2018-04-10',null,1),
 (431,8,13,84030.21,9915.15,'2017-10-15','Premium','On-premises','2017-10-18','2017-10-20','2017-10-24',null,1),
 (432,1,34,78106.86,11953.07,'2018-03-27','Diamond','On-premises','2018-03-30','2018-04-01','2018-04-08',null,5),
 (433,14,7,117604.39,5964.82,'2018-05-01','Diamond','On-premises','2018-05-08','2018-05-09','2018-05-12',null,4),
 (434,9,24,108051.84,7416.29,'2017-06-13','Silver','Cloud','2017-06-13','2017-06-16','2017-06-22','2017-06-29',2),
 (435,7,26,37211.76,10915.42,'2017-11-08','Premium','Cloud','2017-11-11','2017-11-11','2017-11-11',null,5),
 (436,16,50,91297.32,8535.43,'2018-03-15','Silver','On-premises','2018-03-25','2018-03-26','2018-03-31','2018-04-06',2),
 (437,6,16,30171.35,9286.31,'2018-06-25','Gold','On-premises','2018-07-03','2018-07-08','2018-07-12',null,4),
 (438,6,21,33733.05,8340.12,'2015-09-14','Gold','Cloud','2015-09-25','2015-09-28','2015-09-29',null,5),
 (439,4,50,34401.58,10737.79,'2017-06-26','Gold','On-premises','2017-06-26','2017-06-26','2017-06-29',null,1),
 (440,17,49,56792.62,5744.85,'2017-01-01','Gold','On-premises','2017-01-01','2017-01-04','2017-01-07',null,4),
 (441,19,55,41534.14,10635.5,'2016-12-09','Gold','Cloud','2016-12-16','2016-12-17','2016-12-17',null,1),
 (442,6,52,82233.18,8280.03,'2018-02-12','Silver','Cloud','2018-02-21','2018-02-26','2018-03-01','2018-03-09',2),
 (443,18,16,59280.0,10229.94,'2016-11-27','Diamond','Cloud','2016-12-02','2016-12-05','2016-12-11',null,2),
 (444,6,28,72506.3,8370.79,'2017-09-04','Silver','Cloud','2017-09-04','2017-09-11','2017-09-19','2017-09-25',5),
 (445,1,23,69516.97,8657.26,'2016-03-20','Gold','On-premises','2016-03-27','2016-04-01','2016-04-01',null,2),
 (446,1,40,102235.02,10666.99,'2018-07-30','Silver','On-premises','2018-08-06','2018-08-09','2018-08-11','2018-08-16',5),
 (447,1,23,109389.05,10570.5,'2018-03-14','Premium','Cloud','2018-03-16','2018-03-16','2018-03-21',null,5),
 (448,12,19,118208.34,6351.03,'2015-04-17','Silver','On-premises','2015-04-24','2015-04-30','2015-05-01','2015-05-08',5),
 (449,17,38,39904.79,6141.33,'2016-09-16','Silver','On-premises','2016-09-23','2016-09-27','2016-10-04','2016-10-10',2),
 (450,7,57,91831.27,8771.88,'2016-02-13','Diamond','Cloud','2016-02-19','2016-02-23','2016-03-01',null,3),
 (451,15,11,88700.18,5061.63,'2015-03-27','Gold','Cloud','2015-04-06','2015-04-10','2015-04-12',null,1),
 (452,11,14,99737.48,7118.08,'2015-07-18','Diamond','On-premises','2015-07-22','2015-07-22','2015-07-22',null,5),
 (453,17,31,45598.73,10122.02,'2015-04-01','Premium','Cloud','2015-04-03','2015-04-03','2015-04-06',null,4),
 (454,1,13,79673.65,7424.35,'2017-08-12','Premium','On-premises','2017-08-15','2017-08-15','2017-08-20',null,5),
 (455,10,48,40509.93,8458.69,'2015-11-12','Diamond','Cloud','2015-11-16','2015-11-19','2015-11-19',null,2),
 (456,14,52,94514.0,5512.47,'2016-04-03','Gold','Cloud','2016-04-15','2016-04-19','2016-04-21',null,2),
 (457,8,39,80709.03,8346.63,'2017-03-22','Premium','Cloud','2017-03-23','2017-03-23','2017-03-27',null,4),
 (458,11,26,82566.64,7576.92,'2016-07-14','Silver','Cloud','2016-07-21','2016-07-26','2016-07-28','2016-08-05',1),
 (459,14,39,81561.62,6332.49,'2016-07-28','Diamond','Cloud','2016-07-31','2016-08-01','2016-08-06',null,3),
 (460,14,26,65244.86,11711.93,'2018-03-22','Gold','On-premises','2018-03-30','2018-04-04','2018-04-06',null,4),
 (461,15,6,45211.23,9692.29,'2015-10-13','Silver','Cloud','2015-10-18','2015-10-19','2015-10-21','2015-10-29',4),
 (462,18,15,114286.49,8171.59,'2018-01-06','Gold','On-premises','2018-01-18','2018-01-21','2018-01-24',null,1),
 (463,19,33,45722.75,9960.2,'2016-02-24','Gold','On-premises','2016-03-06','2016-03-11','2016-03-15',null,5),
 (464,7,1,112426.51,9353.85,'2018-04-16','Diamond','Cloud','2018-04-20','2018-04-20','2018-04-20',null,3),
 (465,13,56,58701.73,11628.17,'2016-03-29','Silver','On-premises','2016-04-05','2016-04-06','2016-04-13','2016-04-20',2),
 (466,7,58,47624.15,6370.98,'2016-11-12','Premium','Cloud','2016-11-17','2016-11-18','2016-11-22',null,1),
 (467,18,18,98028.29,9690.0,'2016-05-08','Premium','Cloud','2016-05-12','2016-05-13','2016-05-14',null,3),
 (468,14,31,118344.08,5387.32,'2017-02-05','Premium','Cloud','2017-02-08','2017-02-09','2017-02-10',null,2),
 (469,18,4,102020.51,7252.54,'2016-01-06','Diamond','On-premises','2016-01-11','2016-01-15','2016-01-15',null,1),
 (470,5,48,79702.1,10670.5,'2015-02-18','Diamond','Cloud','2015-02-22','2015-02-26','2015-03-04',null,1),
 (471,10,22,85029.9,6281.78,'2016-11-23','Silver','Cloud','2016-12-03','2016-12-03','2016-12-04','2016-12-11',1),
 (472,16,49,70387.17,7890.71,'2015-06-28','Diamond','Cloud','2015-07-02','2015-07-05','2015-07-05',null,5),
 (473,15,44,66609.81,7931.81,'2016-07-22','Silver','On-premises','2016-07-31','2016-08-06','2016-08-13','2016-08-20',1),
 (474,15,26,73680.66,10080.86,'2016-08-17','Diamond','On-premises','2016-08-23','2016-08-25','2016-09-01',null,4),
 (475,10,5,83658.81,6528.96,'2015-08-02','Silver','On-premises','2015-08-08','2015-08-15','2015-08-17','2015-08-23',2),
 (476,13,13,83362.85,8728.45,'2018-03-30','Premium','On-premises','2018-03-31','2018-03-31','2018-04-05',null,2),
 (477,2,47,38720.48,11227.17,'2017-05-24','Gold','Cloud','2017-05-24','2017-05-27','2017-05-31',null,5),
 (478,4,28,81736.62,8153.93,'2017-02-18','Silver','Cloud','2017-02-18','2017-02-21','2017-02-23','2017-03-01',1),
 (479,2,19,83273.46,6441.56,'2016-06-14','Silver','On-premises','2016-06-21','2016-06-27','2016-07-02','2016-07-08',3),
 (480,7,23,44335.68,8752.21,'2016-02-07','Premium','On-premises','2016-02-08','2016-02-10','2016-02-14',null,2),
 (481,18,20,49049.3,5365.57,'2016-03-26','Gold','Cloud','2016-04-06','2016-04-08','2016-04-08',null,2),
 (482,15,53,46678.73,9888.46,'2018-01-03','Gold','On-premises','2018-01-11','2018-01-12','2018-01-14',null,2),
 (483,5,54,65960.65,10491.81,'2017-03-29','Silver','On-premises','2017-03-29','2017-04-03','2017-04-08','2017-04-14',2),
 (484,16,51,114368.86,6487.6,'2017-12-30','Premium','Cloud','2018-01-03','2018-01-03','2018-01-06',null,2),
 (485,3,33,37638.14,8643.85,'2015-03-29','Silver','On-premises','2015-04-06','2015-04-11','2015-04-11','2015-04-18',1),
 (486,12,47,60702.02,6771.79,'2017-07-30','Silver','On-premises','2017-07-30','2017-07-31','2017-08-04','2017-08-11',5),
 (487,3,16,114775.77,7243.62,'2017-07-02','Gold','On-premises','2017-07-02','2017-07-04','2017-07-07',null,2),
 (488,13,8,61745.43,11917.57,'2017-11-08','Gold','Cloud','2017-11-08','2017-11-08','2017-11-10',null,2),
 (489,5,60,91177.99,9668.4,'2017-09-05','Premium','Cloud','2017-09-07','2017-09-07','2017-09-11',null,1),
 (490,19,55,101877.72,8875.79,'2016-03-07','Diamond','Cloud','2016-03-12','2016-03-16','2016-03-20',null,3),
 (491,3,23,51198.07,10486.52,'2015-12-01','Premium','Cloud','2015-12-06','2015-12-08','2015-12-08',null,3),
 (492,8,41,110295.67,6032.19,'2016-05-10','Diamond','On-premises','2016-05-13','2016-05-17','2016-05-17',null,1),
 (493,6,21,68248.08,9865.7,'2018-05-12','Silver','Cloud','2018-05-17','2018-05-23','2018-05-23','2018-05-30',3),
 (494,5,33,105027.88,5244.15,'2018-03-10','Diamond','Cloud','2018-03-16','2018-03-19','2018-03-26',null,2),
 (495,5,10,46058.66,9062.76,'2018-01-08','Diamond','Cloud','2018-01-15','2018-01-17','2018-01-24',null,2),
 (496,1,44,110240.66,5342.93,'2015-02-26','Diamond','On-premises','2015-03-03','2015-03-05','2015-03-05',null,5),
 (497,4,10,47306.77,7930.01,'2017-05-17','Gold','On-premises','2017-05-17','2017-05-20','2017-05-21',null,5),
 (498,7,27,104480.99,8344.45,'2017-04-16','Diamond','Cloud','2017-04-23','2017-04-25','2017-04-25',null,4),
 (499,12,23,88851.53,11887.25,'2018-04-30','Gold','On-premises','2018-05-07','2018-05-09','2018-05-10',null,4),
 (500,14,53,31175.53,6997.55,'2016-10-10','Diamond','Cloud','2016-10-17','2016-10-21','2016-10-25',null,5),
 (501,6,44,61609.69,7876.63,'2016-01-16','Gold','On-premises','2016-01-25','2016-01-27','2016-01-31',null,1),
 (502,6,7,60418.3,11599.94,'2016-11-28','Premium','Cloud','2016-11-29','2016-11-30','2016-12-02',null,4),
 (503,17,47,33050.69,9981.98,'2015-06-27','Silver','Cloud','2015-07-06','2015-07-10','2015-07-14','2015-07-19',1),
 (504,18,40,109571.56,8495.53,'2018-02-27','Gold','On-premises','2018-03-07','2018-03-09','2018-03-11',null,1),
 (505,11,10,54498.85,8452.0,'2015-04-01','Silver','Cloud','2015-04-06','2015-04-12','2015-04-15','2015-04-23',2),
 (506,3,11,109517.47,10906.95,'2017-07-12','Gold','Cloud','2017-07-12','2017-07-13','2017-07-14',null,3),
 (507,7,35,45130.97,9018.24,'2017-08-03','Premium','On-premises','2017-08-06','2017-08-08','2017-08-12',null,2),
 (508,8,60,99076.76,10802.46,'2016-12-09','Silver','Cloud','2016-12-15','2016-12-22','2016-12-28','2017-01-02',1),
 (509,9,16,118319.49,5637.34,'2018-06-25','Gold','On-premises','2018-07-05','2018-07-08','2018-07-12',null,3),
 (510,5,40,49807.34,5196.25,'2016-01-27','Premium','Cloud','2016-01-30','2016-01-31','2016-02-02',null,3),
 (511,2,38,36913.34,8310.33,'2016-05-31','Silver','On-premises','2016-06-09','2016-06-11','2016-06-12','2016-06-19',5),
 (512,2,11,57784.78,8845.33,'2017-07-10','Diamond','On-premises','2017-07-13','2017-07-16','2017-07-21',null,4),
 (513,20,4,114372.06,5145.56,'2017-05-04','Gold','On-premises','2017-05-04','2017-05-06','2017-05-08',null,5),
 (514,14,48,47147.95,7586.42,'2016-01-22','Premium','Cloud','2016-01-24','2016-01-26','2016-01-30',null,2),
 (515,15,56,41105.62,9250.84,'2016-02-21','Gold','On-premises','2016-03-02','2016-03-05','2016-03-09',null,4),
 (516,20,57,31549.71,7648.56,'2016-04-21','Premium','On-premises','2016-04-22','2016-04-22','2016-04-23',null,1),
 (517,17,1,62217.87,11308.68,'2017-04-24','Silver','On-premises','2017-04-24','2017-05-01','2017-05-05','2017-05-10',2),
 (518,4,26,39817.26,7107.44,'2018-04-16','Diamond','On-premises','2018-04-19','2018-04-20','2018-04-25',null,3),
 (519,9,18,62976.55,8339.0,'2015-10-27','Silver','On-premises','2015-11-04','2015-11-10','2015-11-12','2015-11-20',1),
 (520,3,24,66620.9,5783.55,'2017-11-09','Premium','On-premises','2017-11-13','2017-11-13','2017-11-15',null,1),
 (521,10,58,65523.04,6486.42,'2017-01-09','Premium','On-premises','2017-01-13','2017-01-13','2017-01-15',null,5),
 (522,4,34,61759.37,9419.64,'2015-12-26','Diamond','On-premises','2015-12-31','2016-01-02','2016-01-05',null,1),
 (523,2,1,52327.44,8654.48,'2015-12-03','Diamond','On-premises','2015-12-10','2015-12-13','2015-12-20',null,5),
 (524,2,17,64779.43,6875.9,'2016-01-08','Silver','Cloud','2016-01-18','2016-01-18','2016-01-26','2016-02-02',1),
 (525,6,45,76403.65,7252.6,'2015-06-22','Premium','Cloud','2015-06-27','2015-06-29','2015-06-29',null,1),
 (526,14,2,78015.15,5286.16,'2018-01-31','Gold','On-premises','2018-02-07','2018-02-12','2018-02-16',null,2),
 (527,7,8,43288.8,5542.1,'2017-07-22','Premium','On-premises','2017-07-26','2017-07-28','2017-08-01',null,1),
 (528,18,6,48365.55,11527.09,'2018-05-23','Diamond','Cloud','2018-05-28','2018-06-01','2018-06-01',null,5),
 (529,19,59,110007.87,5282.69,'2017-01-03','Diamond','On-premises','2017-01-06','2017-01-07','2017-01-08',null,3),
 (530,1,21,108012.33,7341.87,'2016-12-13','Premium','On-premises','2016-12-14','2016-12-14','2016-12-16',null,5),
 (531,17,21,89020.95,10124.87,'2016-07-24','Premium','On-premises','2016-07-25','2016-07-27','2016-07-29',null,3),
 (532,1,38,88171.13,7624.95,'2015-07-29','Premium','On-premises','2015-08-03','2015-08-03','2015-08-03',null,5),
 (533,16,7,104737.29,11259.96,'2016-07-04','Diamond','Cloud','2016-07-07','2016-07-11','2016-07-16',null,1),
 (534,13,24,47428.27,6107.22,'2016-03-28','Premium','Cloud','2016-03-29','2016-03-29','2016-03-30',null,1),
 (535,10,17,35604.12,8487.82,'2015-07-23','Premium','Cloud','2015-07-27','2015-07-27','2015-08-01',null,3),
 (536,18,40,119817.63,9778.26,'2017-07-30','Silver','On-premises','2017-07-30','2017-08-01','2017-08-04','2017-08-10',5),
 (537,11,44,109112.36,7295.28,'2016-08-06','Diamond','Cloud','2016-08-10','2016-08-10','2016-08-14',null,2),
 (538,19,49,36604.16,8791.14,'2018-04-06','Diamond','On-premises','2018-04-12','2018-04-13','2018-04-14',null,3),
 (539,11,26,101539.43,5510.1,'2017-08-04','Diamond','On-premises','2017-08-10','2017-08-13','2017-08-18',null,3),
 (540,17,8,97210.78,6297.06,'2015-04-24','Gold','On-premises','2015-05-05','2015-05-10','2015-05-12',null,5),
 (541,12,40,115446.26,5852.86,'2017-06-11','Diamond','On-premises','2017-06-14','2017-06-16','2017-06-20',null,4),
 (542,14,50,107763.41,10808.09,'2018-03-14','Silver','Cloud','2018-03-21','2018-03-23','2018-03-31','2018-04-07',5),
 (543,11,47,63596.43,10014.3,'2016-03-22','Diamond','On-premises','2016-03-27','2016-03-27','2016-03-31',null,2),
 (544,6,54,41255.56,10793.93,'2018-02-08','Premium','On-premises','2018-02-11','2018-02-12','2018-02-15',null,4),
 (545,1,49,71031.22,7405.55,'2018-02-04','Premium','Cloud','2018-02-05','2018-02-07','2018-02-07',null,1),
 (546,5,21,107232.41,7977.18,'2018-03-05','Gold','Cloud','2018-03-15','2018-03-17','2018-03-20',null,2),
 (547,17,22,66920.45,5192.11,'2017-09-12','Silver','Cloud','2017-09-12','2017-09-15','2017-09-19','2017-09-25',1),
 (548,16,34,43141.36,10916.19,'2017-11-17','Diamond','On-premises','2017-11-22','2017-11-25','2017-11-26',null,2),
 (549,10,12,93292.82,5198.51,'2015-07-19','Premium','On-premises','2015-07-20','2015-07-22','2015-07-26',null,3),
 (550,3,18,78903.77,8346.07,'2017-08-17','Premium','On-premises','2017-08-19','2017-08-21','2017-08-24',null,2),
 (551,17,5,71776.8,5714.72,'2016-07-08','Gold','Cloud','2016-07-18','2016-07-19','2016-07-23',null,4),
 (552,19,36,113476.45,10339.97,'2017-04-08','Gold','On-premises','2017-04-08','2017-04-10','2017-04-14',null,4),
 (553,19,27,93874.16,11860.26,'2017-03-17','Silver','On-premises','2017-03-17','2017-03-18','2017-03-21','2017-03-26',4),
 (554,2,16,72597.77,5822.63,'2016-02-19','Silver','On-premises','2016-02-26','2016-02-28','2016-02-28','2016-03-05',3),
 (555,12,45,34866.41,11771.87,'2017-11-30','Silver','Cloud','2017-11-30','2017-12-01','2017-12-06','2017-12-14',2),
 (556,17,46,84835.33,10554.87,'2017-02-01','Diamond','On-premises','2017-02-08','2017-02-09','2017-02-15',null,3),
 (557,1,54,93153.7,10590.49,'2017-07-30','Silver','On-premises','2017-07-30','2017-08-05','2017-08-13','2017-08-18',5),
 (558,7,1,51303.22,10465.16,'2015-06-28','Gold','On-premises','2015-07-10','2015-07-10','2015-07-14',null,2),
 (559,13,28,87118.55,11386.83,'2016-08-25','Gold','On-premises','2016-09-05','2016-09-08','2016-09-10',null,5),
 (560,19,35,56577.74,5747.66,'2015-02-05','Silver','On-premises','2015-02-14','2015-02-17','2015-02-24','2015-03-02',3),
 (561,11,7,79018.42,8454.91,'2015-04-21','Premium','Cloud','2015-04-24','2015-04-24','2015-04-24',null,1),
 (562,4,38,116169.61,11482.84,'2015-12-15','Gold','On-premises','2015-12-27','2015-12-29','2015-12-31',null,3),
 (563,12,36,43758.2,11996.33,'2015-04-11','Gold','Cloud','2015-04-22','2015-04-25','2015-04-29',null,2),
 (564,2,57,111459.09,10462.14,'2015-04-21','Premium','On-premises','2015-04-25','2015-04-26','2015-04-26',null,5),
 (565,14,48,113844.22,8513.42,'2018-01-24','Silver','Cloud','2018-01-29','2018-02-04','2018-02-10','2018-02-15',2),
 (566,7,40,57673.15,10114.23,'2016-04-24','Premium','Cloud','2016-04-25','2016-04-26','2016-05-01',null,5),
 (567,15,50,113728.11,10196.69,'2015-12-11','Premium','Cloud','2015-12-15','2015-12-17','2015-12-20',null,1),
 (568,2,27,109447.95,10564.5,'2016-04-11','Gold','Cloud','2016-04-21','2016-04-23','2016-04-23',null,4),
 (569,5,19,77730.45,5194.6,'2018-02-24','Premium','On-premises','2018-02-27','2018-03-01','2018-03-04',null,2),
 (570,7,57,97356.33,8442.51,'2017-05-14','Gold','Cloud','2017-05-14','2017-05-14','2017-05-18',null,4),
 (571,10,35,54303.47,9882.11,'2015-03-27','Diamond','On-premises','2015-03-31','2015-04-02','2015-04-08',null,4),
 (572,6,20,49237.19,10681.72,'2017-09-03','Premium','On-premises','2017-09-08','2017-09-08','2017-09-08',null,3),
 (573,17,8,30709.39,8054.98,'2018-05-02','Diamond','On-premises','2018-05-06','2018-05-09','2018-05-14',null,3),
 (574,4,49,87406.58,10852.15,'2017-11-26','Gold','On-premises','2017-11-26','2017-11-27','2017-11-29',null,3),
 (575,9,14,91291.76,9132.79,'2018-06-10','Silver','Cloud','2018-06-18','2018-06-21','2018-06-24','2018-06-30',4),
 (576,13,4,71191.19,9156.35,'2017-08-14','Silver','Cloud','2017-08-14','2017-08-14','2017-08-22','2017-08-28',3),
 (577,17,24,73879.61,10365.92,'2015-04-20','Diamond','On-premises','2015-04-26','2015-04-30','2015-05-01',null,4),
 (578,8,10,92708.63,8029.22,'2016-09-14','Premium','On-premises','2016-09-16','2016-09-17','2016-09-22',null,1),
 (579,14,56,114982.32,8979.55,'2017-02-07','Premium','Cloud','2017-02-09','2017-02-10','2017-02-15',null,3),
 (580,4,47,111869.68,8648.05,'2018-04-07','Diamond','On-premises','2018-04-10','2018-04-11','2018-04-14',null,4),
 (581,8,1,37369.7,9011.08,'2016-06-06','Silver','On-premises','2016-06-11','2016-06-11','2016-06-19','2016-06-24',3),
 (582,19,30,105095.91,11379.73,'2015-01-11','Premium','On-premises','2015-01-12','2015-01-14','2015-01-15',null,4),
 (583,16,4,107100.45,7197.46,'2017-08-06','Premium','On-premises','2017-08-11','2017-08-12','2017-08-15',null,1),
 (584,6,38,79858.2,9332.29,'2016-07-30','Silver','Cloud','2016-08-08','2016-08-11','2016-08-13','2016-08-18',5),
 (585,9,3,51255.22,8326.21,'2017-07-23','Silver','On-premises','2017-07-23','2017-07-28','2017-08-04','2017-08-09',3),
 (586,19,32,57297.04,5825.62,'2016-11-04','Silver','Cloud','2016-11-13','2016-11-15','2016-11-20','2016-11-27',4),
 (587,12,54,98218.18,10074.1,'2017-01-17','Diamond','On-premises','2017-01-24','2017-01-25','2017-01-28',null,5),
 (588,17,54,113942.49,5889.21,'2017-04-04','Silver','Cloud','2017-04-04','2017-04-06','2017-04-11','2017-04-17',4),
 (589,12,43,53352.63,10135.86,'2017-01-26','Diamond','On-premises','2017-02-02','2017-02-06','2017-02-09',null,1),
 (590,4,14,89634.9,7153.91,'2018-04-11','Premium','Cloud','2018-04-13','2018-04-14','2018-04-15',null,1),
 (591,17,53,112034.96,9559.33,'2015-03-26','Diamond','On-premises','2015-03-30','2015-03-30','2015-04-05',null,3),
 (592,15,1,36707.52,10540.76,'2015-12-31','Gold','On-premises','2016-01-09','2016-01-14','2016-01-16',null,4),
 (593,15,54,66679.2,5627.3,'2017-09-30','Diamond','On-premises','2017-10-03','2017-10-03','2017-10-07',null,4),
 (594,19,48,115329.19,9172.61,'2016-03-09','Gold','On-premises','2016-03-20','2016-03-24','2016-03-24',null,5),
 (595,18,15,63234.77,10409.97,'2015-03-28','Gold','On-premises','2015-04-09','2015-04-14','2015-04-16',null,5),
 (596,17,39,118389.06,10784.15,'2017-04-29','Silver','On-premises','2017-04-29','2017-05-05','2017-05-12','2017-05-20',4),
 (597,8,23,30837.47,7858.45,'2016-09-14','Silver','Cloud','2016-09-20','2016-09-21','2016-09-28','2016-10-04',4),
 (598,9,57,34120.09,11914.99,'2018-08-03','Diamond','Cloud','2018-08-10','2018-08-10','2018-08-11',null,5),
 (599,10,12,41704.32,11296.93,'2015-09-02','Silver','Cloud','2015-09-09','2015-09-09','2015-09-14','2015-09-21',5),
 (600,4,18,119470.92,11477.53,'2015-03-20','Diamond','Cloud','2015-03-24','2015-03-25','2015-03-26',null,5),
 (601,19,29,32753.23,11299.82,'2018-02-04','Diamond','On-premises','2018-02-11','2018-02-11','2018-02-12',null,2),
 (602,4,2,41824.82,8172.51,'2015-05-22','Diamond','On-premises','2015-05-26','2015-05-29','2015-05-30',null,5),
 (603,3,8,46650.48,5849.35,'2015-11-12','Silver','Cloud','2015-11-20','2015-11-21','2015-11-24','2015-12-02',1),
 (604,12,31,90663.23,9969.3,'2016-11-09','Gold','On-premises','2016-11-19','2016-11-19','2016-11-19',null,5),
 (605,18,14,65037.78,9329.85,'2016-11-27','Silver','On-premises','2016-12-04','2016-12-06','2016-12-10','2016-12-16',2),
 (606,12,5,94867.73,9186.48,'2015-01-26','Premium','Cloud','2015-01-29','2015-01-31','2015-02-05',null,5),
 (607,1,30,49838.4,10957.81,'2015-03-14','Gold','On-premises','2015-03-26','2015-03-29','2015-03-31',null,5),
 (608,14,50,101773.41,8173.32,'2015-01-31','Silver','On-premises','2015-02-10','2015-02-14','2015-02-14','2015-02-19',1),
 (609,18,5,44327.28,9799.0,'2016-11-07','Gold','Cloud','2016-11-18','2016-11-21','2016-11-25',null,5),
 (610,13,37,38012.32,7759.03,'2017-01-22','Diamond','Cloud','2017-01-26','2017-01-30','2017-02-03',null,3),
 (611,5,26,92212.41,10974.27,'2015-09-23','Gold','On-premises','2015-10-04','2015-10-08','2015-10-08',null,3),
 (612,1,21,66224.69,11406.36,'2018-05-22','Gold','Cloud','2018-05-30','2018-06-03','2018-06-06',null,3),
 (613,10,40,89932.47,9198.49,'2015-11-05','Silver','On-premises','2015-11-11','2015-11-13','2015-11-17','2015-11-23',2),
 (614,10,54,84392.05,7522.76,'2015-10-11','Gold','Cloud','2015-10-22','2015-10-22','2015-10-22',null,3),
 (615,19,49,55035.92,9859.69,'2017-11-08','Premium','On-premises','2017-11-09','2017-11-11','2017-11-12',null,3),
 (616,5,27,102247.84,9344.6,'2016-11-08','Gold','On-premises','2016-11-16','2016-11-18','2016-11-22',null,2),
 (617,2,22,46890.5,10968.67,'2018-01-05','Gold','Cloud','2018-01-12','2018-01-14','2018-01-14',null,3),
 (618,10,5,88050.72,7250.9,'2017-05-25','Premium','On-premises','2017-05-29','2017-05-29','2017-05-31',null,2),
 (619,18,49,60282.36,8121.61,'2018-01-17','Silver','On-premises','2018-01-22','2018-01-23','2018-01-25','2018-02-01',3),
 (620,16,10,98786.42,7365.15,'2017-08-20','Gold','On-premises','2017-08-20','2017-08-21','2017-08-21',null,2),
 (621,1,35,98795.05,11689.07,'2018-05-16','Gold','On-premises','2018-05-23','2018-05-25','2018-05-26',null,5),
 (622,2,8,31923.75,7977.76,'2017-07-19','Silver','On-premises','2017-07-19','2017-07-19','2017-07-22','2017-07-28',3),
 (623,12,51,76826.21,5987.36,'2016-01-13','Silver','On-premises','2016-01-23','2016-01-30','2016-02-04','2016-02-11',1),
 (624,18,58,89747.58,9941.51,'2016-08-26','Gold','On-premises','2016-09-03','2016-09-03','2016-09-03',null,1),
 (625,8,5,59449.68,10483.66,'2017-03-19','Gold','Cloud','2017-03-19','2017-03-21','2017-03-23',null,5),
 (626,17,15,46049.52,5914.64,'2015-09-03','Premium','Cloud','2015-09-04','2015-09-06','2015-09-11',null,1),
 (627,11,30,68324.0,11119.34,'2016-02-02','Premium','Cloud','2016-02-05','2016-02-05','2016-02-07',null,3),
 (628,17,48,37597.52,11514.05,'2017-10-26','Diamond','Cloud','2017-11-02','2017-11-05','2017-11-07',null,4),
 (629,8,24,52249.87,6875.51,'2015-11-06','Silver','On-premises','2015-11-11','2015-11-11','2015-11-19','2015-11-26',4),
 (630,14,38,78763.12,5960.06,'2016-08-13','Gold','On-premises','2016-08-21','2016-08-23','2016-08-23',null,1),
 (631,8,40,109367.39,7760.39,'2017-10-19','Silver','Cloud','2017-10-19','2017-10-24','2017-10-26','2017-11-02',3),
 (632,16,16,100270.04,11247.95,'2017-01-15','Diamond','On-premises','2017-01-21','2017-01-21','2017-01-24',null,4),
 (633,6,36,92668.73,9493.84,'2016-12-30','Gold','Cloud','2017-01-11','2017-01-14','2017-01-14',null,3),
 (634,8,47,72299.53,10543.7,'2018-01-17','Diamond','On-premises','2018-01-20','2018-01-21','2018-01-27',null,5),
 (635,4,7,46455.29,9896.38,'2017-08-27','Premium','On-premises','2017-08-30','2017-08-30','2017-08-30',null,1),
 (636,17,36,106433.6,8934.71,'2017-05-05','Gold','On-premises','2017-05-05','2017-05-08','2017-05-08',null,1),
 (637,8,52,55646.98,8621.76,'2016-11-25','Silver','On-premises','2016-12-03','2016-12-08','2016-12-12','2016-12-20',1),
 (638,10,44,44730.04,7617.72,'2017-09-01','Silver','Cloud','2017-09-01','2017-09-05','2017-09-05','2017-09-12',2),
 (639,12,52,54488.14,6892.66,'2018-03-06','Diamond','On-premises','2018-03-09','2018-03-11','2018-03-14',null,1),
 (640,19,32,59773.49,9475.48,'2017-11-12','Diamond','Cloud','2017-11-16','2017-11-19','2017-11-21',null,3),
 (641,15,36,67321.12,8986.85,'2017-12-13','Premium','Cloud','2017-12-14','2017-12-15','2017-12-16',null,4),
 (642,5,36,105656.57,11818.58,'2015-07-08','Diamond','Cloud','2015-07-14','2015-07-15','2015-07-20',null,5),
 (643,4,32,31712.7,10552.08,'2015-09-11','Diamond','Cloud','2015-09-14','2015-09-17','2015-09-21',null,5),
 (644,18,1,82299.33,11686.41,'2017-12-16','Silver','Cloud','2017-12-16','2017-12-17','2017-12-20','2017-12-28',4),
 (645,6,9,112898.61,5920.87,'2017-03-14','Diamond','On-premises','2017-03-21','2017-03-24','2017-03-27',null,1),
 (646,20,34,97775.3,9267.42,'2015-11-16','Gold','Cloud','2015-11-25','2015-11-28','2015-12-01',null,4),
 (647,15,15,68832.0,5840.1,'2015-11-23','Premium','Cloud','2015-11-27','2015-11-29','2015-11-29',null,1),
 (648,10,36,71806.52,7558.09,'2016-11-22','Silver','On-premises','2016-11-27','2016-12-03','2016-12-05','2016-12-11',4),
 (649,2,1,37295.22,11637.75,'2015-09-10','Premium','Cloud','2015-09-13','2015-09-14','2015-09-16',null,4),
 (650,16,31,67075.32,6347.24,'2015-09-23','Premium','On-premises','2015-09-25','2015-09-25','2015-09-25',null,2),
 (651,7,35,44947.73,11715.43,'2017-04-23','Premium','On-premises','2017-04-27','2017-04-29','2017-04-30',null,3),
 (652,10,12,96242.65,5622.85,'2016-05-19','Silver','Cloud','2016-05-29','2016-05-30','2016-06-04','2016-06-10',5),
 (653,12,23,117138.41,11062.91,'2017-06-26','Premium','On-premises','2017-06-30','2017-07-02','2017-07-06',null,5),
 (654,11,4,103412.61,5675.18,'2015-05-12','Gold','On-premises','2015-05-19','2015-05-21','2015-05-25',null,5),
 (655,11,29,118444.47,11973.29,'2016-03-17','Diamond','On-premises','2016-03-20','2016-03-22','2016-03-28',null,1),
 (656,18,46,52572.55,6632.77,'2016-10-16','Premium','On-premises','2016-10-19','2016-10-21','2016-10-26',null,5),
 (657,19,48,77345.14,7155.02,'2018-06-05','Gold','Cloud','2018-06-14','2018-06-15','2018-06-18',null,3),
 (658,5,15,56956.49,7233.61,'2017-10-02','Silver','On-premises','2017-10-02','2017-10-02','2017-10-08','2017-10-16',2),
 (659,2,51,78557.25,9931.93,'2015-12-25','Silver','On-premises','2016-01-02','2016-01-07','2016-01-08','2016-01-16',2),
 (660,19,13,56598.77,5896.47,'2017-11-28','Gold','On-premises','2017-11-28','2017-11-30','2017-12-02',null,2),
 (661,3,53,83926.92,9820.93,'2018-03-03','Diamond','Cloud','2018-03-09','2018-03-09','2018-03-14',null,1),
 (662,8,13,95883.13,11253.18,'2017-12-02','Diamond','On-premises','2017-12-06','2017-12-08','2017-12-14',null,3),
 (663,7,26,76563.75,8160.1,'2015-09-22','Gold','Cloud','2015-10-04','2015-10-06','2015-10-06',null,5),
 (664,19,20,74690.54,8067.43,'2017-04-13','Diamond','On-premises','2017-04-18','2017-04-20','2017-04-27',null,4),
 (665,19,23,77017.67,9860.46,'2017-08-25','Gold','On-premises','2017-08-25','2017-08-27','2017-08-29',null,2),
 (666,11,16,92007.01,8345.92,'2016-12-04','Silver','On-premises','2016-12-14','2016-12-16','2016-12-18','2016-12-23',1),
 (667,18,8,91155.67,6150.55,'2017-05-02','Gold','Cloud','2017-05-02','2017-05-06','2017-05-08',null,5),
 (668,15,43,32166.13,10864.14,'2015-08-04','Gold','Cloud','2015-08-11','2015-08-14','2015-08-14',null,1),
 (669,5,37,90636.32,9925.66,'2017-12-16','Diamond','On-premises','2017-12-22','2017-12-26','2017-12-30',null,3),
 (670,10,46,96367.52,9655.0,'2017-10-02','Gold','Cloud','2017-10-02','2017-10-02','2017-10-03',null,2),
 (671,14,37,81730.38,11600.96,'2015-04-15','Premium','On-premises','2015-04-16','2015-04-16','2015-04-20',null,2),
 (672,17,42,80182.57,6977.8,'2017-12-19','Gold','Cloud','2017-12-19','2017-12-23','2017-12-24',null,2),
 (673,15,35,37788.76,7828.3,'2016-01-05','Diamond','On-premises','2016-01-08','2016-01-08','2016-01-14',null,4),
 (674,12,16,31229.06,9897.97,'2018-02-10','Silver','On-premises','2018-02-20','2018-02-24','2018-02-27','2018-03-05',5),
 (675,14,24,106105.79,6767.57,'2015-02-25','Silver','Cloud','2015-03-06','2015-03-09','2015-03-17','2015-03-22',4),
 (676,17,46,115666.45,7531.41,'2015-02-01','Gold','On-premises','2015-02-10','2015-02-11','2015-02-15',null,1),
 (677,13,51,37527.92,5465.07,'2017-08-10','Gold','Cloud','2017-08-10','2017-08-11','2017-08-11',null,4),
 (678,20,30,59539.81,10364.16,'2018-06-24','Diamond','Cloud','2018-06-30','2018-07-02','2018-07-04',null,2),
 (679,3,38,59555.01,6560.33,'2017-07-27','Gold','Cloud','2017-07-27','2017-07-28','2017-07-31',null,2),
 (680,14,57,107904.86,6123.46,'2017-04-01','Premium','On-premises','2017-04-05','2017-04-07','2017-04-11',null,3),
 (681,18,7,44771.34,7489.6,'2017-09-19','Gold','Cloud','2017-09-19','2017-09-23','2017-09-27',null,4),
 (682,1,17,88053.69,6674.3,'2017-04-23','Gold','On-premises','2017-04-23','2017-04-24','2017-04-27',null,3),
 (683,19,44,54465.0,9327.36,'2015-08-23','Silver','On-premises','2015-09-01','2015-09-08','2015-09-09','2015-09-16',5),
 (684,11,29,36020.04,8649.07,'2017-12-12','Diamond','On-premises','2017-12-15','2017-12-19','2017-12-21',null,5),
 (685,9,25,92293.83,8700.74,'2016-04-02','Premium','On-premises','2016-04-06','2016-04-06','2016-04-11',null,4),
 (686,12,19,96466.82,8472.29,'2017-05-26','Premium','Cloud','2017-05-31','2017-05-31','2017-05-31',null,1),
 (687,6,10,113540.39,7825.22,'2018-01-13','Gold','On-premises','2018-01-25','2018-01-28','2018-02-01',null,3),
 (688,15,51,47321.5,8571.0,'2015-08-18','Silver','Cloud','2015-08-23','2015-08-30','2015-09-04','2015-09-12',4),
 (689,12,48,53636.56,7715.13,'2016-05-24','Premium','On-premises','2016-05-28','2016-05-28','2016-05-31',null,1),
 (690,19,21,87049.82,7993.77,'2018-05-11','Silver','On-premises','2018-05-19','2018-05-26','2018-06-02','2018-06-07',2),
 (691,3,34,111267.71,7057.83,'2017-03-26','Gold','On-premises','2017-03-26','2017-03-27','2017-03-28',null,3),
 (692,17,52,117643.51,9825.16,'2016-12-20','Silver','On-premises','2016-12-30','2017-01-01','2017-01-06','2017-01-13',1),
 (693,20,53,109767.23,11528.44,'2015-12-03','Silver','Cloud','2015-12-11','2015-12-16','2015-12-20','2015-12-25',5),
 (694,15,8,83112.22,10656.09,'2015-06-21','Premium','Cloud','2015-06-25','2015-06-25','2015-06-29',null,4),
 (695,14,56,33836.42,10723.04,'2015-08-07','Silver','On-premises','2015-08-15','2015-08-17','2015-08-21','2015-08-27',1),
 (696,11,32,61649.22,10581.87,'2017-10-02','Gold','Cloud','2017-10-02','2017-10-03','2017-10-06',null,5),
 (697,1,40,69389.01,7230.6,'2015-03-02','Diamond','On-premises','2015-03-09','2015-03-11','2015-03-13',null,3),
 (698,10,46,116728.24,9875.24,'2018-04-29','Silver','Cloud','2018-05-09','2018-05-13','2018-05-21','2018-05-26',3),
 (699,9,53,79121.88,8751.63,'2017-12-17','Gold','On-premises','2017-12-17','2017-12-17','2017-12-17',null,1),
 (700,2,38,116412.81,7206.92,'2015-10-01','Silver','Cloud','2015-10-08','2015-10-13','2015-10-19','2015-10-24',4),
 (701,6,45,78814.0,11975.24,'2018-03-23','Premium','Cloud','2018-03-25','2018-03-27','2018-04-01',null,3),
 (702,16,2,108589.56,7853.18,'2015-12-15','Gold','On-premises','2015-12-26','2015-12-30','2015-12-30',null,4),
 (703,6,29,38606.85,6886.46,'2017-01-21','Diamond','Cloud','2017-01-27','2017-01-31','2017-02-05',null,2),
 (704,13,54,66994.93,7821.37,'2015-08-03','Gold','On-premises','2015-08-15','2015-08-20','2015-08-22',null,5),
 (705,5,38,52456.3,10471.19,'2017-12-22','Silver','Cloud','2017-12-22','2017-12-28','2018-01-01','2018-01-07',5),
 (706,2,3,104901.0,8691.09,'2015-02-02','Premium','On-premises','2015-02-04','2015-02-04','2015-02-08',null,5),
 (707,2,34,95873.42,11700.46,'2017-04-30','Diamond','Cloud','2017-05-04','2017-05-08','2017-05-08',null,2),
 (708,13,11,38188.67,9273.93,'2017-12-05','Silver','Cloud','2017-12-05','2017-12-10','2017-12-17','2017-12-23',3),
 (709,13,13,66392.79,10643.25,'2016-07-18','Diamond','Cloud','2016-07-23','2016-07-23','2016-07-26',null,5),
 (710,7,32,63218.06,10966.26,'2016-02-22','Premium','Cloud','2016-02-25','2016-02-27','2016-02-29',null,3),
 (711,17,60,50659.3,7924.6,'2015-05-03','Gold','Cloud','2015-05-10','2015-05-15','2015-05-18',null,1),
 (712,19,12,102723.58,5535.93,'2018-05-19','Gold','Cloud','2018-05-31','2018-05-31','2018-06-02',null,1),
 (713,14,35,110664.7,10333.22,'2015-02-04','Silver','On-premises','2015-02-11','2015-02-18','2015-02-19','2015-02-27',5),
 (714,7,45,107739.82,6819.38,'2017-07-22','Diamond','On-premises','2017-07-27','2017-07-30','2017-08-05',null,1),
 (715,3,58,77450.24,6400.36,'2016-10-04','Premium','On-premises','2016-10-07','2016-10-08','2016-10-13',null,2),
 (716,1,31,97185.29,11632.35,'2017-11-14','Diamond','Cloud','2017-11-19','2017-11-23','2017-11-23',null,3),
 (717,13,35,57587.64,6593.53,'2016-09-24','Silver','Cloud','2016-09-30','2016-10-01','2016-10-08','2016-10-15',1),
 (718,3,9,114421.79,6091.93,'2017-11-26','Diamond','On-premises','2017-12-03','2017-12-07','2017-12-09',null,5),
 (719,2,39,52420.32,8700.48,'2015-03-07','Gold','Cloud','2015-03-17','2015-03-21','2015-03-24',null,5),
 (720,2,48,117147.17,6528.96,'2016-01-12','Gold','Cloud','2016-01-23','2016-01-28','2016-01-29',null,2),
 (721,10,25,114593.39,8668.59,'2015-01-11','Premium','On-premises','2015-01-14','2015-01-14','2015-01-18',null,2),
 (722,13,25,103232.54,10112.3,'2015-09-18','Gold','Cloud','2015-09-27','2015-09-27','2015-09-29',null,2),
 (723,5,8,90833.18,7123.09,'2015-02-07','Gold','On-premises','2015-02-17','2015-02-17','2015-02-17',null,5),
 (724,13,50,105739.28,10782.15,'2017-12-23','Gold','Cloud','2017-12-23','2017-12-25','2017-12-29',null,1),
 (725,16,14,46051.17,9369.74,'2016-10-25','Silver','On-premises','2016-10-30','2016-11-06','2016-11-06','2016-11-13',1),
 (726,14,49,90175.18,7356.73,'2016-10-04','Silver','Cloud','2016-10-14','2016-10-16','2016-10-20','2016-10-25',5),
 (727,10,14,43034.33,10404.87,'2017-02-08','Diamond','Cloud','2017-02-11','2017-02-11','2017-02-16',null,5),
 (728,20,38,64826.77,8254.81,'2017-02-13','Premium','On-premises','2017-02-15','2017-02-17','2017-02-21',null,4),
 (729,8,57,61125.03,11322.95,'2017-11-24','Premium','On-premises','2017-11-27','2017-11-29','2017-12-03',null,2),
 (730,5,48,52017.35,6194.2,'2016-09-08','Gold','Cloud','2016-09-16','2016-09-16','2016-09-18',null,4),
 (731,16,18,57433.76,9975.41,'2017-10-14','Silver','On-premises','2017-10-14','2017-10-17','2017-10-22','2017-10-27',3),
 (732,5,20,56729.89,6475.79,'2018-07-14','Gold','Cloud','2018-07-24','2018-07-24','2018-07-26',null,4),
 (733,2,36,84343.66,5736.6,'2017-05-20','Gold','Cloud','2017-05-20','2017-05-25','2017-05-26',null,1),
 (734,10,44,119015.22,10573.9,'2016-01-21','Premium','Cloud','2016-01-22','2016-01-22','2016-01-24',null,2),
 (735,12,57,82321.22,9710.78,'2017-10-10','Premium','On-premises','2017-10-13','2017-10-15','2017-10-17',null,5),
 (736,10,9,74008.31,7285.07,'2017-08-06','Premium','On-premises','2017-08-08','2017-08-10','2017-08-11',null,1),
 (737,2,46,92386.67,7815.52,'2018-07-20','Premium','On-premises','2018-07-24','2018-07-26','2018-07-26',null,3),
 (738,16,39,77418.26,9688.77,'2016-05-13','Silver','Cloud','2016-05-22','2016-05-27','2016-06-01','2016-06-06',2),
 (739,13,7,103674.17,11764.26,'2017-05-23','Gold','On-premises','2017-05-23','2017-05-25','2017-05-25',null,3),
 (740,14,31,77022.37,6020.1,'2018-06-09','Silver','On-premises','2018-06-16','2018-06-22','2018-06-27','2018-07-02',3),
 (741,8,1,94275.57,5705.91,'2015-11-05','Silver','On-premises','2015-11-12','2015-11-17','2015-11-21','2015-11-28',3),
 (742,5,22,105701.78,8580.14,'2015-10-31','Gold','On-premises','2015-11-07','2015-11-07','2015-11-08',null,4),
 (743,1,56,85980.37,7485.18,'2015-12-22','Silver','On-premises','2016-01-01','2016-01-06','2016-01-14','2016-01-20',2),
 (744,2,32,98307.25,9156.84,'2015-02-17','Silver','Cloud','2015-02-27','2015-03-05','2015-03-09','2015-03-15',5),
 (745,20,45,68993.85,8646.61,'2018-02-07','Gold','On-premises','2018-02-19','2018-02-22','2018-02-26',null,3),
 (746,14,27,91767.9,8719.06,'2016-04-05','Gold','Cloud','2016-04-17','2016-04-19','2016-04-22',null,3),
 (747,20,51,52416.77,6557.82,'2016-11-11','Gold','Cloud','2016-11-18','2016-11-23','2016-11-23',null,1),
 (748,3,33,66378.08,6040.13,'2016-07-30','Diamond','Cloud','2016-08-05','2016-08-08','2016-08-08',null,4),
 (749,8,20,86977.12,10092.28,'2018-05-30','Silver','On-premises','2018-06-04','2018-06-05','2018-06-12','2018-06-19',2),
 (750,2,4,90184.35,11991.35,'2015-10-21','Silver','Cloud','2015-10-26','2015-10-26','2015-10-29','2015-11-05',5),
 (751,12,7,110103.01,5983.46,'2016-05-27','Diamond','On-premises','2016-06-03','2016-06-03','2016-06-06',null,1),
 (752,15,26,90026.79,8526.06,'2016-02-04','Diamond','On-premises','2016-02-09','2016-02-13','2016-02-16',null,2),
 (753,9,52,50743.53,9657.08,'2018-05-09','Premium','On-premises','2018-05-11','2018-05-11','2018-05-12',null,1),
 (754,19,29,90914.1,9153.79,'2017-09-22','Silver','On-premises','2017-09-22','2017-09-26','2017-10-02','2017-10-10',4),
 (755,7,24,117322.72,8316.85,'2015-08-27','Diamond','Cloud','2015-09-01','2015-09-04','2015-09-07',null,2),
 (756,16,52,93684.68,7105.83,'2018-02-24','Diamond','On-premises','2018-03-03','2018-03-04','2018-03-08',null,2),
 (757,8,25,112269.77,8824.02,'2016-03-31','Diamond','Cloud','2016-04-07','2016-04-08','2016-04-14',null,3),
 (758,10,40,95224.11,5513.3,'2016-03-15','Gold','On-premises','2016-03-24','2016-03-26','2016-03-29',null,4),
 (759,2,8,42377.53,9163.53,'2016-08-03','Premium','Cloud','2016-08-08','2016-08-09','2016-08-11',null,3),
 (760,8,15,44401.03,9459.75,'2017-02-27','Diamond','Cloud','2017-03-02','2017-03-06','2017-03-08',null,3),
 (761,10,7,95845.29,10175.4,'2016-09-27','Silver','On-premises','2016-10-03','2016-10-07','2016-10-11','2016-10-16',4),
 (762,15,17,75794.76,5170.55,'2015-05-13','Diamond','On-premises','2015-05-19','2015-05-23','2015-05-29',null,5),
 (763,20,18,102066.96,11792.96,'2015-09-09','Silver','On-premises','2015-09-14','2015-09-15','2015-09-18','2015-09-23',2),
 (764,9,16,77894.93,5577.53,'2017-05-18','Diamond','Cloud','2017-05-22','2017-05-24','2017-05-30',null,5),
 (765,19,13,118052.98,6039.05,'2015-06-26','Gold','On-premises','2015-07-04','2015-07-07','2015-07-09',null,5),
 (766,3,3,80038.31,6252.16,'2017-08-26','Premium','On-premises','2017-08-30','2017-08-30','2017-08-31',null,4),
 (767,4,27,90308.49,11073.07,'2016-02-08','Premium','Cloud','2016-02-11','2016-02-11','2016-02-11',null,1),
 (768,9,33,77309.75,11329.69,'2016-09-05','Silver','On-premises','2016-09-10','2016-09-14','2016-09-21','2016-09-27',4),
 (769,20,9,47287.97,8526.02,'2017-05-27','Premium','Cloud','2017-05-29','2017-05-29','2017-05-29',null,2),
 (770,19,16,91440.93,7461.92,'2017-09-04','Silver','On-premises','2017-09-04','2017-09-04','2017-09-11','2017-09-18',3),
 (771,14,28,79059.62,6125.81,'2016-01-07','Gold','Cloud','2016-01-18','2016-01-21','2016-01-23',null,2),
 (772,10,44,88058.42,11284.0,'2015-04-15','Premium','Cloud','2015-04-19','2015-04-20','2015-04-23',null,2),
 (773,1,49,54344.81,10761.32,'2017-08-29','Gold','On-premises','2017-08-29','2017-08-31','2017-08-31',null,1),
 (774,13,60,91902.08,10442.15,'2018-07-21','Gold','On-premises','2018-07-30','2018-08-01','2018-08-02',null,3),
 (775,1,54,102157.96,6757.34,'2018-01-18','Gold','On-premises','2018-01-25','2018-01-25','2018-01-25',null,3),
 (776,14,58,76877.91,5306.67,'2018-01-24','Diamond','Cloud','2018-01-29','2018-01-31','2018-02-05',null,1),
 (777,12,28,96298.9,10728.82,'2016-08-09','Diamond','On-premises','2016-08-12','2016-08-14','2016-08-20',null,1),
 (778,16,38,46414.2,7027.28,'2015-01-22','Premium','On-premises','2015-01-23','2015-01-25','2015-01-30',null,4),
 (779,5,21,113871.47,11859.31,'2015-02-21','Silver','On-premises','2015-03-03','2015-03-04','2015-03-07','2015-03-15',3),
 (780,20,5,87780.6,5154.36,'2018-07-16','Diamond','Cloud','2018-07-20','2018-07-21','2018-07-28',null,1),
 (781,20,38,45977.97,10752.36,'2015-02-17','Premium','On-premises','2015-02-22','2015-02-23','2015-02-23',null,5),
 (782,5,14,96521.3,9752.88,'2015-04-13','Diamond','Cloud','2015-04-18','2015-04-21','2015-04-26',null,2),
 (783,7,35,50976.09,7011.39,'2015-12-26','Gold','On-premises','2016-01-02','2016-01-07','2016-01-07',null,2),
 (784,15,11,40274.77,6404.19,'2016-04-21','Silver','On-premises','2016-05-01','2016-05-08','2016-05-10','2016-05-15',4),
 (785,2,32,36986.75,6062.11,'2017-04-18','Premium','On-premises','2017-04-19','2017-04-19','2017-04-22',null,5),
 (786,19,32,69510.69,5097.74,'2016-01-14','Premium','Cloud','2016-01-19','2016-01-21','2016-01-21',null,2),
 (787,5,54,61485.06,7234.41,'2016-05-25','Premium','Cloud','2016-05-29','2016-05-29','2016-05-29',null,4),
 (788,2,38,61569.94,9001.95,'2017-01-14','Diamond','Cloud','2017-01-21','2017-01-21','2017-01-22',null,1),
 (789,1,41,36789.58,8948.87,'2016-11-24','Diamond','Cloud','2016-11-27','2016-11-27','2016-12-04',null,5),
 (790,18,35,91381.53,9295.45,'2015-04-07','Gold','Cloud','2015-04-16','2015-04-21','2015-04-24',null,4),
 (791,14,18,88452.59,7112.2,'2016-11-18','Diamond','On-premises','2016-11-25','2016-11-27','2016-12-02',null,4),
 (792,19,31,64697.86,5678.51,'2017-03-30','Gold','Cloud','2017-03-30','2017-04-03','2017-04-05',null,4),
 (793,2,5,112672.47,7879.17,'2017-09-05','Diamond','Cloud','2017-09-09','2017-09-09','2017-09-10',null,4),
 (794,4,44,69861.57,10885.3,'2015-10-18','Premium','Cloud','2015-10-21','2015-10-21','2015-10-26',null,2),
 (795,10,23,112658.88,5034.58,'2017-05-29','Gold','Cloud','2017-05-29','2017-05-31','2017-05-31',null,4),
 (796,20,20,64502.91,8371.3,'2018-03-12','Gold','Cloud','2018-03-19','2018-03-20','2018-03-24',null,1),
 (797,14,4,77841.12,10725.07,'2016-03-24','Gold','Cloud','2016-04-01','2016-04-03','2016-04-03',null,5),
 (798,19,46,86381.15,11925.92,'2016-06-13','Premium','On-premises','2016-06-16','2016-06-17','2016-06-20',null,1),
 (799,17,6,67378.86,7350.25,'2017-10-06','Premium','On-premises','2017-10-10','2017-10-12','2017-10-16',null,2),
 (800,19,34,114312.92,6269.96,'2018-06-01','Silver','On-premises','2018-06-07','2018-06-13','2018-06-13','2018-06-18',1),
 (801,14,53,71794.18,6288.54,'2017-02-03','Gold','Cloud','2017-02-03','2017-02-08','2017-02-09',null,4),
 (802,14,8,66491.59,5818.55,'2018-02-26','Silver','Cloud','2018-03-06','2018-03-07','2018-03-14','2018-03-19',1),
 (803,14,8,31928.39,9089.2,'2017-10-25','Premium','Cloud','2017-10-27','2017-10-29','2017-10-30',null,2),
 (804,13,11,69009.45,6041.42,'2017-08-04','Gold','On-premises','2017-08-04','2017-08-08','2017-08-10',null,1),
 (805,13,54,117410.85,8610.59,'2015-02-17','Diamond','On-premises','2015-02-24','2015-02-24','2015-02-28',null,3),
 (806,11,55,31297.88,5390.71,'2018-04-29','Premium','On-premises','2018-05-02','2018-05-03','2018-05-08',null,2),
 (807,9,51,89931.61,9945.29,'2017-10-07','Premium','On-premises','2017-10-10','2017-10-10','2017-10-11',null,4),
 (808,9,21,103785.64,6476.07,'2015-01-13','Diamond','Cloud','2015-01-16','2015-01-20','2015-01-26',null,5),
 (809,19,57,77709.43,11173.45,'2017-07-11','Silver','On-premises','2017-07-11','2017-07-13','2017-07-15','2017-07-21',2),
 (810,14,23,93477.32,5185.19,'2017-07-26','Silver','On-premises','2017-07-26','2017-07-30','2017-08-06','2017-08-14',4),
 (811,10,33,90159.36,5817.23,'2017-03-16','Gold','On-premises','2017-03-16','2017-03-17','2017-03-21',null,5),
 (812,13,2,104678.98,8249.12,'2015-10-28','Gold','Cloud','2015-11-07','2015-11-11','2015-11-11',null,5),
 (813,1,45,48571.0,9905.78,'2017-08-12','Diamond','On-premises','2017-08-18','2017-08-20','2017-08-26',null,5),
 (814,8,42,77902.15,11358.41,'2016-01-20','Gold','Cloud','2016-01-28','2016-01-28','2016-01-28',null,1),
 (815,11,36,45666.06,8134.27,'2016-07-22','Gold','On-premises','2016-07-30','2016-07-30','2016-07-31',null,4),
 (816,7,48,77664.4,7675.21,'2016-10-26','Premium','On-premises','2016-10-31','2016-10-31','2016-10-31',null,3),
 (817,17,26,61556.35,5506.27,'2017-05-17','Premium','Cloud','2017-05-19','2017-05-20','2017-05-20',null,3),
 (818,6,1,63096.26,11479.83,'2015-03-18','Gold','On-premises','2015-03-26','2015-03-31','2015-03-31',null,1),
 (819,7,54,71061.57,11465.18,'2016-07-18','Premium','On-premises','2016-07-21','2016-07-23','2016-07-28',null,3),
 (820,16,22,88802.7,9562.97,'2015-08-21','Diamond','Cloud','2015-08-25','2015-08-28','2015-09-01',null,1),
 (821,8,25,42970.4,7431.9,'2015-09-17','Silver','Cloud','2015-09-27','2015-09-29','2015-09-30','2015-10-08',2),
 (822,7,52,41035.37,11474.29,'2017-08-22','Gold','On-premises','2017-08-22','2017-08-22','2017-08-26',null,3),
 (823,19,10,46241.81,9217.75,'2015-09-13','Diamond','Cloud','2015-09-19','2015-09-23','2015-09-26',null,2),
 (824,17,28,103726.4,7031.38,'2017-01-02','Silver','On-premises','2017-01-02','2017-01-02','2017-01-07','2017-01-14',3),
 (825,20,12,93112.51,11637.24,'2017-07-03','Diamond','Cloud','2017-07-07','2017-07-11','2017-07-12',null,2),
 (826,10,34,69707.87,9975.15,'2017-12-07','Premium','On-premises','2017-12-08','2017-12-08','2017-12-10',null,3),
 (827,20,30,65615.25,8515.87,'2017-09-21','Gold','Cloud','2017-09-21','2017-09-22','2017-09-23',null,2),
 (828,2,22,79830.39,5288.26,'2017-08-15','Gold','On-premises','2017-08-15','2017-08-17','2017-08-17',null,5),
 (829,12,4,91830.85,9626.12,'2016-11-14','Silver','On-premises','2016-11-24','2016-12-01','2016-12-03','2016-12-09',3),
 (830,7,15,61472.84,7313.54,'2018-06-23','Gold','Cloud','2018-07-05','2018-07-05','2018-07-09',null,3),
 (831,2,60,57389.47,9479.28,'2016-12-25','Diamond','On-premises','2016-12-30','2016-12-31','2017-01-01',null,2),
 (832,9,12,35899.3,5418.75,'2016-09-01','Silver','Cloud','2016-09-11','2016-09-11','2016-09-11','2016-09-18',5),
 (833,7,49,110420.7,10181.62,'2016-12-15','Silver','On-premises','2016-12-25','2016-12-27','2016-12-30','2017-01-04',5),
 (834,12,14,109944.41,10558.7,'2016-09-28','Gold','Cloud','2016-10-07','2016-10-09','2016-10-09',null,4),
 (835,6,36,73770.64,8592.43,'2015-03-06','Diamond','On-premises','2015-03-09','2015-03-13','2015-03-15',null,1),
 (836,3,50,76171.08,10936.57,'2015-12-04','Diamond','On-premises','2015-12-08','2015-12-10','2015-12-16',null,2),
 (837,10,19,105898.16,10089.08,'2016-04-03','Premium','Cloud','2016-04-04','2016-04-05','2016-04-10',null,1),
 (838,13,15,34475.5,11453.36,'2017-01-30','Diamond','On-premises','2017-02-02','2017-02-03','2017-02-04',null,2),
 (839,19,21,104505.35,7434.24,'2017-05-29','Gold','Cloud','2017-05-29','2017-06-01','2017-06-02',null,5),
 (840,4,55,47275.77,9545.03,'2017-03-02','Diamond','On-premises','2017-03-05','2017-03-06','2017-03-13',null,3),
 (841,13,37,68732.17,11362.59,'2016-07-15','Premium','On-premises','2016-07-17','2016-07-18','2016-07-21',null,5),
 (842,20,1,80326.34,8644.59,'2017-06-08','Silver','Cloud','2017-06-08','2017-06-09','2017-06-14','2017-06-19',1),
 (843,6,28,108669.44,7977.0,'2018-06-20','Gold','On-premises','2018-07-02','2018-07-03','2018-07-04',null,1),
 (844,11,54,90983.84,9431.12,'2015-04-24','Premium','Cloud','2015-04-27','2015-04-29','2015-05-04',null,2),
 (845,2,59,110134.3,8118.38,'2018-05-24','Silver','Cloud','2018-05-30','2018-05-30','2018-06-03','2018-06-10',1),
 (846,12,29,89120.98,9588.04,'2016-07-30','Gold','On-premises','2016-08-10','2016-08-13','2016-08-17',null,1),
 (847,6,55,98472.78,11287.78,'2018-07-23','Gold','Cloud','2018-08-01','2018-08-03','2018-08-04',null,4),
 (848,9,33,82479.15,10230.42,'2017-05-25','Diamond','Cloud','2017-05-29','2017-06-02','2017-06-08',null,4),
 (849,13,11,54443.77,8199.0,'2018-02-12','Premium','Cloud','2018-02-17','2018-02-17','2018-02-20',null,1),
 (850,10,26,114610.42,10201.52,'2017-02-08','Premium','On-premises','2017-02-11','2017-02-13','2017-02-13',null,3),
 (851,8,25,91539.21,11549.41,'2016-06-25','Gold','Cloud','2016-07-05','2016-07-05','2016-07-08',null,5),
 (852,19,1,83871.6,9030.86,'2017-04-15','Gold','On-premises','2017-04-15','2017-04-19','2017-04-19',null,3),
 (853,1,55,76117.91,7376.86,'2018-06-26','Silver','Cloud','2018-07-04','2018-07-04','2018-07-10','2018-07-17',3),
 (854,8,6,74988.38,10821.99,'2016-11-06','Gold','Cloud','2016-11-16','2016-11-19','2016-11-20',null,5),
 (855,11,33,105756.55,8784.49,'2017-11-10','Silver','Cloud','2017-11-10','2017-11-11','2017-11-18','2017-11-24',5),
 (856,16,29,117533.78,9346.9,'2017-12-29','Gold','On-premises','2017-12-29','2018-01-01','2018-01-05',null,4),
 (857,12,14,88337.44,11421.27,'2017-01-08','Premium','On-premises','2017-01-12','2017-01-13','2017-01-17',null,5),
 (858,2,44,104257.68,8084.25,'2015-05-24','Diamond','Cloud','2015-05-28','2015-05-31','2015-05-31',null,3),
 (859,12,24,101841.5,6213.63,'2018-01-31','Gold','On-premises','2018-02-12','2018-02-14','2018-02-15',null,1),
 (860,12,6,90337.39,10751.45,'2015-01-05','Silver','Cloud','2015-01-14','2015-01-15','2015-01-15','2015-01-21',4),
 (861,13,36,65358.54,11664.03,'2016-04-13','Diamond','On-premises','2016-04-20','2016-04-23','2016-04-30',null,5),
 (862,17,58,108716.09,7268.82,'2016-06-21','Diamond','Cloud','2016-06-27','2016-07-01','2016-07-05',null,1),
 (863,2,29,91852.58,8623.16,'2015-07-29','Premium','On-premises','2015-08-03','2015-08-03','2015-08-06',null,1),
 (864,5,6,67487.22,11688.9,'2017-06-26','Silver','Cloud','2017-06-26','2017-07-02','2017-07-07','2017-07-13',1),
 (865,11,32,60667.26,9598.66,'2018-05-26','Diamond','Cloud','2018-05-29','2018-06-02','2018-06-03',null,2),
 (866,20,13,64699.99,8470.49,'2017-12-09','Gold','Cloud','2017-12-09','2017-12-13','2017-12-17',null,1),
 (867,7,32,46179.33,6806.46,'2017-07-14','Diamond','Cloud','2017-07-20','2017-07-21','2017-07-24',null,1),
 (868,17,44,83137.46,11200.23,'2015-01-12','Diamond','On-premises','2015-01-17','2015-01-18','2015-01-23',null,2),
 (869,3,15,74832.68,5383.89,'2017-06-19','Diamond','Cloud','2017-06-25','2017-06-26','2017-06-30',null,4),
 (870,17,42,30756.85,11693.23,'2015-08-31','Gold','On-premises','2015-09-09','2015-09-13','2015-09-16',null,5),
 (871,9,60,34439.37,8691.42,'2015-06-25','Premium','On-premises','2015-06-29','2015-06-30','2015-07-02',null,5),
 (872,19,34,86412.51,9204.16,'2018-07-02','Gold','On-premises','2018-07-12','2018-07-15','2018-07-16',null,2),
 (873,16,24,76456.0,7472.07,'2016-07-04','Premium','On-premises','2016-07-07','2016-07-08','2016-07-13',null,4),
 (874,3,12,46267.7,6408.15,'2017-03-06','Diamond','On-premises','2017-03-09','2017-03-10','2017-03-13',null,2),
 (875,8,44,105856.07,5669.87,'2015-11-25','Silver','On-premises','2015-11-30','2015-12-04','2015-12-07','2015-12-15',1),
 (876,6,28,35356.38,7349.78,'2016-03-17','Diamond','Cloud','2016-03-20','2016-03-24','2016-03-28',null,5),
 (877,20,34,67116.01,7523.02,'2018-05-29','Silver','Cloud','2018-06-08','2018-06-09','2018-06-10','2018-06-17',2),
 (878,1,30,75102.25,6764.82,'2015-02-01','Diamond','On-premises','2015-02-07','2015-02-07','2015-02-10',null,5),
 (879,17,30,74189.54,11731.14,'2015-05-31','Silver','On-premises','2015-06-09','2015-06-15','2015-06-22','2015-06-27',3),
 (880,4,33,108128.29,10112.93,'2016-01-28','Premium','On-premises','2016-01-29','2016-01-30','2016-02-03',null,5),
 (881,2,44,78761.49,5570.26,'2018-03-30','Gold','On-premises','2018-04-08','2018-04-10','2018-04-11',null,5),
 (882,3,55,75770.11,8674.72,'2018-05-21','Gold','Cloud','2018-05-31','2018-06-01','2018-06-02',null,2),
 (883,6,1,93045.38,10878.53,'2016-09-16','Diamond','Cloud','2016-09-23','2016-09-25','2016-09-26',null,5),
 (884,10,35,106686.97,11600.03,'2017-12-21','Gold','Cloud','2017-12-21','2017-12-23','2017-12-24',null,1),
 (885,17,10,42744.61,8841.0,'2015-09-16','Gold','Cloud','2015-09-25','2015-09-27','2015-09-30',null,1),
 (886,13,49,92187.25,7919.45,'2017-08-17','Premium','Cloud','2017-08-21','2017-08-22','2017-08-24',null,5),
 (887,11,34,84063.14,8166.57,'2018-01-24','Premium','On-premises','2018-01-26','2018-01-27','2018-01-29',null,1),
 (888,2,59,117518.73,9416.77,'2015-11-23','Premium','On-premises','2015-11-26','2015-11-26','2015-11-26',null,1),
 (889,16,32,61169.1,7372.98,'2015-09-10','Premium','On-premises','2015-09-15','2015-09-16','2015-09-19',null,5),
 (890,19,26,94701.27,10924.81,'2018-05-03','Silver','On-premises','2018-05-09','2018-05-15','2018-05-19','2018-05-27',2),
 (891,20,58,87128.92,9113.45,'2015-08-03','Diamond','On-premises','2015-08-06','2015-08-10','2015-08-13',null,3),
 (892,18,49,57116.4,6920.97,'2015-02-16','Silver','On-premises','2015-02-24','2015-02-27','2015-03-05','2015-03-11',4),
 (893,12,27,76370.26,6930.31,'2015-10-09','Gold','Cloud','2015-10-19','2015-10-21','2015-10-22',null,5),
 (894,9,50,91850.13,5214.04,'2018-05-24','Premium','Cloud','2018-05-27','2018-05-27','2018-05-28',null,2),
 (895,10,28,83458.3,9420.54,'2018-04-26','Gold','On-premises','2018-05-07','2018-05-09','2018-05-10',null,1),
 (896,20,30,45090.55,5913.16,'2015-07-27','Premium','On-premises','2015-07-30','2015-08-01','2015-08-06',null,1),
 (897,18,9,68140.48,9613.94,'2016-06-09','Gold','On-premises','2016-06-19','2016-06-19','2016-06-20',null,5),
 (898,5,27,97011.68,8399.61,'2015-08-07','Premium','Cloud','2015-08-12','2015-08-13','2015-08-16',null,1),
 (899,16,49,88627.0,8435.61,'2015-10-26','Premium','Cloud','2015-10-27','2015-10-27','2015-10-28',null,4),
 (900,5,12,84301.49,6279.6,'2015-02-05','Silver','Cloud','2015-02-15','2015-02-18','2015-02-23','2015-03-03',2),
 (901,6,26,44602.48,6320.12,'2016-12-21','Silver','Cloud','2016-12-30','2017-01-01','2017-01-07','2017-01-13',3),
 (902,15,58,37158.51,10884.81,'2016-11-24','Gold','Cloud','2016-12-05','2016-12-09','2016-12-12',null,1),
 (903,13,16,87772.12,9607.2,'2017-03-25','Premium','On-premises','2017-03-29','2017-03-31','2017-04-05',null,4),
 (904,9,36,53320.28,10509.32,'2018-02-02','Silver','On-premises','2018-02-08','2018-02-15','2018-02-20','2018-02-28',5),
 (905,19,37,113171.69,8424.39,'2016-08-11','Gold','On-premises','2016-08-23','2016-08-26','2016-08-30',null,2),
 (906,1,15,76186.62,11827.43,'2016-01-25','Gold','Cloud','2016-02-03','2016-02-04','2016-02-08',null,5),
 (907,19,14,93514.76,11311.29,'2018-03-08','Diamond','On-premises','2018-03-14','2018-03-18','2018-03-19',null,4),
 (908,9,36,58681.48,5276.58,'2015-06-19','Silver','On-premises','2015-06-24','2015-07-01','2015-07-04','2015-07-11',2),
 (909,4,55,99306.1,11961.93,'2015-02-27','Gold','Cloud','2015-03-06','2015-03-09','2015-03-11',null,3),
 (910,12,39,54852.2,6415.68,'2015-03-21','Premium','On-premises','2015-03-24','2015-03-24','2015-03-28',null,4),
 (911,20,50,41612.33,8866.5,'2017-01-24','Gold','Cloud','2017-01-24','2017-01-28','2017-01-31',null,3),
 (912,6,33,105239.72,9763.61,'2018-01-28','Premium','Cloud','2018-01-30','2018-01-31','2018-02-04',null,5),
 (913,1,60,34473.6,6737.1,'2016-04-02','Diamond','On-premises','2016-04-07','2016-04-08','2016-04-12',null,5),
 (914,4,56,68766.77,9065.86,'2017-02-02','Diamond','Cloud','2017-02-05','2017-02-05','2017-02-09',null,4),
 (915,9,59,94244.58,8757.88,'2015-10-20','Premium','Cloud','2015-10-22','2015-10-22','2015-10-22',null,4),
 (916,4,50,83187.48,8809.83,'2015-09-22','Gold','Cloud','2015-09-29','2015-10-01','2015-10-04',null,5),
 (917,12,56,53778.45,11214.34,'2016-01-21','Silver','Cloud','2016-01-30','2016-02-01','2016-02-03','2016-02-10',2),
 (918,2,55,95314.98,11727.93,'2017-07-18','Premium','On-premises','2017-07-23','2017-07-25','2017-07-25',null,4),
 (919,18,9,109935.6,8992.46,'2018-04-25','Gold','Cloud','2018-05-02','2018-05-06','2018-05-10',null,2),
 (920,12,45,55738.39,9952.91,'2015-05-16','Gold','Cloud','2015-05-24','2015-05-25','2015-05-28',null,3),
 (921,15,33,48440.9,7926.87,'2015-06-10','Premium','Cloud','2015-06-13','2015-06-14','2015-06-14',null,5),
 (922,10,40,84293.15,5508.79,'2015-05-25','Gold','Cloud','2015-06-01','2015-06-06','2015-06-06',null,5),
 (923,1,11,114697.06,11561.25,'2016-08-16','Premium','On-premises','2016-08-20','2016-08-22','2016-08-23',null,4),
 (924,12,51,33503.56,6929.39,'2015-01-05','Gold','Cloud','2015-01-15','2015-01-18','2015-01-18',null,4),
 (925,5,14,42726.59,9285.94,'2015-03-30','Gold','Cloud','2015-04-07','2015-04-07','2015-04-10',null,5),
 (926,17,21,70475.57,5970.27,'2018-03-21','Premium','Cloud','2018-03-25','2018-03-27','2018-04-01',null,2),
 (927,13,26,73409.01,9151.92,'2015-12-21','Diamond','On-premises','2015-12-24','2015-12-24','2015-12-29',null,2),
 (928,3,9,60047.67,11613.41,'2015-11-20','Silver','Cloud','2015-11-26','2015-11-29','2015-12-03','2015-12-08',2),
 (929,15,32,46432.5,9027.32,'2017-05-27','Silver','On-premises','2017-05-27','2017-05-28','2017-06-01','2017-06-09',2),
 (930,3,9,104743.12,9708.21,'2018-05-06','Gold','On-premises','2018-05-18','2018-05-23','2018-05-27',null,4),
 (931,15,41,46068.54,10977.11,'2016-04-09','Diamond','Cloud','2016-04-14','2016-04-16','2016-04-23',null,2),
 (932,10,21,55445.35,11002.0,'2017-09-20','Premium','On-premises','2017-09-22','2017-09-23','2017-09-28',null,4),
 (933,12,15,114831.41,7424.22,'2016-12-24','Silver','Cloud','2016-12-30','2017-01-02','2017-01-07','2017-01-12',1),
 (934,2,22,90304.65,10238.58,'2016-09-19','Gold','On-premises','2016-09-28','2016-09-28','2016-10-01',null,1),
 (935,2,42,43883.29,5376.23,'2017-10-29','Diamond','Cloud','2017-11-03','2017-11-05','2017-11-07',null,3),
 (936,12,41,104985.15,8609.85,'2015-08-30','Diamond','On-premises','2015-09-06','2015-09-07','2015-09-09',null,3),
 (937,19,4,94688.13,8656.07,'2017-02-06','Premium','Cloud','2017-02-07','2017-02-08','2017-02-08',null,2),
 (938,20,6,39264.06,11823.63,'2018-06-22','Premium','On-premises','2018-06-27','2018-06-29','2018-07-02',null,3),
 (939,13,59,53345.21,7602.3,'2018-04-02','Silver','Cloud','2018-04-11','2018-04-11','2018-04-17','2018-04-22',2),
 (940,13,41,52631.98,8509.47,'2017-03-23','Diamond','Cloud','2017-03-29','2017-03-29','2017-04-02',null,1),
 (941,1,8,72523.79,10286.99,'2017-02-11','Gold','On-premises','2017-02-11','2017-02-11','2017-02-15',null,4),
 (942,1,52,39107.19,5795.57,'2016-04-10','Premium','Cloud','2016-04-13','2016-04-15','2016-04-16',null,5),
 (943,2,55,116019.28,7595.11,'2017-06-04','Silver','On-premises','2017-06-04','2017-06-08','2017-06-16','2017-06-21',4),
 (944,18,6,80313.79,6698.14,'2015-05-23','Diamond','On-premises','2015-05-30','2015-05-30','2015-06-02',null,5),
 (945,18,17,65991.62,10868.19,'2016-10-31','Premium','Cloud','2016-11-01','2016-11-01','2016-11-01',null,2),
 (946,8,18,48470.71,8310.55,'2016-11-27','Diamond','On-premises','2016-12-02','2016-12-06','2016-12-12',null,5),
 (947,9,40,72648.92,9243.36,'2015-04-24','Premium','On-premises','2015-04-27','2015-04-27','2015-05-02',null,4),
 (948,13,22,41848.57,7022.29,'2017-10-03','Silver','Cloud','2017-10-03','2017-10-06','2017-10-06','2017-10-11',1),
 (949,10,21,47717.55,11980.56,'2017-01-24','Diamond','Cloud','2017-01-28','2017-01-29','2017-02-02',null,4),
 (950,14,55,80044.05,11026.92,'2018-03-01','Premium','Cloud','2018-03-03','2018-03-05','2018-03-09',null,2),
 (951,3,4,62126.22,6861.41,'2015-12-31','Premium','On-premises','2016-01-01','2016-01-02','2016-01-03',null,4),
 (952,5,14,101003.7,11344.18,'2015-04-27','Diamond','Cloud','2015-04-30','2015-05-03','2015-05-07',null,1),
 (953,15,20,97835.23,7766.77,'2016-11-12','Gold','Cloud','2016-11-20','2016-11-20','2016-11-23',null,2),
 (954,17,7,45992.75,5687.61,'2016-03-26','Premium','Cloud','2016-03-28','2016-03-28','2016-03-28',null,2),
 (955,12,60,72029.41,5361.09,'2015-03-06','Gold','On-premises','2015-03-15','2015-03-20','2015-03-21',null,5),
 (956,12,24,82896.79,11847.67,'2015-01-08','Premium','Cloud','2015-01-12','2015-01-12','2015-01-17',null,4),
 (957,20,40,51492.91,5140.76,'2017-06-13','Gold','Cloud','2017-06-13','2017-06-17','2017-06-17',null,1),
 (958,19,40,66920.32,7089.95,'2017-07-11','Diamond','Cloud','2017-07-18','2017-07-21','2017-07-28',null,3),
 (959,9,31,110335.21,10516.36,'2015-11-09','Silver','Cloud','2015-11-16','2015-11-22','2015-11-22','2015-11-29',3),
 (960,18,36,78972.41,10580.09,'2018-03-06','Premium','On-premises','2018-03-09','2018-03-10','2018-03-10',null,4),
 (961,9,45,113026.26,10767.44,'2017-11-25','Gold','On-premises','2017-11-25','2017-11-28','2017-11-29',null,2),
 (962,20,13,116744.59,6941.96,'2017-01-09','Premium','On-premises','2017-01-13','2017-01-15','2017-01-15',null,4),
 (963,4,41,116301.4,5467.49,'2015-05-13','Premium','On-premises','2015-05-16','2015-05-17','2015-05-19',null,4),
 (964,7,29,47710.42,11812.54,'2015-10-11','Gold','Cloud','2015-10-23','2015-10-25','2015-10-25',null,1),
 (965,6,54,58890.83,8306.89,'2016-07-10','Premium','Cloud','2016-07-11','2016-07-13','2016-07-17',null,4),
 (966,5,27,66249.78,7948.5,'2017-07-05','Diamond','Cloud','2017-07-11','2017-07-13','2017-07-20',null,1),
 (967,17,46,31785.18,11577.68,'2016-04-13','Silver','Cloud','2016-04-18','2016-04-25','2016-04-26','2016-05-04',2),
 (968,14,60,51085.59,6687.9,'2018-07-30','Silver','Cloud','2018-08-07','2018-08-09','2018-08-12','2018-08-18',4),
 (969,6,51,31930.24,8643.39,'2018-04-30','Gold','Cloud','2018-05-11','2018-05-14','2018-05-14',null,3),
 (970,16,9,106234.02,7698.46,'2017-09-18','Diamond','Cloud','2017-09-25','2017-09-29','2017-10-03',null,5),
 (971,12,8,115311.78,10390.88,'2016-11-17','Silver','On-premises','2016-11-25','2016-11-27','2016-11-27','2016-12-02',5),
 (972,20,56,62744.84,11680.79,'2017-04-10','Gold','On-premises','2017-04-10','2017-04-14','2017-04-14',null,2),
 (973,4,37,110018.16,9425.56,'2017-08-13','Diamond','Cloud','2017-08-20','2017-08-23','2017-08-26',null,3),
 (974,15,14,87492.54,5107.74,'2017-09-18','Gold','Cloud','2017-09-18','2017-09-22','2017-09-26',null,3),
 (975,5,1,77007.49,8796.56,'2018-03-05','Diamond','Cloud','2018-03-10','2018-03-10','2018-03-14',null,1),
 (976,16,34,71157.19,10801.56,'2017-01-06','Premium','Cloud','2017-01-08','2017-01-09','2017-01-13',null,4),
 (977,5,5,37295.13,11048.55,'2015-04-12','Diamond','Cloud','2015-04-18','2015-04-18','2015-04-23',null,5),
 (978,18,53,34472.12,8669.79,'2015-04-23','Silver','Cloud','2015-04-30','2015-05-01','2015-05-03','2015-05-08',2),
 (979,14,24,96737.09,10173.43,'2018-07-25','Silver','On-premises','2018-07-30','2018-08-03','2018-08-10','2018-08-17',1),
 (980,8,60,85136.23,8461.3,'2018-02-16','Diamond','On-premises','2018-02-19','2018-02-23','2018-03-01',null,3),
 (981,8,44,86594.71,6894.89,'2017-06-17','Gold','On-premises','2017-06-17','2017-06-22','2017-06-23',null,2),
 (982,20,11,84412.74,9407.63,'2017-05-29','Gold','Cloud','2017-05-29','2017-05-30','2017-05-31',null,2),
 (983,18,49,51443.46,11129.06,'2018-02-05','Silver','Cloud','2018-02-11','2018-02-11','2018-02-14','2018-02-22',2),
 (984,2,49,100692.49,11566.53,'2017-04-03','Silver','On-premises','2017-04-03','2017-04-04','2017-04-11','2017-04-19',1),
 (985,15,13,36077.86,6569.9,'2015-10-05','Silver','On-premises','2015-10-13','2015-10-19','2015-10-24','2015-10-30',2),
 (986,2,19,84539.68,10113.8,'2016-01-02','Premium','On-premises','2016-01-07','2016-01-08','2016-01-13',null,2),
 (987,20,13,64398.39,7028.61,'2015-12-29','Diamond','On-premises','2016-01-03','2016-01-05','2016-01-11',null,1),
 (988,5,38,44388.29,8056.79,'2015-11-12','Premium','On-premises','2015-11-16','2015-11-16','2015-11-16',null,1),
 (989,1,27,116007.6,8829.18,'2018-03-01','Silver','Cloud','2018-03-08','2018-03-08','2018-03-16','2018-03-21',4),
 (990,16,6,41668.2,9062.69,'2016-05-31','Diamond','On-premises','2016-06-07','2016-06-07','2016-06-07',null,3),
 (991,19,24,104218.35,9432.05,'2018-07-18','Premium','Cloud','2018-07-21','2018-07-22','2018-07-25',null,3),
 (992,3,48,77630.41,6823.78,'2015-05-07','Diamond','On-premises','2015-05-12','2015-05-14','2015-05-21',null,3),
 (993,9,18,112600.99,9028.85,'2017-07-08','Silver','Cloud','2017-07-08','2017-07-09','2017-07-13','2017-07-20',1),
 (994,15,34,73889.26,7156.62,'2017-05-28','Gold','Cloud','2017-05-28','2017-05-30','2017-06-01',null,2),
 (995,3,19,76322.31,8364.81,'2017-02-22','Silver','On-premises','2017-02-22','2017-02-28','2017-03-08','2017-03-15',1),
 (996,8,51,53393.97,7583.49,'2017-10-23','Silver','On-premises','2017-10-23','2017-10-29','2017-11-01','2017-11-09',2),
 (997,10,39,98797.56,8058.65,'2017-09-01','Silver','On-premises','2017-09-01','2017-09-08','2017-09-09','2017-09-17',2),
 (998,7,24,44501.62,7261.99,'2015-10-25','Premium','On-premises','2015-10-28','2015-10-28','2015-10-28',null,3),
 (999,5,21,69873.62,11347.0,'2016-06-27','Silver','Cloud','2016-07-07','2016-07-10','2016-07-17','2016-07-22',1),
 (1000,20,33,83376.49,11660.5,'2018-05-26','Diamond','On-premises','2018-05-30','2018-06-02','2018-06-03',null,5),
 (1002,16,1,111.0,111.0,'2018-08-10','Diamond','Cloud','2018-08-15','2018-08-17','2018-08-22',null,null),
 (1003,16,1,111.0,111.0,'2018-08-10','Diamond','Cloud','2018-08-14','2018-08-18','2018-08-22',null,null),
 (1004,16,1,111.0,111.0,'2018-08-10','Diamond','Cloud','2018-08-17','2018-08-21','2018-08-23',null,null),
 (1005,1,15,111.0,111.0,'2018-08-10','Diamond','Cloud','2018-08-14','2018-08-17','2018-08-18',null,null),
 (1006,18,13,111.0,111.0,'2018-08-10','Diamond','Cloud','2018-08-14','2018-08-15','2018-08-16',null,null),
 (1007,22,55,8000.0,800.0,'2018-08-12','Silver','On-premises','2018-08-20','2018-08-26','2018-08-27','2018-09-01',null),
 (1008,7,4,9000.0,900.0,'2018-08-12','Silver','On-premises','2018-08-21','2018-08-25','2018-08-29','2018-09-03',null),
 (1009,14,14,10000.0,1000.0,'2018-08-12','Diamond','Cloud','2018-08-16','2018-08-20','2018-08-20',null,null),
 (1010,10,26,1999.0,199.0,'2018-08-12','Premium','Cloud','2018-08-17','2018-08-19','2018-08-20',null,null);


insert into Employees (fName, lName, InsuranceID, EDID, username) values ( 'Oralle', 'Kornilov', 1, 2, 'tjaukovick');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ( 'Barbaraanne', 'Tolcher', 1, 2, 'bkaesl');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ( 'Kort', 'Palliser', 2, 1, 'larkellm');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ( 'Cordey', 'Purcell', 3, 1, 'bbarkesn');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ( 'Vinson', 'Libbie', 1, 2, 'cchettero');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ( 'Orren', 'Cordeux', 3, 2, 'agorringep');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ( 'Germaine', 'Jaskiewicz', 1, 1, 'adallicoatq');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ( 'Hillard', 'Turrill', 1, 3, 'ahamleyr');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ( 'Brandyn', 'Duchateau', 2, 2, 'dbrentons');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ( 'Mellisent', 'Hadigate', 3, 1, 'dpeppettt');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ( 'Radcliffe', 'Moorman', 1, 2, 'bbeloeu');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ( 'Ford', 'Edden', 2, 3, 'rstowerv');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ( 'Blinni', 'Bisatt', 3, 1, 'fguerrew');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ( 'Hyacinthie', 'Crunden', 2, 3, 'bcastellinox');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ( 'Joaquin', 'Targe', 3, 1, 'mokroyy');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ( 'Mikel', 'Rainger', 3, 2, 'bundrellz');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ( 'Alexandros', 'Erickssen', 1, 2, 'ebuzza10');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ( 'Jerrie', 'Tudgay', 1, 1, 'lbaythrop11');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ( 'Ahmad', 'Castano', 2, 1, 'mmiller12');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ( 'Dillon', 'Castletine', 3, 3, 'dspurgin13');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Irene', 'Bermingham', 2, 1, 'amarkushkin0');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Cassi', 'Slimm', 1, 1, 'proelofsen1');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Birk', 'Senechault', 1, 2, 'mlechelle2');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Ferd', 'Baines', 3, 2, 'gsunman3');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Babs', 'Dodle', 1, 1, 'tpettifor4');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Hildegaard', 'Whittenbury', 1, 3, 'msueter5');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Clyve', 'Mynett', 3, 2, 'mhawe6');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Emmy', 'McEnery', 2, 3, 'lsirl7');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Vonnie', 'Tattersall', 2, 3, 'hmonkman8');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Farlie', 'Kondratenya', 3, 1, 'voldfield9');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Bernie', 'MacMeanma', 3, 3, 'vgroombridgea');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Alyosha', 'Bourrel', 3, 3, 'lswinnertonb');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Chelsie', 'Longfield', 1, 2, 'dgreeningc');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Salaidh', 'Hatterslay', 3, 1, 'rberksd');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Glenna', 'Corke', 1, 3, 'ymowdaye');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Maximo', 'Minucci', 3, 1, 'rgabelf');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Analise', 'Hovel', 2, 2, 'eshillumg');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Blake', 'Anstee', 2, 1, 'bderuggeroh');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Rice', 'Darrell', 3, 3, 'hbrooksoni');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Kanya', 'Brimmell', 1, 3, 'edukerj');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Sharline', 'Chrystie', 2, 1, 'nledgewayk');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Eve', 'Maden', 3, 1, 'mradleyl');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Shannon', 'Fowden', 2, 3, 'jminearm');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Sofie', 'Rubi', 1, 3, 'gspainn');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Charissa', 'Huntley', 1, 1, 'tbrookshawo');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Leilah', 'Tondeur', 2, 3, 'fpeap');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Benedetto', 'Hasted', 1, 3, 'akearnq');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Drud', 'Ratazzi', 3, 1, 'pstaplesr');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Roxane', 'Farbrace', 2, 1, 'nmccreaths');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Prisca', 'Rosenwald', 2, 1, 'ebrussellt');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Ivor', 'Coupman', 3, 3, 'bcapehornu');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Ezechiel', 'Aronovitz', 3, 2, 'heckelsv');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Gunar', 'Adamovitz', 3, 1, 'erayltonw');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Enos', 'Orrow', 1, 3, 'bwitherdenx');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Valaria', 'Tatchell', 2, 2, 'gboissiery');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Cherida', 'Jeynes', 3, 2, 'abiggerstaffz');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Timmy', 'Beeze', 2, 3, 'wcartwright10');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Laverna', 'Howman', 2, 3, 'eperrygo11');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Elnora', 'McGrey', 3, 1, 'awoakes12');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Rodge', 'Trow', 3, 2, 'rpregel13');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Eba', 'Newvill', 3, 1, 'jfellow14');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Rayner', 'Shorie', 2, 3, 'fworvill15');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Merell', 'Titterington', 2, 2, 'ywonfar16');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Tarrah', 'Carlucci', 3, 3, 'kwilmut17');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Olympe', 'Atyea', 1, 3, 'pmuckleston18');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Bogey', 'Copcutt', 1, 3, 'ismalman19');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Gayle', 'Cummine', 2, 3, 'jmanville1a');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Harv', 'Potkins', 3, 3, 'cpostlewhite1b');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Leland', 'Scandrite', 3, 3, 'dganford1c');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Alyosha', 'Sextone', 2, 3, 'bwinterscale1d');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Ettore', 'Leverson', 2, 3, 'kitzhaki1e');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Lowell', 'Talks', 3, 3, 'hcostley1f');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Tersina', 'Le Friec', 2, 2, 'dapark1g');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Bernadina', 'Cowwell', 1, 3, 'gnewdick1h');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Kimbra', 'Harse', 3, 3, 'slownsbrough1i');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Menard', 'Spada', 2, 3, 'fdixon1j');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Skip', 'Tupp', 2, 3, 'fdourin1k');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Morna', 'Brealey', 1, 3, 'opeachman1l');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Isac', 'Ciccotto', 1, 3, 'bcleverley1m');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Terrye', 'Caitlin', 2, 3, 'isazio1n');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Homer', 'Tapson', 1, 3, 'oeuston1o');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Georgie', 'Stallworthy', 2, 3, 'efearns1p');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Emery', 'Wield', 1, 3, 'csharnock1q');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Tammy', 'Hoff', 1, 3, 'mportwain1r');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Lira', 'Yoxall', 2, 3, 'cbarck1s');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Elspeth', 'Samwell', 3, 3, 'jpye1t');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Ogdan', 'MacCafferky', 1, 3, 'hgrene1u');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Moishe', 'Januszewski', 3, 3, 'kriolfo1v');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Marion', 'Scrine', 2, 3, 'zhorsfield1w');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Emelen', 'Matzel', 2, 3, 'jtollow1x');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Heinrick', 'Norcross', 2, 3, 'rkimm1y');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Barnabe', 'Wollrauch', 1, 3, 'cshallcrass1z');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Darci', 'Andriolli', 1, 3, 'rmcloney20');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Davina', 'Connelly', 2, 3, 'asenior21');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Helena', 'Caustic', 3, 3, 'bjohn22');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Halley', 'Ousbie', 3, 3, 'mgammon23');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Ganny', 'Dowling', 3, 3, 'gdevuyst24');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Gordan', 'Biles', 1, 3, 'tfennick25');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Corabel', 'Evers', 1, 3, 'lstannus26');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Juanita', 'Gilligan', 3, 3, 'ably27');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Buckie', 'Palfreman', 1, 3, 'awormald28');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Tiff', 'Proudler', 2, 3, 'cjeeks29');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Meara', 'Ganley', 3, 3, 'bbleazard2a');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Korie', 'Valenta', 3, 3, 'cmarian2b');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Avigdor', 'Comellini', 3, 3, 'aeccles2c');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Antonio', 'Gaynor', 2, 3, 'gcridlin2d');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Massimiliano', 'Gebbe', 3, 3, 'yscutching2e');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Jaquelyn', 'Addeycott', 2, 3, 'ccaush2f');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Arabella', 'Greedy', 3, 3, 'vmell2g');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Eadmund', 'Gabala', 3, 3, 'prichold2h');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Rosita', 'Ilden', 2, 3, 'wargont2i');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Vernice', 'Coetzee', 1, 3, 'mjeste2j');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Dotti', 'Glusby', 1, 3, 'tmeenehan2k');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Jeremiah', 'Chatters', 3, 3, 'jpeaden2l');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Lannie', 'Galle', 3, 3, 'fnussen2m');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Debby', 'Lindbergh', 2, 3, 'djacmar2n');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Linea', 'Lafrentz', 3, 3, 'jonge2o');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Ingram', 'Kingzett', 3, 3, 'pcoaster2p');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Cacilia', 'Traill', 1, 3, 'wcastellaccio2q');
insert into Employees (fName, lName, InsuranceID, EDID, username) values ('Melvin', 'Aldhouse', 3, 3, 'hgrinikhin2r');




insert into Hours (Date, EmployeeID, contID, hours) values ('2015-03-27', 84, 675, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-07-31', 17, 549, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-07-18', 50, 472, 13);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-08-23', 23, 891, 6);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-07-04', 26, 525, 26);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-05-14', 76, 205, 29);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-01-17', 85, 783, 13);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-06-22', 111, 921, 21);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-10-15', 6, 98, 24);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-06-06', 3, 18, 17);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-04-18', 99, 74, 20);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-12-24', 66, 836, 31);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-12-08', 61, 646, 33);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-10-08', 81, 885, 14);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-06-13', 52, 858, 27);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-09-01', 111, 475, 27);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-02-04', 53, 860, 31);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-07-31', 65, 549, 14);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-03-10', 34, 470, 10);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-05-14', 50, 205, 27);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-02-02', 41, 296, 8);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-05-23', 63, 158, 12);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-10-09', 52, 238, 32);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-08-26', 69, 668, 30);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-06-06', 21, 18, 32);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-09-08', 68, 358, 15);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-04-30', 80, 413, 26);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-06-06', 120, 18, 16);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-05-17', 62, 448, 12);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-03-28', 107, 955, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-05-10', 6, 577, 22);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-02-02', 65, 808, 15);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-07-18', 60, 472, 7);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-12-08', 66, 646, 32);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-05-27', 37, 157, 32);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-05-27', 77, 157, 10);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-05-03', 57, 564, 6);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-08-27', 105, 191, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-07-04', 84, 525, 35);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-02-02', 113, 808, 13);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-11-02', 111, 614, 21);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-01-09', 107, 44, 33);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-04-15', 28, 197, 33);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-08-15', 91, 286, 26);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-12-23', 84, 523, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-12-05', 61, 647, 29);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-12-26', 85, 360, 33);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-10-15', 19, 611, 16);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-04-09', 28, 600, 22);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-08-26', 66, 668, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-10-15', 60, 611, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-08-10', 44, 532, 15);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-07-08', 48, 425, 27);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-10-09', 100, 763, 8);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-09-22', 85, 889, 15);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-01-18', 113, 328, 18);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-05-24', 67, 167, 20);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-10-02', 15, 599, 10);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-06-30', 49, 879, 6);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-12-05', 82, 647, 22);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-05-17', 88, 952, 33);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-04-28', 84, 485, 22);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-12-30', 53, 331, 25);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-04-28', 39, 485, 15);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-10-14', 61, 663, 7);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-11-24', 76, 988, 30);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-11-04', 37, 985, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-03-26', 103, 835, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-02-04', 57, 109, 24);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-03-12', 12, 63, 15);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-11-20', 107, 750, 19);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-09-08', 64, 358, 32);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-08-29', 21, 91, 7);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-02-02', 116, 179, 9);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-08-26', 59, 668, 7);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-07-03', 45, 694, 12);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-08-08', 25, 896, 5);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-11-14', 39, 185, 10);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-02-03', 67, 778, 34);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-12-23', 24, 377, 5);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-11-19', 18, 812, 35);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-08-10', 116, 863, 34);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-02-23', 27, 676, 14);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-10-08', 44, 885, 18);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-11-14', 118, 185, 16);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-11-01', 60, 915, 18);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-05-03', 42, 561, 8);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-08-29', 117, 91, 10);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-12-06', 105, 629, 12);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-03-07', 57, 560, 18);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-04-01', 71, 168, 18);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-08-07', 110, 452, 33);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-05-23', 68, 978, 30);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-03-05', 92, 94, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-08-25', 15, 327, 17);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-01-29', 71, 368, 31);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-01-29', 41, 172, 12);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-02-04', 111, 860, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-01-06', 114, 702, 26);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-10-14', 117, 916, 5);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-12-26', 20, 360, 31);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-04-27', 11, 772, 32);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-09-22', 80, 683, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-01-18', 65, 987, 24);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-10-31', 85, 893, 13);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-01-12', 36, 951, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-06-11', 101, 602, 8);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-04-15', 63, 197, 16);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-09-01', 33, 475, 34);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-05-06', 18, 844, 20);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-09-01', 35, 475, 15);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-01-12', 87, 951, 20);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-06-12', 90, 944, 14);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-12-21', 36, 72, 30);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-04-27', 83, 671, 35);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-01-05', 57, 120, 21);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-05-17', 35, 952, 33);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-01-15', 34, 522, 32);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-03-12', 115, 63, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-05-03', 61, 782, 31);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-05-03', 30, 561, 14);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-11-20', 13, 750, 16);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-03-18', 110, 892, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-01-18', 35, 328, 18);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-02-01', 69, 868, 8);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-05-31', 32, 40, 14);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-04-02', 90, 910, 22);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-12-30', 70, 193, 26);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-03-28', 51, 108, 21);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-08-08', 115, 896, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-12-02', 74, 455, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-08-10', 77, 532, 7);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-12-06', 69, 629, 13);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-10-10', 97, 722, 5);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-05-27', 33, 992, 19);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-06-05', 61, 412, 6);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-02-11', 28, 282, 20);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-06-06', 55, 18, 16);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-10-06', 66, 247, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-06-23', 99, 229, 8);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-11-24', 33, 988, 17);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-12-09', 110, 959, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-04-09', 27, 818, 34);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-12-13', 46, 491, 30);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-07-19', 25, 908, 29);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-04-13', 47, 453, 32);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-01-12', 58, 951, 5);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-10-30', 43, 90, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-01-23', 43, 721, 10);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-06-19', 92, 171, 10);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-06-19', 102, 171, 20);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-06-05', 117, 412, 15);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-05-06', 87, 844, 34);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-01-13', 6, 401, 7);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-05-25', 73, 20, 5);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-04-15', 26, 197, 14);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-01-14', 86, 184, 16);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-07-27', 27, 503, 30);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-08-23', 2, 891, 12);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-08-15', 83, 286, 12);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-07-18', 3, 472, 25);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-05-03', 84, 561, 24);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-03-07', 44, 560, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-05-25', 82, 711, 6);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-08-29', 76, 91, 26);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-10-31', 27, 700, 30);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-10-10', 116, 722, 17);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-04-02', 109, 910, 7);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-07-04', 91, 525, 32);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-06-08', 81, 126, 7);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-05-23', 76, 158, 13);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-12-27', 74, 369, 13);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-04-19', 6, 212, 25);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-12-05', 3, 613, 31);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-11-14', 43, 185, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-01-04', 26, 389, 22);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-12-12', 105, 603, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-05-06', 13, 947, 33);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-06-16', 120, 326, 19);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-02-02', 28, 296, 35);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-05-31', 105, 40, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-08-19', 1, 898, 5);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-12-05', 114, 741, 19);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-12-12', 29, 603, 8);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-04-10', 115, 198, 25);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-03-18', 49, 496, 24);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-06-16', 9, 326, 35);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-04-19', 85, 595, 31);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-08-19', 31, 898, 31);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-12-20', 76, 317, 35);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-04-15', 29, 197, 19);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-05-06', 36, 844, 21);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-12-30', 109, 193, 17);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-11-23', 118, 323, 30);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-06-12', 17, 944, 18);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-01-22', 46, 592, 12);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-11-23', 87, 323, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-11-23', 23, 323, 19);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-01-02', 70, 693, 26);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-03-01', 7, 723, 35);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-11-06', 36, 998, 27);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-12-05', 24, 888, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-03-01', 56, 781, 26);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-11-02', 114, 614, 26);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-11-02', 116, 246, 26);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-08-27', 58, 191, 33);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-03-12', 83, 63, 22);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-05-03', 4, 563, 16);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-11-20', 6, 750, 31);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-05-03', 26, 561, 31);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-03-10', 102, 398, 20);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-04-02', 76, 910, 18);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-03-10', 29, 470, 9);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-01-21', 19, 206, 12);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-10-31', 33, 700, 25);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-12-29', 106, 337, 27);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-11-14', 66, 185, 18);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-12-13', 19, 491, 7);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-12-30', 4, 193, 6);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-01-27', 94, 924, 14);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-09-22', 20, 889, 16);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-10-09', 113, 238, 17);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-02-07', 90, 606, 22);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-11-14', 97, 185, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-01-15', 84, 522, 9);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-02-05', 97, 346, 7);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-01-29', 108, 368, 22);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-11-04', 118, 985, 33);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-04-21', 51, 925, 26);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-12-06', 103, 363, 15);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-05-31', 102, 40, 32);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-08-27', 44, 191, 15);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-11-14', 55, 185, 27);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-03-28', 97, 955, 35);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-04-27', 80, 772, 8);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-09-22', 53, 870, 24);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-01-02', 39, 217, 8);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-12-26', 13, 360, 9);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-12-05', 62, 613, 20);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-04-27', 115, 772, 15);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-04-22', 16, 240, 6);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-06-25', 87, 324, 7);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-12-23', 3, 523, 19);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-10-17', 19, 821, 19);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-12-05', 119, 888, 18);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-05-03', 113, 563, 10);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-06-07', 10, 920, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-06-12', 15, 944, 20);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-03-25', 40, 222, 14);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-04-21', 55, 925, 32);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-04-11', 101, 105, 14);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-10-01', 78, 643, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-05-03', 32, 564, 24);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-06-02', 14, 762, 32);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-04-20', 70, 21, 34);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-03-10', 52, 398, 29);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-01-23', 102, 582, 17);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-12-29', 32, 426, 27);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-10-05', 120, 650, 5);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-03-01', 75, 723, 31);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-12-25', 1, 875, 20);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-09-17', 10, 688, 15);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-11-02', 75, 71, 7);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-01-10', 29, 927, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-01-21', 93, 206, 6);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-01-18', 75, 328, 35);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-08-10', 9, 260, 19);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-10-17', 3, 821, 27);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-03-01', 39, 781, 5);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-06-15', 71, 65, 21);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-08-25', 56, 704, 13);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-03-18', 119, 496, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-04-18', 88, 451, 17);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-05-27', 52, 267, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-04-27', 70, 772, 15);
insert into Hours (Date, EmployeeID, contID, hours) values ('2015-12-17', 101, 182, 5);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-02-24', 22, 752, 14);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-02-24', 112, 752, 19);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-12-17', 65, 946, 5);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-04-14', 31, 19, 14);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-05-21', 85, 241, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-08-24', 54, 307, 24);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-08-08', 106, 228, 26);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-02-08', 29, 510, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-12-10', 36, 502, 7);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-04-07', 68, 386, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-08-21', 61, 473, 27);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-03-17', 62, 463, 26);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-11-29', 91, 609, 34);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-03-05', 109, 710, 25);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-09-16', 117, 559, 15);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-06-29', 99, 78, 22);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-04-06', 103, 758, 26);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-01-25', 50, 57, 9);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-09-06', 111, 474, 34);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-08-10', 12, 252, 7);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-03-18', 79, 114, 12);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-07-27', 68, 841, 30);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-10-24', 80, 320, 24);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-11-15', 51, 404, 25);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-10-01', 20, 832, 25);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-03-20', 100, 554, 7);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-06-20', 78, 990, 32);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-06-12', 113, 738, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-12-11', 65, 371, 14);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-11-13', 61, 141, 25);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-09-16', 50, 559, 29);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-12-03', 67, 747, 35);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-04-17', 22, 481, 16);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-01-08', 45, 508, 14);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-12-12', 96, 419, 13);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-04-27', 65, 746, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-12-14', 47, 789, 14);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-12-17', 12, 946, 31);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-01-24', 24, 304, 31);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-12-22', 7, 648, 22);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-01-14', 54, 831, 29);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-11-12', 45, 945, 25);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-12-25', 47, 530, 12);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-05-30', 50, 492, 35);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-05-28', 111, 299, 18);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-03-15', 12, 230, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-01-14', 29, 831, 18);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-06-08', 94, 50, 9);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-06-06', 98, 787, 30);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-02-03', 88, 514, 19);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-06-01', 93, 311, 30);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-07-06', 81, 581, 30);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-01-14', 113, 833, 19);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-02-22', 100, 82, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-05-03', 113, 568, 32);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-02-20', 62, 767, 21);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-06-18', 25, 652, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-01-05', 103, 352, 18);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-04-17', 50, 481, 29);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-08-07', 2, 709, 24);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-07-06', 98, 581, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-03-17', 53, 463, 9);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-05-21', 8, 95, 33);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-10-03', 42, 68, 32);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-01-19', 96, 408, 19);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-08-15', 19, 759, 6);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-07-07', 55, 372, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-09-04', 16, 630, 6);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-10-05', 53, 768, 15);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-07-24', 75, 533, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-01-19', 116, 408, 34);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-06-19', 92, 414, 8);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-08-21', 11, 846, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-05-03', 21, 861, 29);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-02-03', 65, 720, 9);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-04-15', 34, 837, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-12-08', 25, 791, 7);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-07-22', 60, 965, 30);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-08-01', 60, 177, 13);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-04-20', 23, 757, 8);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-08-24', 16, 307, 6);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-09-06', 52, 474, 13);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-08-28', 4, 923, 22);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-08-31', 23, 128, 31);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-01-19', 4, 203, 24);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-01-20', 56, 901, 25);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-05-02', 68, 119, 18);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-07-17', 15, 851, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-05-03', 120, 861, 29);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-07-30', 18, 819, 24);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-08-13', 52, 815, 18);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-03-24', 75, 92, 19);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-04-28', 15, 465, 13);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-11-05', 55, 93, 24);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-04-06', 118, 655, 25);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-11-12', 99, 370, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-04-04', 69, 306, 14);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-11-24', 12, 466, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-04-11', 118, 543, 25);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-09-26', 13, 280, 13);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-05-13', 90, 967, 14);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-10-12', 85, 41, 16);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-04-15', 56, 837, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-03-27', 19, 121, 12);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-10-23', 19, 214, 31);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-02-03', 108, 514, 29);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-09-28', 107, 85, 25);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-10-26', 14, 86, 18);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-11-24', 43, 725, 16);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-02-10', 61, 215, 21);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-07-22', 119, 965, 18);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-09-14', 19, 227, 20);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-11-03', 62, 726, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-03-05', 44, 710, 16);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-05-06', 26, 566, 31);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-05-03', 61, 861, 16);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-01-14', 90, 831, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-12-11', 86, 371, 18);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-12-03', 4, 747, 12);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-02-12', 57, 344, 35);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-08-13', 21, 815, 17);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-08-28', 51, 923, 16);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-02-12', 70, 623, 15);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-12-11', 109, 371, 22);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-01-29', 87, 301, 13);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-12-17', 104, 443, 12);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-07-25', 79, 148, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-09-06', 35, 474, 31);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-01-25', 102, 57, 29);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-01-03', 33, 666, 35);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-02-03', 109, 720, 10);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-09-28', 76, 85, 29);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-02-09', 18, 201, 7);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-01-14', 69, 831, 26);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-04-22', 43, 913, 9);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-06-07', 27, 223, 22);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-12-31', 55, 441, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-07-24', 86, 533, 22);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-07-16', 102, 873, 22);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-11-04', 104, 56, 20);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-10-23', 87, 214, 9);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-04-20', 101, 757, 6);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-11-15', 17, 404, 18);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-08-08', 111, 228, 17);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-10-05', 7, 768, 5);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-11-11', 73, 66, 30);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-10-05', 64, 768, 9);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-03-14', 45, 515, 27);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-10-01', 60, 832, 25);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-08-24', 85, 307, 27);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-07-06', 87, 581, 13);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-08-10', 16, 252, 15);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-09-23', 23, 298, 8);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-04-07', 104, 386, 18);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-09-26', 26, 578, 30);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-07-25', 108, 112, 7);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-05-31', 86, 403, 7);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-04-18', 39, 142, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-04-28', 64, 465, 6);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-05-30', 8, 492, 10);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-12-23', 3, 471, 24);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-06-06', 66, 97, 35);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-07-18', 86, 11, 18);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-11-04', 5, 56, 7);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-04-17', 57, 481, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-10-28', 80, 22, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-10-24', 56, 717, 12);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-05-28', 52, 299, 6);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-05-06', 12, 566, 26);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-07-01', 75, 897, 32);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-06-05', 116, 689, 17);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-06-06', 53, 787, 17);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-04-07', 2, 386, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-12-31', 80, 441, 22);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-04-20', 22, 127, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-12-23', 16, 471, 5);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-06-05', 104, 689, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-10-14', 98, 597, 20);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-01-03', 35, 666, 10);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-02-24', 68, 752, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-07-16', 49, 873, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-03-14', 49, 515, 5);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-02-17', 106, 166, 16);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-10-26', 94, 86, 22);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-05-03', 103, 861, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-01-26', 87, 469, 5);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-05-29', 73, 329, 32);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-11-09', 76, 70, 16);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-02-07', 27, 524, 14);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-10-06', 55, 883, 8);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-09-26', 19, 578, 33);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-10-12', 16, 115, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-02-11', 98, 814, 17);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-10-28', 94, 656, 27);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-11-21', 80, 144, 34);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-04-28', 107, 465, 30);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-07-19', 52, 313, 7);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-05-17', 117, 268, 15);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-02-09', 30, 201, 12);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-06-16', 89, 751, 8);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-02-09', 61, 880, 7);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-02-24', 87, 752, 34);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-02-07', 29, 524, 26);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-03-10', 32, 73, 14);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-09-17', 65, 151, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-03-15', 113, 145, 34);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-08-01', 9, 177, 15);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-02-12', 111, 623, 27);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-06-21', 13, 77, 26);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-04-27', 69, 746, 10);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-09-24', 66, 395, 34);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-02-28', 11, 28, 15);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-01-26', 96, 235, 17);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-07-06', 45, 581, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-10-03', 80, 68, 12);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-07-24', 3, 533, 19);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-03-21', 79, 275, 19);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-01-26', 79, 235, 30);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-06-06', 75, 97, 34);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-05-21', 20, 241, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-01-20', 60, 901, 25);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-03-05', 23, 710, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-01-29', 42, 301, 33);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-08-19', 38, 748, 12);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-08-30', 109, 269, 29);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-08-10', 112, 252, 33);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-10-16', 17, 226, 22);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-04-03', 2, 49, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-02-24', 31, 752, 5);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-12-04', 63, 586, 25);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-10-02', 47, 388, 14);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-07-24', 79, 533, 17);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-10-14', 40, 597, 31);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-10-05', 17, 768, 30);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-08-21', 85, 846, 27);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-04-25', 61, 456, 30);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-09-13', 37, 192, 18);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-04-07', 21, 386, 13);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-06-25', 11, 798, 14);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-06-06', 16, 787, 14);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-01-23', 45, 933, 13);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-08-26', 106, 537, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-02-03', 9, 720, 5);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-03-18', 60, 114, 24);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-12-23', 99, 471, 24);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-01-27', 32, 55, 27);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-08-21', 117, 473, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-12-14', 9, 829, 19);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-10-26', 120, 86, 33);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-04-27', 58, 746, 13);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-12-31', 36, 441, 22);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-10-14', 22, 597, 16);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-12-11', 9, 371, 6);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-07-25', 87, 112, 17);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-08-01', 4, 177, 20);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-10-27', 89, 761, 30);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-01-14', 36, 831, 18);
insert into Hours (Date, EmployeeID, contID, hours) values ('2016-12-08', 116, 216, 13);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-01', 91, 10, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-04-21', 70, 792, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-05-06', 59, 498, 6);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-01-03', 105, 415, 17);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-07-01', 27, 541, 27);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-12-07', 89, 548, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-07-30', 43, 918, 17);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-03-22', 35, 110, 24);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-07-25', 94, 966, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-02-28', 111, 316, 14);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-02-25', 27, 801, 9);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-06-07', 96, 764, 35);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-06-16', 52, 237, 16);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-03-17', 22, 209, 24);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-12-02', 117, 640, 7);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-02-28', 37, 727, 9);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-04-25', 5, 424, 10);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-04-03', 18, 457, 8);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-04-25', 32, 424, 32);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-07-08', 60, 653, 8);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-05-02', 27, 972, 8);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-10-13', 17, 827, 8);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-12-19', 35, 376, 21);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-02-24', 114, 266, 19);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-01-21', 112, 705, 21);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-01-20', 37, 856, 14);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-09-02', 91, 973, 25);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-04-10', 50, 625, 16);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-04-28', 41, 483, 29);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-11-11', 95, 87, 34);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-03-26', 114, 874, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-12-06', 52, 729, 30);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-04-16', 35, 553, 9);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-10-11', 91, 681, 27);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-02-25', 13, 801, 14);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-05-06', 45, 294, 30);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-03-19', 56, 760, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-04-03', 106, 457, 20);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-21', 45, 139, 13);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-01-03', 61, 277, 33);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-11-02', 3, 948, 35);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-05-12', 42, 342, 26);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-07-19', 30, 59, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-15', 40, 507, 10);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-06-26', 20, 929, 27);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-05-02', 2, 972, 29);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-01-26', 40, 387, 22);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-02-28', 1, 316, 24);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-02-19', 60, 838, 17);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-02-08', 31, 410, 31);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-07-08', 26, 653, 17);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-09-17', 4, 489, 27);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-04-28', 24, 122, 25);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-07-30', 47, 918, 10);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-12-07', 19, 548, 9);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-07-13', 81, 251, 21);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-07-10', 65, 293, 24);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-11-20', 78, 435, 8);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-01-20', 5, 856, 6);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-06-11', 47, 287, 27);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-11-11', 44, 259, 16);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-03-19', 84, 760, 26);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-10-11', 70, 681, 34);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-21', 43, 139, 19);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-12-22', 10, 662, 19);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-05-05', 24, 48, 18);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-05-03', 69, 984, 20);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-09-15', 9, 135, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-04-03', 77, 271, 15);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-04-12', 28, 356, 27);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-10-19', 59, 103, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-03-02', 33, 106, 9);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-11-30', 52, 488, 29);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-02-28', 28, 316, 5);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-12-04', 99, 421, 22);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-04-25', 9, 424, 12);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-02-11', 101, 366, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-06-24', 116, 255, 12);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-05-24', 40, 667, 6);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-10-22', 111, 754, 7);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-07', 115, 993, 16);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-02-24', 100, 140, 8);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-10-19', 45, 103, 29);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-05-15', 34, 682, 9);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-06-06', 82, 618, 9);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-02-11', 31, 366, 14);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-03', 100, 374, 30);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-02-13', 41, 949, 35);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-11-06', 82, 803, 25);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-29', 27, 536, 34);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-04-13', 13, 47, 31);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-12-04', 56, 716, 35);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-06-29', 70, 99, 19);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-07-10', 95, 293, 31);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-05-01', 59, 353, 16);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-02-09', 112, 152, 21);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-10-01', 14, 638, 15);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-12-25', 110, 641, 19);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-10-12', 6, 547, 6);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-05-12', 98, 342, 26);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-12-09', 71, 5, 12);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-10-15', 89, 37, 25);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-05-02', 105, 972, 22);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-24', 79, 176, 19);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-06-20', 30, 795, 26);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-09-17', 42, 489, 18);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-06-26', 60, 929, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-12-31', 26, 262, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-09-11', 21, 620, 32);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-03', 44, 506, 31);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-03-24', 72, 27, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-12-09', 5, 5, 21);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-05-28', 45, 347, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-09-17', 11, 489, 30);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-06', 69, 236, 33);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-04-23', 23, 349, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-06-20', 8, 355, 32);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-25', 18, 810, 5);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-03-24', 21, 27, 34);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-01', 113, 10, 22);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-02-28', 83, 316, 18);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-10-01', 84, 997, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-09-01', 109, 813, 18);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-12-13', 54, 62, 15);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-10-27', 10, 431, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-11-01', 84, 658, 20);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-02-28', 111, 727, 8);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-10-11', 116, 681, 27);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-04-23', 28, 349, 16);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-07-26', 113, 864, 10);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-02-25', 71, 728, 30);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-10-04', 25, 444, 20);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-04-16', 17, 553, 29);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-07-25', 42, 416, 25);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-07', 69, 993, 14);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-02-08', 87, 410, 10);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-01-23', 107, 529, 19);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-04-03', 15, 645, 34);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-02-28', 54, 727, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-03', 20, 527, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-10-27', 8, 431, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-06-24', 100, 255, 26);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-06-07', 96, 686, 10);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-29', 73, 550, 5);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-12-31', 43, 866, 31);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-10-20', 67, 593, 32);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-07-05', 43, 957, 32);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-10-08', 51, 970, 27);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-02-20', 100, 850, 30);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-05-04', 69, 588, 16);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-05-05', 73, 651, 18);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-05-10', 52, 310, 16);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-06-21', 32, 160, 22);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-06', 56, 236, 35);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-03', 79, 506, 8);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-03-11', 114, 291, 33);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-01-03', 34, 3, 17);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-06-15', 14, 477, 5);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-01-21', 29, 705, 5);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-02-11', 39, 610, 26);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-11-11', 100, 259, 6);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-02-11', 83, 366, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-04-21', 10, 792, 6);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-07-22', 61, 89, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-01', 117, 10, 14);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-01-15', 92, 644, 25);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-05-29', 98, 596, 9);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-10-03', 116, 9, 29);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-04-28', 107, 88, 29);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-01-05', 39, 669, 29);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-05-05', 80, 48, 24);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-06-08', 106, 769, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-02-11', 104, 610, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-25', 16, 810, 25);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-06-14', 51, 739, 17);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-11-18', 5, 935, 24);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-02-19', 86, 838, 15);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-06-27', 1, 156, 21);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-04-03', 60, 457, 24);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-01-27', 23, 231, 25);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-11-12', 31, 243, 9);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-02-08', 45, 410, 27);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-05-29', 66, 596, 14);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-18', 120, 583, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-06-16', 90, 348, 29);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-01-03', 38, 415, 9);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-01-18', 34, 976, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-05-07', 3, 852, 5);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-06-19', 71, 994, 29);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-04-10', 3, 625, 8);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-04-03', 5, 645, 14);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-06', 65, 236, 5);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-07-16', 94, 253, 30);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-12-20', 100, 660, 31);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-06-14', 102, 739, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-10-01', 86, 638, 18);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-04-30', 14, 552, 25);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-07-23', 83, 34, 16);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-11-12', 29, 8, 6);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-29', 41, 550, 6);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-24', 65, 539, 30);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-24', 107, 176, 24);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-06-11', 72, 733, 26);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-03', 106, 374, 5);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-18', 120, 622, 33);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-01-03', 118, 415, 31);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-12-10', 92, 855, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-09-13', 7, 822, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-11-15', 64, 628, 35);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-17', 85, 7, 17);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-04-30', 21, 785, 25);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-01-10', 77, 672, 25);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-06-06', 76, 618, 27);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-02-13', 50, 949, 15);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-06-04', 1, 340, 5);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-07-09', 61, 981, 12);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-05-26', 103, 513, 5);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-05-10', 99, 310, 13);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-09-08', 73, 635, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-01-18', 58, 976, 21);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-07-23', 85, 34, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-06-07', 30, 764, 10);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-04-12', 72, 356, 27);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-01-21', 82, 705, 31);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-07-30', 50, 512, 19);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-05', 97, 195, 15);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-10-19', 111, 807, 27);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-04-28', 105, 483, 17);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-26', 42, 804, 5);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-06-08', 19, 769, 15);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-11', 31, 169, 15);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-04-12', 88, 356, 20);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-18', 94, 736, 5);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-07-25', 32, 966, 6);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-05-03', 61, 664, 7);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-07-22', 72, 89, 10);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-09-03', 110, 38, 9);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-05-15', 8, 682, 25);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-02-04', 95, 632, 7);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-12-10', 21, 855, 6);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-18', 78, 736, 22);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-07-10', 4, 293, 33);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-02-21', 112, 556, 27);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-17', 87, 7, 13);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-10-08', 28, 970, 5);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-09-11', 107, 620, 30);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-04-12', 7, 356, 16);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-10-01', 90, 997, 25);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-11-28', 89, 173, 32);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-12-31', 22, 262, 21);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-05-12', 9, 342, 13);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-01-21', 103, 521, 33);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-10-03', 33, 9, 26);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-12-19', 75, 80, 18);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-10-15', 60, 37, 27);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-03', 51, 867, 12);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-06-24', 110, 255, 5);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-11-30', 91, 488, 12);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-05-20', 43, 707, 25);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-10-19', 30, 103, 32);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-03', 23, 527, 6);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-18', 43, 583, 20);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-09-04', 46, 104, 21);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-01-26', 8, 387, 19);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-10-24', 112, 670, 30);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-10-19', 110, 807, 13);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-07-13', 62, 434, 26);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-10-19', 66, 807, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-25', 45, 810, 7);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-06-08', 110, 769, 18);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-06', 48, 236, 8);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-05-06', 75, 294, 10);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-01-18', 87, 976, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-02-21', 105, 288, 8);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-02-21', 80, 288, 17);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-11-11', 25, 259, 9);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-07-05', 87, 957, 17);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-10-22', 41, 735, 13);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-08', 18, 375, 34);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-04-12', 41, 356, 33);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-09-07', 68, 766, 10);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-12-04', 27, 421, 12);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-07-30', 56, 512, 9);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-10-08', 18, 970, 10);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-10-28', 88, 51, 9);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-02-25', 50, 728, 5);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-07-19', 94, 59, 8);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-21', 46, 139, 33);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-01-23', 16, 529, 9);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-03-29', 67, 239, 14);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-11-24', 58, 234, 30);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-11-28', 107, 173, 30);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-02-13', 46, 949, 32);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-09-13', 50, 576, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-06', 119, 236, 35);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-29', 107, 886, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-11-28', 111, 173, 9);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-11-01', 101, 658, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-06-09', 76, 31, 22);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-05-24', 103, 667, 25);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-04-30', 72, 785, 5);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-09-27', 43, 428, 31);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-05-15', 25, 682, 8);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-24', 88, 176, 33);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-05-20', 109, 707, 7);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-01-12', 69, 884, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-08-05', 26, 195, 22);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-09-16', 39, 665, 35);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-04-06', 82, 302, 26);
insert into Hours (Date, EmployeeID, contID, hours) values ('2017-12-09', 16, 5, 20);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-05-21', 17, 433, 22);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-05-03', 44, 380, 16);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-03-25', 72, 975, 34);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-02-09', 27, 912, 17);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-02-24', 34, 601, 17);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-04-08', 103, 272, 22);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-04-13', 28, 542, 15);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-05-06', 81, 464, 15);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-02-06', 38, 634, 16);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-02-26', 107, 332, 14);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-04-18', 9, 338, 34);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-04-12', 103, 199, 6);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-02-16', 107, 619, 15);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-02-26', 94, 332, 12);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-02-24', 84, 849, 8);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-03-21', 103, 504, 27);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-06-07', 41, 621, 17);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-02-16', 32, 619, 22);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-02-25', 39, 113, 5);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-06-27', 27, 657, 5);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-03-04', 32, 904, 27);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-03-15', 101, 382, 6);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-03-18', 37, 960, 15);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-02-12', 90, 123, 21);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-05-21', 112, 753, 6);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-02-20', 63, 544, 12);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-07-14', 86, 315, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-03-04', 35, 904, 10);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-04-15', 73, 381, 7);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-05-18', 32, 895, 32);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-05-26', 3, 264, 33);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-01-25', 92, 482, 35);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-05-22', 19, 499, 9);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-04-01', 74, 13, 33);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-06-28', 91, 877, 9);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-02-19', 66, 362, 32);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-02-24', 14, 601, 20);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-03-13', 108, 950, 19);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-02-05', 43, 887, 26);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-03-03', 23, 285, 12);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-05-07', 23, 423, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-02-01', 43, 84, 14);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-07-10', 90, 575, 31);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-02-04', 60, 687, 22);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-03-08', 54, 569, 13);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-02-16', 34, 619, 5);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-06-10', 100, 278, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-05-22', 27, 573, 21);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-07-14', 8, 315, 27);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-05-10', 75, 210, 20);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-02-12', 85, 123, 27);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-03-18', 33, 319, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-05-23', 16, 393, 22);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-07-04', 75, 146, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-03-21', 75, 504, 12);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-04-21', 86, 881, 20);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-03-14', 43, 442, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-05-04', 5, 30, 8);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-02-19', 59, 362, 15);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-05-11', 42, 806, 29);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-01-27', 49, 617, 27);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-06-12', 16, 882, 31);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-03-08', 82, 980, 32);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-02-09', 53, 912, 14);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-06-22', 91, 256, 21);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-02-19', 119, 362, 16);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-02-19', 72, 362, 24);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-02-26', 97, 332, 8);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-06-23', 23, 845, 35);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-04-09', 7, 394, 26);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-02-16', 115, 545, 20);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-04-09', 84, 394, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-07-15', 32, 830, 17);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-02-09', 13, 165, 25);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-04-13', 17, 542, 21);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-07-26', 5, 853, 19);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-03-27', 15, 546, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-02-17', 69, 24, 33);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-06-12', 89, 528, 29);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-05-02', 3, 939, 32);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-03-08', 12, 569, 21);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-06-02', 2, 890, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-01-28', 91, 462, 10);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-03-04', 93, 904, 34);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-04-16', 41, 432, 14);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-07-14', 100, 315, 28);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-02-17', 8, 24, 19);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-07-12', 77, 843, 30);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-06-05', 71, 894, 13);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-07-14', 13, 315, 16);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-05-14', 44, 100, 24);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-05-09', 21, 36, 30);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-07-04', 17, 146, 19);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-03-01', 59, 745, 18);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-02-23', 27, 183, 21);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-05-04', 120, 30, 35);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-03-04', 110, 904, 13);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-07-15', 42, 830, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-05-06', 49, 464, 18);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-02-04', 71, 687, 24);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-01-28', 98, 495, 24);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-05-03', 22, 380, 19);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-04-02', 85, 926, 30);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-07-12', 23, 843, 31);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-04-22', 23, 155, 33);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-05-14', 85, 100, 13);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-05-10', 36, 210, 30);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-07-17', 117, 437, 7);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-02-16', 65, 545, 6);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-07-10', 99, 575, 14);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-02-25', 102, 113, 26);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-01-25', 22, 482, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-03-12', 28, 674, 24);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-06-29', 30, 749, 33);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-07-12', 97, 843, 10);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-06-10', 84, 278, 31);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-02-26', 28, 332, 11);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-02-20', 5, 544, 5);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-03-28', 69, 907, 34);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-05-22', 11, 969, 23);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-06-12', 22, 882, 8);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-03-08', 63, 980, 34);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-07-15', 78, 830, 26);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-03-18', 42, 960, 26);
insert into Hours (Date, EmployeeID, contID, hours) values ('2018-04-01', 91, 232, 5);


Insert into Teams (TeamID, ManagerID) values (1,3); 
Insert into Teams (TeamID, ManagerID) values (2,4); 
Insert into Teams (TeamID, ManagerID) values (3,7); 
Insert into Teams (TeamID, ManagerID) values (4,10); 
Insert into Teams (TeamID, ManagerID) values (5,13); 
Insert into Teams (TeamID, ManagerID) values (6,15); 
Insert into Teams (TeamID, ManagerID) values (7,18); 
Insert into Teams (TeamID, ManagerID) values (8,19);
Insert into Teams (TeamID, ManagerID) values (9,21);
Insert into Teams (TeamID, ManagerID) values (10,22);
Insert into Teams (TeamID, ManagerID) values (11,25);    
Insert into Teams (TeamID, ManagerID) values (12,30);
Insert into Teams (TeamID, ManagerID) values (13,34);
Insert into Teams (TeamID, ManagerID) values (14,36);
Insert into Teams (TeamID, ManagerID) values (15,38);
Insert into Teams (TeamID, ManagerID) values (16,41);
Insert into Teams (TeamID, ManagerID) values (17,42);
Insert into Teams (TeamID, ManagerID) values (18,45);
Insert into Teams (TeamID, ManagerID) values (19,48);
Insert into Teams (TeamID, ManagerID) values (20,59);
Insert into Teams (TeamID, ManagerID) values (21,50);
Insert into Teams (TeamID, ManagerID) values (22,53);
Insert into Teams (TeamID, ManagerID) values (23,59);
                    
insert into Prefernces (EmployeeID, Category) values (8, 'Silver');
insert into Prefernces (EmployeeID, Category) values (12, 'Silver');
insert into Prefernces (EmployeeID, Category) values (14, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (20, 'Silver');
insert into Prefernces (EmployeeID, Category) values (26, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (28, 'Premium');
insert into Prefernces (EmployeeID, Category) values (29, 'Premium');
insert into Prefernces (EmployeeID, Category) values (31, 'Silver');
insert into Prefernces (EmployeeID, Category) values (32, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (35, 'Silver');
insert into Prefernces (EmployeeID, Category) values (39, 'Gold');
insert into Prefernces (EmployeeID, Category) values (40, 'Silver');
insert into Prefernces (EmployeeID, Category) values (43, 'Premium');
insert into Prefernces (EmployeeID, Category) values (44, 'Silver');
insert into Prefernces (EmployeeID, Category) values (46, 'Silver');
insert into Prefernces (EmployeeID, Category) values (47, 'Premium');
insert into Prefernces (EmployeeID, Category) values (51, 'Silver');
insert into Prefernces (EmployeeID, Category) values (54, 'Premium');
insert into Prefernces (EmployeeID, Category) values (57, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (58, 'Silver');
insert into Prefernces (EmployeeID, Category) values (62, 'Gold');
insert into Prefernces (EmployeeID, Category) values (64, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (65, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (66, 'Gold');
insert into Prefernces (EmployeeID, Category) values (67, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (68, 'Premium');
insert into Prefernces (EmployeeID, Category) values (69, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (70, 'Silver');
insert into Prefernces (EmployeeID, Category) values (71, 'Gold');
insert into Prefernces (EmployeeID, Category) values (72, 'Premium');
insert into Prefernces (EmployeeID, Category) values (74, 'Gold');
insert into Prefernces (EmployeeID, Category) values (75, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (76, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (77, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (78, 'Gold');
insert into Prefernces (EmployeeID, Category) values (79, 'Premium');
insert into Prefernces (EmployeeID, Category) values (80, 'Premium');
insert into Prefernces (EmployeeID, Category) values (81, 'Gold');
insert into Prefernces (EmployeeID, Category) values (82, 'Premium');
insert into Prefernces (EmployeeID, Category) values (83, 'Gold');
insert into Prefernces (EmployeeID, Category) values (84, 'Gold');
insert into Prefernces (EmployeeID, Category) values (85, 'Silver');
insert into Prefernces (EmployeeID, Category) values (86, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (87, 'Premium');
insert into Prefernces (EmployeeID, Category) values (88, 'Gold');
insert into Prefernces (EmployeeID, Category) values (89, 'Silver');
insert into Prefernces (EmployeeID, Category) values (90, 'Silver');
insert into Prefernces (EmployeeID, Category) values (91, 'Gold');
insert into Prefernces (EmployeeID, Category) values (92, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (93, 'Premium');
insert into Prefernces (EmployeeID, Category) values (94, 'Gold');
insert into Prefernces (EmployeeID, Category) values (95, 'Premium');
insert into Prefernces (EmployeeID, Category) values (96, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (97, 'Gold');
insert into Prefernces (EmployeeID, Category) values (98, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (99, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (100, 'Premium');
insert into Prefernces (EmployeeID, Category) values (101, 'Gold');
insert into Prefernces (EmployeeID, Category) values (102, 'Premium');
insert into Prefernces (EmployeeID, Category) values (103, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (104, 'Gold');
insert into Prefernces (EmployeeID, Category) values (105, 'Silver');
insert into Prefernces (EmployeeID, Category) values (106, 'Silver');
insert into Prefernces (EmployeeID, Category) values (107, 'Gold');
insert into Prefernces (EmployeeID, Category) values (108, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (109, 'Silver');
insert into Prefernces (EmployeeID, Category) values (110, 'Silver');
insert into Prefernces (EmployeeID, Category) values (111, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (112, 'Premium');
insert into Prefernces (EmployeeID, Category) values (113, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (114, 'Silver');
insert into Prefernces (EmployeeID, Category) values (115, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (116, 'Gold');
insert into Prefernces (EmployeeID, Category) values (117, 'Silver');
insert into Prefernces (EmployeeID, Category) values (118, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (119, 'Premium');
insert into Prefernces (EmployeeID, Category) values (120, 'Gold');
insert into Prefernces (EmployeeID, Category) values (8, 'Gold');
insert into Prefernces (EmployeeID, Category) values (12, 'Premium');
insert into Prefernces (EmployeeID, Category) values (14, 'Premium');
insert into Prefernces (EmployeeID, Category) values (20, 'Premium');
insert into Prefernces (EmployeeID, Category) values (26, 'Gold');
insert into Prefernces (EmployeeID, Category) values (28, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (29, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (31, 'Gold');
insert into Prefernces (EmployeeID, Category) values (32, 'Premium');
insert into Prefernces (EmployeeID, Category) values (35, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (39, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (40, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (43, 'Gold');
insert into Prefernces (EmployeeID, Category) values (44, 'Premium');
insert into Prefernces (EmployeeID, Category) values (46, 'Gold');
insert into Prefernces (EmployeeID, Category) values (47, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (51, 'Gold');
insert into Prefernces (EmployeeID, Category) values (54, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (57, 'Premium');
insert into Prefernces (EmployeeID, Category) values (58, 'Gold');
insert into Prefernces (EmployeeID, Category) values (62, 'Premium');
insert into Prefernces (EmployeeID, Category) values (64, 'Silver');
insert into Prefernces (EmployeeID, Category) values (65, 'Gold');
insert into Prefernces (EmployeeID, Category) values (66, 'Silver');
insert into Prefernces (EmployeeID, Category) values (67, 'Silver');
insert into Prefernces (EmployeeID, Category) values (68, 'Silver');
insert into Prefernces (EmployeeID, Category) values (69, 'Gold');
insert into Prefernces (EmployeeID, Category) values (70, 'Gold');
insert into Prefernces (EmployeeID, Category) values (71, 'Premium');
insert into Prefernces (EmployeeID, Category) values (72, 'Gold');
insert into Prefernces (EmployeeID, Category) values (74, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (75, 'Premium');
insert into Prefernces (EmployeeID, Category) values (76, 'Silver');
insert into Prefernces (EmployeeID, Category) values (77, 'Premium');
insert into Prefernces (EmployeeID, Category) values (78, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (79, 'Silver');
insert into Prefernces (EmployeeID, Category) values (80, 'Gold');
insert into Prefernces (EmployeeID, Category) values (81, 'Premium');
insert into Prefernces (EmployeeID, Category) values (82, 'Silver');
insert into Prefernces (EmployeeID, Category) values (83, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (84, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (85, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (86, 'Silver');
insert into Prefernces (EmployeeID, Category) values (87, 'Silver');
insert into Prefernces (EmployeeID, Category) values (88, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (89, 'Premium');
insert into Prefernces (EmployeeID, Category) values (90, 'Gold');
insert into Prefernces (EmployeeID, Category) values (91, 'Silver');
insert into Prefernces (EmployeeID, Category) values (92, 'Premium');
insert into Prefernces (EmployeeID, Category) values (93, 'Gold');
insert into Prefernces (EmployeeID, Category) values (94, 'Premium');
insert into Prefernces (EmployeeID, Category) values (95, 'Gold');
insert into Prefernces (EmployeeID, Category) values (96, 'Premium');
insert into Prefernces (EmployeeID, Category) values (97, 'Silver');
insert into Prefernces (EmployeeID, Category) values (98, 'Gold');
insert into Prefernces (EmployeeID, Category) values (99, 'Premium');
insert into Prefernces (EmployeeID, Category) values (100, 'Gold');
insert into Prefernces (EmployeeID, Category) values (101, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (102, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (103, 'Silver');
insert into Prefernces (EmployeeID, Category) values (104, 'Premium');
insert into Prefernces (EmployeeID, Category) values (105, 'Premium');
insert into Prefernces (EmployeeID, Category) values (106, 'Premium');
insert into Prefernces (EmployeeID, Category) values (107, 'Premium');
insert into Prefernces (EmployeeID, Category) values (108, 'Silver');
insert into Prefernces (EmployeeID, Category) values (109, 'Gold');
insert into Prefernces (EmployeeID, Category) values (110, 'Gold');
insert into Prefernces (EmployeeID, Category) values (111, 'Silver');
insert into Prefernces (EmployeeID, Category) values (112, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (113, 'Premium');
insert into Prefernces (EmployeeID, Category) values (114, 'Premium');
insert into Prefernces (EmployeeID, Category) values (115, 'Silver');
insert into Prefernces (EmployeeID, Category) values (116, 'Premium');
insert into Prefernces (EmployeeID, Category) values (117, 'Premium');
insert into Prefernces (EmployeeID, Category) values (118, 'Gold');
insert into Prefernces (EmployeeID, Category) values (119, 'Diamond');
insert into Prefernces (EmployeeID, Category) values (120, 'Silver');

insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (22, 14, 752, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (91, 9, 10, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (70, 20, 792, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (84, 10, 675, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (59, 3, 498, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (112, 6, 752, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (65, 14, 946, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (17, 19, 549, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (50, 10, 472, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (31, 12, 19, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (105, 17, 415, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (23, 6, 891, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (26, 21, 525, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (85, 8, 241, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (27, 11, 541, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (17, 6, 433, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (44, 14, 380, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (54, 23, 307, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (89, 14, 548, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (106, 11, 228, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (43, 12, 918, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (76, 22, 205, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (85, 6, 783, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (29, 23, 510, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (111, 10, 921, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (35, 15, 110, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (6, 15, 98, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (120, 11, 314, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (36, 14, 502, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (94, 10, 966, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (98, 3, 245, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (68, 23, 386, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (3, 17, 18, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (99, 19, 74, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (72, 5, 975, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (61, 15, 473, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (111, 21, 316, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (66, 19, 836, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (62, 15, 463, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (27, 20, 801, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (27, 18, 912, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (34, 10, 601, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (61, 15, 646, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (96, 12, 764, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (52, 5, 237, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (22, 17, 209, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (81, 10, 885, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (52, 17, 858, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (117, 3, 640, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (111, 5, 475, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (91, 10, 609, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (37, 3, 727, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (109, 3, 710, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (117, 6, 559, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (53, 1, 860, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (5, 14, 424, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (65, 5, 549, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (34, 6, 470, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (18, 7, 457, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (50, 15, 205, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (99, 7, 78, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (32, 1, 424, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (60, 11, 653, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (41, 16, 296, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (27, 3, 972, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (103, 9, 758, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (63, 14, 158, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (52, 4, 238, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (17, 10, 827, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (50, 18, 57, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (35, 12, 4, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (35, 19, 376, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (69, 16, 668, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (21, 3, 18, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (68, 15, 358, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (111, 1, 474, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (114, 11, 266, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (103, 9, 272, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (12, 15, 252, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (112, 9, 705, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (80, 15, 413, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (37, 5, 856, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (120, 23, 18, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (91, 15, 973, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (50, 14, 625, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (79, 9, 114, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (41, 15, 483, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (62, 23, 448, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (68, 19, 841, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (95, 19, 87, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (107, 10, 955, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (6, 8, 577, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (28, 13, 542, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (81, 21, 464, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (114, 22, 874, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (52, 11, 729, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (35, 7, 553, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (91, 22, 681, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (80, 5, 320, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (65, 6, 808, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (60, 13, 472, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (51, 5, 404, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (13, 3, 801, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (66, 7, 646, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (45, 2, 294, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (20, 14, 832, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (56, 2, 760, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (106, 14, 457, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (37, 3, 157, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (100, 8, 554, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (78, 13, 990, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (77, 1, 157, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (38, 13, 634, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (107, 19, 332, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (113, 14, 738, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (65, 13, 371, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (45, 11, 139, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (61, 1, 141, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (50, 17, 559, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (57, 11, 564, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (61, 23, 277, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (67, 11, 747, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (3, 14, 948, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (105, 1, 191, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (22, 1, 481, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (84, 20, 525, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (45, 19, 508, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (9, 8, 338, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (96, 21, 419, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (65, 8, 746, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (47, 7, 789, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (12, 5, 946, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (113, 21, 808, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (15, 8, 598, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (103, 4, 199, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (24, 12, 304, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (111, 10, 614, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (5, 18, 991, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (7, 19, 648, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (107, 11, 619, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (107, 19, 44, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (54, 6, 831, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (28, 19, 197, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (42, 9, 342, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (30, 8, 59, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (45, 17, 945, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (47, 2, 530, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (91, 14, 286, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (84, 14, 523, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (61, 3, 647, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (40, 8, 507, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (85, 11, 360, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (20, 8, 929, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (50, 14, 492, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (111, 17, 299, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (2, 2, 972, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (19, 3, 611, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (12, 13, 230, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (40, 21, 387, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (1, 23, 316, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (102, 6, 245, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (94, 13, 332, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (28, 2, 600, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (66, 19, 668, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (60, 15, 838, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (29, 13, 831, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (94, 5, 50, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (98, 2, 787, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (84, 5, 849, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (88, 5, 514, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (31, 20, 410, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (93, 17, 311, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (50, 22, 284, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (103, 19, 504, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (81, 17, 581, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (113, 20, 833, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (26, 3, 653, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (100, 5, 82, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (4, 14, 489, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (24, 15, 122, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (113, 7, 568, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (60, 14, 611, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (44, 16, 532, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (41, 23, 621, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (47, 5, 918, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (48, 2, 425, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (100, 15, 763, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (85, 13, 889, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (32, 14, 619, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (19, 20, 548, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (62, 8, 767, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (25, 5, 652, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (113, 20, 328, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (67, 11, 167, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (81, 4, 251, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (15, 3, 599, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (65, 11, 293, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (103, 19, 352, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (78, 20, 435, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (49, 2, 879, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (39, 7, 113, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (5, 16, 856, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (50, 13, 481, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (27, 11, 657, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (47, 2, 287, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (82, 3, 647, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (2, 21, 709, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (88, 23, 952, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (98, 20, 581, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (84, 6, 485, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (32, 9, 904, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (53, 9, 463, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (44, 9, 259, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (101, 23, 382, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (53, 9, 331, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (39, 2, 485, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (84, 9, 760, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (61, 23, 663, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (8, 9, 95, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (42, 5, 68, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (76, 5, 988, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (37, 10, 960, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (96, 4, 408, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (70, 2, 681, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (43, 9, 139, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (90, 9, 123, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (10, 8, 662, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (19, 6, 759, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (55, 12, 372, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (37, 21, 985, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (24, 14, 48, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (103, 14, 835, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (16, 16, 630, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (53, 9, 768, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (75, 11, 533, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (57, 9, 109, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (116, 11, 408, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (12, 8, 63, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (92, 4, 414, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (107, 15, 750, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (64, 18, 358, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (112, 19, 753, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (63, 1, 544, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (21, 18, 91, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (69, 1, 984, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (9, 1, 135, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (77, 10, 271, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (86, 22, 315, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (35, 16, 904, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (116, 20, 179, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (73, 19, 381, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (11, 18, 846, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (21, 18, 861, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (28, 18, 356, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (32, 13, 895, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (59, 21, 103, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (59, 22, 668, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (45, 5, 694, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (33, 16, 106, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (52, 17, 488, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (28, 12, 316, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (3, 3, 264, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (25, 18, 896, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (99, 6, 421, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (65, 9, 720, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (92, 15, 482, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (39, 3, 185, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (67, 13, 778, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (34, 10, 837, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (19, 13, 499, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (24, 7, 377, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (9, 7, 424, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (101, 21, 366, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (25, 5, 791, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (37, 15, 774, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (18, 2, 812, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (60, 1, 965, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (109, 12, 314, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (60, 2, 177, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (23, 20, 757, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (116, 19, 255, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (40, 11, 667, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (116, 4, 863, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (16, 21, 307, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (111, 7, 754, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (74, 21, 13, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (115, 23, 993, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (27, 16, 676, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (52, 12, 474, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (100, 13, 140, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (44, 23, 885, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (45, 4, 103, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (34, 10, 682, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (82, 11, 618, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (4, 21, 923, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (23, 1, 128, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (4, 7, 203, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (118, 21, 185, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (31, 7, 366, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (60, 22, 915, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (56, 4, 901, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (42, 9, 561, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (117, 10, 91, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (105, 6, 629, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (57, 4, 560, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (71, 18, 168, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (100, 22, 374, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (91, 6, 877, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (110, 13, 452, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (68, 18, 119, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (66, 11, 362, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (41, 16, 949, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (15, 23, 851, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (68, 5, 978, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (110, 13, 968, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (92, 12, 94, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (17, 17, 175, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (82, 15, 803, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (15, 12, 327, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (71, 22, 368, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (27, 16, 536, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (120, 12, 861, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (18, 4, 819, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (13, 21, 47, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (52, 11, 815, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (75, 11, 92, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (56, 14, 716, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (14, 16, 601, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (15, 1, 465, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (70, 7, 99, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (41, 11, 172, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (111, 6, 860, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (114, 21, 702, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (95, 14, 293, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (117, 4, 916, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (108, 19, 950, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (55, 8, 93, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (59, 18, 353, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (20, 1, 360, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (59, 4, 979, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (109, 6, 245, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (118, 13, 655, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (99, 13, 370, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (112, 6, 152, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (11, 6, 772, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (80, 22, 683, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (14, 11, 638, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (65, 22, 987, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (110, 13, 641, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (69, 11, 306, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (6, 18, 547, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (98, 10, 342, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (85, 22, 893, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (43, 17, 887, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (36, 20, 951, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (71, 2, 5, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (89, 12, 37, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (105, 23, 972, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (12, 2, 466, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (79, 17, 176, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (101, 14, 602, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (30, 21, 795, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (23, 16, 285, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (63, 6, 197, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (33, 10, 475, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (18, 9, 844, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (42, 11, 489, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (118, 8, 543, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (23, 7, 423, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (35, 2, 475, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (13, 18, 280, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (43, 4, 84, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (60, 7, 929, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (26, 1, 262, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (87, 16, 951, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (21, 6, 620, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (90, 19, 967, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (90, 19, 575, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (44, 12, 506, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (90, 11, 944, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (36, 5, 72, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (72, 3, 27, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (5, 20, 5, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (17, 14, 968, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (45, 18, 347, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (83, 7, 671, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (57, 13, 120, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (85, 3, 41, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (56, 9, 837, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (60, 13, 687, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (19, 11, 121, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (35, 9, 952, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (19, 19, 214, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (11, 9, 489, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (69, 19, 236, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (23, 19, 349, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (34, 16, 522, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (8, 21, 355, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (108, 15, 514, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (115, 14, 63, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (107, 8, 85, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (14, 6, 86, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (3, 18, 76, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (54, 16, 569, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (43, 21, 725, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (61, 8, 215, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (119, 21, 965, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (34, 21, 619, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (19, 6, 227, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (61, 18, 782, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (18, 1, 810, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (62, 19, 726, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (21, 7, 27, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (30, 3, 561, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (44, 10, 710, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (13, 21, 750, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (26, 5, 566, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (110, 17, 892, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (61, 3, 861, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (90, 1, 831, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (35, 4, 328, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (113, 16, 10, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (86, 1, 371, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (69, 15, 868, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (83, 22, 316, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (100, 12, 278, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (84, 17, 997, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (4, 12, 747, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (32, 9, 40, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (57, 22, 344, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (21, 19, 815, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (27, 16, 573, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (109, 16, 813, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (51, 18, 923, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (90, 21, 910, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (54, 16, 62, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (70, 22, 623, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (70, 15, 193, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (51, 17, 108, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (109, 17, 371, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (10, 18, 431, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (115, 21, 896, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (84, 23, 658, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (74, 16, 455, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (87, 13, 301, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (104, 11, 443, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (111, 1, 727, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (8, 4, 315, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (79, 7, 148, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (116, 7, 681, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (75, 9, 210, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (28, 18, 349, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (85, 7, 123, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (113, 17, 864, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (77, 16, 532, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (71, 5, 728, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (25, 1, 444, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (33, 21, 319, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (17, 19, 553, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (69, 11, 629, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (42, 1, 416, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (69, 2, 993, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (97, 14, 722, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (87, 18, 410, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (33, 22, 992, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (35, 19, 474, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (61, 3, 412, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (28, 8, 282, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (102, 9, 57, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (33, 5, 666, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (55, 7, 18, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (107, 23, 529, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (109, 16, 720, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (66, 6, 247, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (99, 12, 229, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (33, 7, 988, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (110, 12, 959, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (15, 11, 645, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (16, 10, 393, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (65, 2, 107, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (76, 1, 85, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (75, 17, 146, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (27, 3, 818, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (75, 17, 504, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (54, 17, 727, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (86, 13, 881, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (18, 16, 201, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (46, 22, 491, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (25, 17, 908, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (20, 23, 527, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (69, 22, 831, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (47, 6, 453, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (58, 3, 951, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (43, 7, 90, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (43, 14, 721, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (43, 9, 913, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (27, 6, 223, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (99, 1, 284, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (8, 1, 431, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (55, 14, 441, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (92, 6, 171, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (102, 19, 171, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (71, 11, 69, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (117, 12, 412, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (100, 9, 255, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (86, 4, 533, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (87, 11, 844, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (96, 10, 686, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (73, 6, 550, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (43, 5, 442, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (102, 23, 873, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (104, 2, 56, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (43, 23, 866, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (67, 16, 593, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (6, 7, 401, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (73, 5, 20, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (43, 16, 957, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (87, 21, 214, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (26, 10, 197, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (5, 18, 30, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (86, 12, 184, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (51, 4, 970, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (27, 18, 503, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (46, 10, 139, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (101, 20, 757, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (2, 20, 891, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (17, 3, 404, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (83, 20, 286, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (100, 20, 850, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (69, 10, 588, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (3, 6, 472, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (84, 19, 561, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (73, 15, 651, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (44, 11, 560, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (52, 16, 310, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (32, 8, 160, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (111, 5, 228, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (56, 1, 236, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (7, 12, 768, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (79, 7, 506, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (59, 11, 362, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (82, 14, 711, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (114, 13, 291, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (76, 8, 91, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (73, 8, 66, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (34, 19, 3, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (27, 15, 700, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (14, 7, 477, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (42, 12, 806, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (116, 4, 722, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (64, 4, 768, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (45, 15, 515, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (60, 23, 832, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (109, 19, 910, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (85, 11, 307, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (29, 20, 705, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (39, 19, 610, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (91, 21, 525, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (49, 5, 617, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (100, 13, 259, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (87, 19, 581, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (16, 13, 882, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (16, 21, 252, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (82, 23, 980, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (23, 11, 298, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (83, 19, 366, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (10, 16, 792, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (81, 10, 126, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (61, 8, 89, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (117, 22, 10, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (76, 10, 158, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (53, 8, 912, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (92, 16, 644, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (104, 19, 386, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (26, 5, 578, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (91, 7, 256, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (98, 5, 596, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (24, 3, 780, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (116, 14, 9, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (119, 21, 362, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (72, 8, 362, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (107, 2, 88, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (108, 19, 112, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (74, 17, 369, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (6, 19, 212, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (86, 5, 403, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (39, 10, 142, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (64, 17, 465, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (3, 17, 613, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (39, 4, 669, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (97, 1, 332, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (80, 13, 48, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (106, 15, 769, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (23, 12, 845, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (43, 23, 185, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (114, 15, 780, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (26, 19, 389, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (8, 19, 492, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (7, 9, 394, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (115, 6, 545, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (104, 3, 610, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (3, 22, 471, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (16, 7, 810, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (66, 20, 97, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (105, 17, 603, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (84, 23, 394, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (51, 17, 739, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (5, 4, 935, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (13, 18, 947, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (32, 4, 830, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (13, 2, 165, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (86, 11, 11, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (86, 10, 838, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (120, 7, 326, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (1, 1, 156, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (60, 22, 457, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (5, 9, 56, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (17, 1, 542, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (5, 20, 853, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (15, 17, 546, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (23, 3, 231, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (69, 13, 24, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (89, 22, 528, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (28, 16, 296, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (105, 14, 40, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (57, 6, 481, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (47, 19, 75, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (31, 13, 243, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (3, 7, 939, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (80, 7, 22, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (45, 11, 410, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (56, 9, 717, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (12, 17, 569, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (1, 23, 898, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (52, 19, 299, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (12, 1, 566, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (66, 16, 596, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (114, 15, 741, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (29, 16, 603, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (120, 11, 583, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (115, 8, 198, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (2, 6, 890, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (90, 22, 348, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (91, 1, 462, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (75, 1, 897, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (38, 3, 415, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (93, 9, 904, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (34, 12, 976, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (3, 21, 852, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (71, 5, 994, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (41, 22, 432, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (3, 13, 625, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (116, 1, 689, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (49, 12, 496, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (9, 15, 326, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (85, 1, 595, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (5, 5, 645, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (100, 7, 315, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (65, 6, 236, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (53, 22, 787, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (31, 12, 898, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (94, 2, 253, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (76, 17, 317, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (8, 7, 24, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (2, 12, 386, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (80, 2, 441, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (22, 5, 127, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (29, 5, 197, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (16, 6, 471, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (77, 13, 843, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (100, 4, 660, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (36, 3, 844, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (102, 9, 739, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (86, 1, 638, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (14, 16, 552, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (71, 6, 894, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (104, 21, 689, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (109, 16, 193, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (83, 13, 34, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (13, 17, 315, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (118, 11, 323, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (29, 3, 8, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (41, 19, 550, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (44, 12, 100, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (98, 18, 597, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (17, 14, 944, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (65, 8, 539, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (35, 17, 666, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (21, 12, 36, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (68, 19, 752, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (49, 1, 873, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (46, 23, 592, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (17, 20, 146, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (107, 20, 176, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (72, 18, 733, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (87, 1, 323, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (49, 13, 515, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (106, 6, 374, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (59, 5, 745, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (120, 5, 622, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (27, 12, 183, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (120, 15, 30, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (23, 8, 323, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (118, 7, 415, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (106, 11, 166, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (70, 17, 693, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (94, 5, 86, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (92, 2, 855, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (103, 17, 861, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (87, 21, 469, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (73, 18, 329, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (110, 7, 904, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (7, 7, 822, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (7, 4, 723, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (42, 14, 830, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (76, 22, 70, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (36, 16, 998, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (64, 13, 628, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (85, 18, 7, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (27, 3, 524, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (55, 1, 883, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (24, 2, 888, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (21, 1, 785, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (19, 23, 578, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (77, 5, 672, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (16, 17, 115, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (76, 12, 618, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (98, 16, 814, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (56, 9, 781, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (49, 10, 464, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (50, 7, 949, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (1, 9, 340, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (61, 9, 981, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (94, 22, 656, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (114, 12, 614, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (116, 16, 246, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (58, 22, 191, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (71, 12, 687, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (103, 7, 513, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (80, 21, 144, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (107, 5, 465, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (83, 1, 63, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (52, 19, 313, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (4, 16, 563, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (6, 2, 750, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (98, 1, 495, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (26, 3, 561, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (102, 7, 398, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (76, 17, 910, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (29, 21, 470, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (19, 2, 206, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (99, 17, 310, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (73, 14, 635, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (33, 21, 700, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (58, 6, 976, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (117, 10, 268, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (106, 5, 337, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (66, 12, 185, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (85, 10, 34, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (30, 3, 764, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (30, 1, 201, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (89, 23, 751, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (22, 16, 380, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (72, 20, 356, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (61, 19, 880, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (82, 17, 705, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (19, 14, 491, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (50, 3, 512, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (4, 3, 193, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (97, 14, 195, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (111, 4, 807, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (105, 17, 483, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (94, 20, 924, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (87, 10, 752, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (20, 21, 889, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (29, 7, 524, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (85, 22, 926, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (42, 7, 804, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (32, 6, 73, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (23, 7, 843, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (23, 7, 155, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (65, 15, 151, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (113, 7, 238, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (19, 6, 769, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (31, 11, 169, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (113, 12, 145, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (9, 12, 177, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (88, 17, 356, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (111, 8, 623, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (85, 6, 100, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (13, 5, 77, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (69, 5, 746, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (94, 21, 736, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (90, 2, 606, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (97, 12, 185, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (84, 8, 522, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (66, 21, 395, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (11, 20, 28, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (13, 9, 598, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (96, 14, 235, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (45, 19, 581, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (97, 22, 346, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (80, 14, 68, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (3, 13, 533, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (32, 16, 966, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (36, 2, 210, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (61, 11, 664, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (108, 4, 368, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (72, 8, 89, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (110, 23, 38, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (6, 10, 732, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (8, 23, 682, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (117, 20, 437, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (79, 1, 275, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (65, 17, 545, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (95, 14, 632, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (21, 22, 855, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (118, 3, 985, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (78, 16, 736, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (51, 1, 925, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (103, 20, 363, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (79, 17, 235, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (4, 1, 293, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (112, 19, 556, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (87, 11, 7, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (75, 5, 97, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (99, 10, 575, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (28, 3, 970, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (107, 12, 620, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (102, 3, 40, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (7, 15, 356, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (90, 10, 997, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (44, 23, 191, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (89, 16, 173, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (22, 2, 262, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (102, 6, 113, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (9, 3, 342, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (20, 3, 241, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (103, 4, 521, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (60, 10, 901, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (33, 7, 9, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (22, 7, 482, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (75, 8, 80, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (55, 1, 185, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (60, 9, 37, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (97, 14, 955, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (23, 23, 710, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (42, 6, 301, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (80, 22, 772, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (8, 4, 991, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (51, 13, 867, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (38, 8, 748, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (110, 8, 255, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (53, 3, 870, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (39, 13, 217, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (28, 23, 674, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (109, 11, 269, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (91, 12, 488, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (43, 16, 707, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (13, 11, 360, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (30, 3, 103, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (30, 23, 749, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (112, 22, 252, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (23, 1, 527, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (43, 23, 583, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (46, 9, 104, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (62, 23, 613, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (77, 6, 202, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (8, 9, 387, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (17, 18, 226, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (112, 13, 670, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (110, 15, 807, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (62, 23, 434, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (115, 2, 772, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (16, 4, 240, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (2, 16, 49, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (66, 10, 807, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (45, 14, 810, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (110, 4, 769, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (97, 1, 843, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (48, 15, 236, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (31, 10, 752, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (75, 5, 294, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (87, 5, 976, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (87, 21, 324, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (105, 4, 288, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (63, 17, 586, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (47, 15, 388, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (79, 10, 533, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (80, 2, 288, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (7, 8, 732, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (40, 9, 597, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (84, 21, 278, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (28, 15, 332, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (3, 8, 523, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (19, 21, 821, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (17, 11, 768, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (85, 22, 846, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (119, 19, 888, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (113, 3, 563, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (10, 22, 920, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (5, 22, 544, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (61, 21, 456, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (15, 13, 944, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (25, 21, 259, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (87, 11, 957, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (37, 18, 192, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (99, 22, 979, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (21, 4, 386, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (41, 15, 735, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (11, 5, 798, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (40, 4, 222, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (18, 16, 375, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (41, 9, 356, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (55, 7, 925, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (16, 17, 787, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (68, 2, 766, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (101, 3, 105, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (45, 15, 933, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (69, 11, 907, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (27, 1, 421, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (78, 9, 643, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (106, 4, 537, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (32, 2, 564, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (14, 1, 762, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (56, 10, 512, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (18, 17, 970, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (88, 19, 51, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (70, 5, 21, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (9, 20, 720, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (52, 12, 398, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (60, 10, 114, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (50, 5, 728, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (102, 7, 582, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (94, 8, 59, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (46, 9, 139, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (16, 14, 529, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (32, 19, 426, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (99, 9, 471, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (67, 16, 239, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (32, 8, 55, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (58, 2, 234, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (120, 21, 650, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (107, 20, 173, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (38, 4, 39, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (75, 22, 723, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (46, 10, 949, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (11, 5, 969, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (50, 23, 576, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (117, 11, 473, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (18, 1, 780, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (22, 7, 882, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (9, 6, 829, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (63, 4, 980, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (119, 1, 236, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (1, 22, 875, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (107, 21, 886, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (111, 8, 173, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (10, 14, 688, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (75, 11, 71, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (29, 4, 927, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (78, 21, 830, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (101, 12, 658, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (42, 19, 960, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (76, 12, 31, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (120, 3, 86, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (58, 6, 746, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (91, 19, 232, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (103, 15, 667, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (72, 2, 785, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (93, 21, 206, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (75, 2, 328, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (36, 20, 441, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (43, 6, 428, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (25, 14, 682, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (9, 20, 260, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (3, 16, 821, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (22, 12, 597, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (88, 18, 176, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (39, 12, 781, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (109, 22, 707, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (71, 19, 65, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (9, 4, 371, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (87, 7, 112, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (56, 5, 704, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (93, 12, 245, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (119, 5, 496, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (69, 19, 884, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (4, 6, 177, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (26, 11, 195, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (39, 19, 665, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (82, 20, 302, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (89, 17, 761, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (88, 23, 451, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (16, 20, 5, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (52, 5, 267, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (36, 18, 831, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (116, 18, 216, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (70, 22, 772, 0);
insert into EmployeeHistory (EmployeeID, teamID, contID, IsActive) values (101, 17, 182, 0);


insert into CreatedBy (ContID, EmployeeID) values (1, 11);
insert into CreatedBy (ContID, EmployeeID) values (2, 16);
insert into CreatedBy (ContID, EmployeeID) values (3, 55);
insert into CreatedBy (ContID, EmployeeID) values (4, 23);
insert into CreatedBy (ContID, EmployeeID) values (5, 9);
insert into CreatedBy (ContID, EmployeeID) values (6, 55);
insert into CreatedBy (ContID, EmployeeID) values (7, 63);
insert into CreatedBy (ContID, EmployeeID) values (8, 63);
insert into CreatedBy (ContID, EmployeeID) values (9, 73);
insert into CreatedBy (ContID, EmployeeID) values (10, 2);
insert into CreatedBy (ContID, EmployeeID) values (11, 60);
insert into CreatedBy (ContID, EmployeeID) values (12, 11);
insert into CreatedBy (ContID, EmployeeID) values (13, 60);
insert into CreatedBy (ContID, EmployeeID) values (14, 60);
insert into CreatedBy (ContID, EmployeeID) values (15, 16);
insert into CreatedBy (ContID, EmployeeID) values (16, 16);
insert into CreatedBy (ContID, EmployeeID) values (17, 5);
insert into CreatedBy (ContID, EmployeeID) values (18, 24);
insert into CreatedBy (ContID, EmployeeID) values (19, 16);
insert into CreatedBy (ContID, EmployeeID) values (20, 9);
insert into CreatedBy (ContID, EmployeeID) values (21, 24);
insert into CreatedBy (ContID, EmployeeID) values (22, 9);
insert into CreatedBy (ContID, EmployeeID) values (23, 37);
insert into CreatedBy (ContID, EmployeeID) values (24, 27);
insert into CreatedBy (ContID, EmployeeID) values (25, 56);
insert into CreatedBy (ContID, EmployeeID) values (26, 52);
insert into CreatedBy (ContID, EmployeeID) values (27, 6);
insert into CreatedBy (ContID, EmployeeID) values (28, 16);
insert into CreatedBy (ContID, EmployeeID) values (29, 60);
insert into CreatedBy (ContID, EmployeeID) values (30, 55);
insert into CreatedBy (ContID, EmployeeID) values (31, 2);
insert into CreatedBy (ContID, EmployeeID) values (32, 2);
insert into CreatedBy (ContID, EmployeeID) values (33, 37);
insert into CreatedBy (ContID, EmployeeID) values (34, 1);
insert into CreatedBy (ContID, EmployeeID) values (35, 11);
insert into CreatedBy (ContID, EmployeeID) values (36, 63);
insert into CreatedBy (ContID, EmployeeID) values (37, 60);
insert into CreatedBy (ContID, EmployeeID) values (38, 24);
insert into CreatedBy (ContID, EmployeeID) values (39, 37);
insert into CreatedBy (ContID, EmployeeID) values (40, 11);
insert into CreatedBy (ContID, EmployeeID) values (41, 17);
insert into CreatedBy (ContID, EmployeeID) values (42, 52);
insert into CreatedBy (ContID, EmployeeID) values (43, 6);
insert into CreatedBy (ContID, EmployeeID) values (44, 63);
insert into CreatedBy (ContID, EmployeeID) values (45, 27);
insert into CreatedBy (ContID, EmployeeID) values (46, 16);
insert into CreatedBy (ContID, EmployeeID) values (47, 17);
insert into CreatedBy (ContID, EmployeeID) values (48, 17);
insert into CreatedBy (ContID, EmployeeID) values (49, 63);
insert into CreatedBy (ContID, EmployeeID) values (50, 55);
insert into CreatedBy (ContID, EmployeeID) values (51, 27);
insert into CreatedBy (ContID, EmployeeID) values (52, 5);
insert into CreatedBy (ContID, EmployeeID) values (53, 1);
insert into CreatedBy (ContID, EmployeeID) values (54, 37);
insert into CreatedBy (ContID, EmployeeID) values (55, 6);
insert into CreatedBy (ContID, EmployeeID) values (56, 6);
insert into CreatedBy (ContID, EmployeeID) values (57, 11);
insert into CreatedBy (ContID, EmployeeID) values (58, 55);
insert into CreatedBy (ContID, EmployeeID) values (59, 60);
insert into CreatedBy (ContID, EmployeeID) values (60, 16);
insert into CreatedBy (ContID, EmployeeID) values (61, 60);
insert into CreatedBy (ContID, EmployeeID) values (62, 73);
insert into CreatedBy (ContID, EmployeeID) values (63, 6);
insert into CreatedBy (ContID, EmployeeID) values (64, 23);
insert into CreatedBy (ContID, EmployeeID) values (65, 60);
insert into CreatedBy (ContID, EmployeeID) values (66, 63);
insert into CreatedBy (ContID, EmployeeID) values (67, 56);
insert into CreatedBy (ContID, EmployeeID) values (68, 37);
insert into CreatedBy (ContID, EmployeeID) values (69, 5);
insert into CreatedBy (ContID, EmployeeID) values (70, 33);
insert into CreatedBy (ContID, EmployeeID) values (71, 52);
insert into CreatedBy (ContID, EmployeeID) values (72, 37);
insert into CreatedBy (ContID, EmployeeID) values (73, 6);
insert into CreatedBy (ContID, EmployeeID) values (74, 52);
insert into CreatedBy (ContID, EmployeeID) values (75, 55);
insert into CreatedBy (ContID, EmployeeID) values (76, 17);
insert into CreatedBy (ContID, EmployeeID) values (77, 56);
insert into CreatedBy (ContID, EmployeeID) values (78, 9);
insert into CreatedBy (ContID, EmployeeID) values (79, 56);
insert into CreatedBy (ContID, EmployeeID) values (80, 27);
insert into CreatedBy (ContID, EmployeeID) values (81, 60);
insert into CreatedBy (ContID, EmployeeID) values (82, 63);
insert into CreatedBy (ContID, EmployeeID) values (83, 56);
insert into CreatedBy (ContID, EmployeeID) values (84, 37);
insert into CreatedBy (ContID, EmployeeID) values (85, 24);
insert into CreatedBy (ContID, EmployeeID) values (86, 33);
insert into CreatedBy (ContID, EmployeeID) values (87, 1);
insert into CreatedBy (ContID, EmployeeID) values (88, 11);
insert into CreatedBy (ContID, EmployeeID) values (89, 17);
insert into CreatedBy (ContID, EmployeeID) values (90, 37);
insert into CreatedBy (ContID, EmployeeID) values (91, 9);
insert into CreatedBy (ContID, EmployeeID) values (92, 24);
insert into CreatedBy (ContID, EmployeeID) values (93, 2);
insert into CreatedBy (ContID, EmployeeID) values (94, 33);
insert into CreatedBy (ContID, EmployeeID) values (95, 33);
insert into CreatedBy (ContID, EmployeeID) values (96, 52);
insert into CreatedBy (ContID, EmployeeID) values (97, 56);
insert into CreatedBy (ContID, EmployeeID) values (98, 27);
insert into CreatedBy (ContID, EmployeeID) values (99, 33);
insert into CreatedBy (ContID, EmployeeID) values (100, 27);
insert into CreatedBy (ContID, EmployeeID) values (101, 23);
insert into CreatedBy (ContID, EmployeeID) values (102, 60);
insert into CreatedBy (ContID, EmployeeID) values (103, 33);
insert into CreatedBy (ContID, EmployeeID) values (104, 56);
insert into CreatedBy (ContID, EmployeeID) values (105, 60);
insert into CreatedBy (ContID, EmployeeID) values (106, 63);
insert into CreatedBy (ContID, EmployeeID) values (107, 27);
insert into CreatedBy (ContID, EmployeeID) values (108, 60);
insert into CreatedBy (ContID, EmployeeID) values (109, 6);
insert into CreatedBy (ContID, EmployeeID) values (110, 56);
insert into CreatedBy (ContID, EmployeeID) values (111, 11);
insert into CreatedBy (ContID, EmployeeID) values (112, 37);
insert into CreatedBy (ContID, EmployeeID) values (113, 37);
insert into CreatedBy (ContID, EmployeeID) values (114, 37);
insert into CreatedBy (ContID, EmployeeID) values (115, 73);
insert into CreatedBy (ContID, EmployeeID) values (116, 55);
insert into CreatedBy (ContID, EmployeeID) values (117, 9);
insert into CreatedBy (ContID, EmployeeID) values (118, 56);
insert into CreatedBy (ContID, EmployeeID) values (119, 37);
insert into CreatedBy (ContID, EmployeeID) values (120, 24);
insert into CreatedBy (ContID, EmployeeID) values (121, 11);
insert into CreatedBy (ContID, EmployeeID) values (122, 73);
insert into CreatedBy (ContID, EmployeeID) values (123, 6);
insert into CreatedBy (ContID, EmployeeID) values (124, 23);
insert into CreatedBy (ContID, EmployeeID) values (125, 37);
insert into CreatedBy (ContID, EmployeeID) values (126, 2);
insert into CreatedBy (ContID, EmployeeID) values (127, 11);
insert into CreatedBy (ContID, EmployeeID) values (128, 27);
insert into CreatedBy (ContID, EmployeeID) values (129, 9);
insert into CreatedBy (ContID, EmployeeID) values (130, 17);
insert into CreatedBy (ContID, EmployeeID) values (131, 11);
insert into CreatedBy (ContID, EmployeeID) values (132, 56);
insert into CreatedBy (ContID, EmployeeID) values (133, 5);
insert into CreatedBy (ContID, EmployeeID) values (134, 17);
insert into CreatedBy (ContID, EmployeeID) values (135, 11);
insert into CreatedBy (ContID, EmployeeID) values (136, 23);
insert into CreatedBy (ContID, EmployeeID) values (137, 33);
insert into CreatedBy (ContID, EmployeeID) values (138, 6);
insert into CreatedBy (ContID, EmployeeID) values (139, 9);
insert into CreatedBy (ContID, EmployeeID) values (140, 73);
insert into CreatedBy (ContID, EmployeeID) values (141, 55);
insert into CreatedBy (ContID, EmployeeID) values (142, 23);
insert into CreatedBy (ContID, EmployeeID) values (143, 6);
insert into CreatedBy (ContID, EmployeeID) values (144, 2);
insert into CreatedBy (ContID, EmployeeID) values (145, 73);
insert into CreatedBy (ContID, EmployeeID) values (146, 16);
insert into CreatedBy (ContID, EmployeeID) values (147, 1);
insert into CreatedBy (ContID, EmployeeID) values (148, 63);
insert into CreatedBy (ContID, EmployeeID) values (149, 63);
insert into CreatedBy (ContID, EmployeeID) values (150, 27);
insert into CreatedBy (ContID, EmployeeID) values (151, 24);
insert into CreatedBy (ContID, EmployeeID) values (152, 5);
insert into CreatedBy (ContID, EmployeeID) values (153, 17);
insert into CreatedBy (ContID, EmployeeID) values (154, 73);
insert into CreatedBy (ContID, EmployeeID) values (155, 24);
insert into CreatedBy (ContID, EmployeeID) values (156, 17);
insert into CreatedBy (ContID, EmployeeID) values (157, 17);
insert into CreatedBy (ContID, EmployeeID) values (158, 1);
insert into CreatedBy (ContID, EmployeeID) values (159, 33);
insert into CreatedBy (ContID, EmployeeID) values (160, 5);
insert into CreatedBy (ContID, EmployeeID) values (161, 56);
insert into CreatedBy (ContID, EmployeeID) values (162, 33);
insert into CreatedBy (ContID, EmployeeID) values (163, 37);
insert into CreatedBy (ContID, EmployeeID) values (164, 33);
insert into CreatedBy (ContID, EmployeeID) values (165, 55);
insert into CreatedBy (ContID, EmployeeID) values (166, 5);
insert into CreatedBy (ContID, EmployeeID) values (167, 11);
insert into CreatedBy (ContID, EmployeeID) values (168, 63);
insert into CreatedBy (ContID, EmployeeID) values (169, 9);
insert into CreatedBy (ContID, EmployeeID) values (170, 63);
insert into CreatedBy (ContID, EmployeeID) values (171, 37);
insert into CreatedBy (ContID, EmployeeID) values (172, 63);
insert into CreatedBy (ContID, EmployeeID) values (173, 2);
insert into CreatedBy (ContID, EmployeeID) values (174, 24);
insert into CreatedBy (ContID, EmployeeID) values (175, 5);
insert into CreatedBy (ContID, EmployeeID) values (176, 9);
insert into CreatedBy (ContID, EmployeeID) values (177, 2);
insert into CreatedBy (ContID, EmployeeID) values (178, 23);
insert into CreatedBy (ContID, EmployeeID) values (179, 27);
insert into CreatedBy (ContID, EmployeeID) values (180, 2);
insert into CreatedBy (ContID, EmployeeID) values (181, 33);
insert into CreatedBy (ContID, EmployeeID) values (182, 55);
insert into CreatedBy (ContID, EmployeeID) values (183, 60);
insert into CreatedBy (ContID, EmployeeID) values (184, 27);
insert into CreatedBy (ContID, EmployeeID) values (185, 23);
insert into CreatedBy (ContID, EmployeeID) values (186, 33);
insert into CreatedBy (ContID, EmployeeID) values (187, 6);
insert into CreatedBy (ContID, EmployeeID) values (188, 55);
insert into CreatedBy (ContID, EmployeeID) values (189, 37);
insert into CreatedBy (ContID, EmployeeID) values (190, 63);
insert into CreatedBy (ContID, EmployeeID) values (191, 16);
insert into CreatedBy (ContID, EmployeeID) values (192, 52);
insert into CreatedBy (ContID, EmployeeID) values (193, 17);
insert into CreatedBy (ContID, EmployeeID) values (194, 1);
insert into CreatedBy (ContID, EmployeeID) values (195, 24);
insert into CreatedBy (ContID, EmployeeID) values (196, 11);
insert into CreatedBy (ContID, EmployeeID) values (197, 73);
insert into CreatedBy (ContID, EmployeeID) values (198, 52);
insert into CreatedBy (ContID, EmployeeID) values (199, 55);
insert into CreatedBy (ContID, EmployeeID) values (200, 33);
insert into CreatedBy (ContID, EmployeeID) values (201, 23);
insert into CreatedBy (ContID, EmployeeID) values (202, 9);
insert into CreatedBy (ContID, EmployeeID) values (203, 37);
insert into CreatedBy (ContID, EmployeeID) values (204, 23);
insert into CreatedBy (ContID, EmployeeID) values (205, 33);
insert into CreatedBy (ContID, EmployeeID) values (206, 60);
insert into CreatedBy (ContID, EmployeeID) values (207, 60);
insert into CreatedBy (ContID, EmployeeID) values (208, 37);
insert into CreatedBy (ContID, EmployeeID) values (209, 63);
insert into CreatedBy (ContID, EmployeeID) values (210, 6);
insert into CreatedBy (ContID, EmployeeID) values (211, 11);
insert into CreatedBy (ContID, EmployeeID) values (212, 9);
insert into CreatedBy (ContID, EmployeeID) values (213, 37);
insert into CreatedBy (ContID, EmployeeID) values (214, 55);
insert into CreatedBy (ContID, EmployeeID) values (215, 16);
insert into CreatedBy (ContID, EmployeeID) values (216, 73);
insert into CreatedBy (ContID, EmployeeID) values (217, 17);
insert into CreatedBy (ContID, EmployeeID) values (218, 23);
insert into CreatedBy (ContID, EmployeeID) values (219, 73);
insert into CreatedBy (ContID, EmployeeID) values (220, 11);
insert into CreatedBy (ContID, EmployeeID) values (221, 23);
insert into CreatedBy (ContID, EmployeeID) values (222, 23);
insert into CreatedBy (ContID, EmployeeID) values (223, 11);
insert into CreatedBy (ContID, EmployeeID) values (224, 1);
insert into CreatedBy (ContID, EmployeeID) values (225, 37);
insert into CreatedBy (ContID, EmployeeID) values (226, 37);
insert into CreatedBy (ContID, EmployeeID) values (227, 33);
insert into CreatedBy (ContID, EmployeeID) values (228, 24);
insert into CreatedBy (ContID, EmployeeID) values (229, 11);
insert into CreatedBy (ContID, EmployeeID) values (230, 60);
insert into CreatedBy (ContID, EmployeeID) values (231, 16);
insert into CreatedBy (ContID, EmployeeID) values (232, 6);
insert into CreatedBy (ContID, EmployeeID) values (233, 37);
insert into CreatedBy (ContID, EmployeeID) values (234, 60);
insert into CreatedBy (ContID, EmployeeID) values (235, 17);
insert into CreatedBy (ContID, EmployeeID) values (236, 23);
insert into CreatedBy (ContID, EmployeeID) values (237, 24);
insert into CreatedBy (ContID, EmployeeID) values (238, 6);
insert into CreatedBy (ContID, EmployeeID) values (239, 23);
insert into CreatedBy (ContID, EmployeeID) values (240, 37);
insert into CreatedBy (ContID, EmployeeID) values (241, 60);
insert into CreatedBy (ContID, EmployeeID) values (242, 56);
insert into CreatedBy (ContID, EmployeeID) values (243, 1);
insert into CreatedBy (ContID, EmployeeID) values (244, 73);
insert into CreatedBy (ContID, EmployeeID) values (245, 60);
insert into CreatedBy (ContID, EmployeeID) values (246, 33);
insert into CreatedBy (ContID, EmployeeID) values (247, 11);
insert into CreatedBy (ContID, EmployeeID) values (248, 1);
insert into CreatedBy (ContID, EmployeeID) values (249, 33);
insert into CreatedBy (ContID, EmployeeID) values (250, 11);
insert into CreatedBy (ContID, EmployeeID) values (251, 60);
insert into CreatedBy (ContID, EmployeeID) values (252, 33);
insert into CreatedBy (ContID, EmployeeID) values (253, 6);
insert into CreatedBy (ContID, EmployeeID) values (254, 23);
insert into CreatedBy (ContID, EmployeeID) values (255, 9);
insert into CreatedBy (ContID, EmployeeID) values (256, 63);
insert into CreatedBy (ContID, EmployeeID) values (257, 6);
insert into CreatedBy (ContID, EmployeeID) values (258, 24);
insert into CreatedBy (ContID, EmployeeID) values (259, 52);
insert into CreatedBy (ContID, EmployeeID) values (260, 56);
insert into CreatedBy (ContID, EmployeeID) values (261, 56);
insert into CreatedBy (ContID, EmployeeID) values (262, 5);
insert into CreatedBy (ContID, EmployeeID) values (263, 52);
insert into CreatedBy (ContID, EmployeeID) values (264, 52);
insert into CreatedBy (ContID, EmployeeID) values (265, 24);
insert into CreatedBy (ContID, EmployeeID) values (266, 23);
insert into CreatedBy (ContID, EmployeeID) values (267, 52);
insert into CreatedBy (ContID, EmployeeID) values (268, 63);
insert into CreatedBy (ContID, EmployeeID) values (269, 24);
insert into CreatedBy (ContID, EmployeeID) values (270, 63);
insert into CreatedBy (ContID, EmployeeID) values (271, 9);
insert into CreatedBy (ContID, EmployeeID) values (272, 63);
insert into CreatedBy (ContID, EmployeeID) values (273, 11);
insert into CreatedBy (ContID, EmployeeID) values (274, 5);
insert into CreatedBy (ContID, EmployeeID) values (275, 27);
insert into CreatedBy (ContID, EmployeeID) values (276, 1);
insert into CreatedBy (ContID, EmployeeID) values (277, 73);
insert into CreatedBy (ContID, EmployeeID) values (278, 56);
insert into CreatedBy (ContID, EmployeeID) values (279, 55);
insert into CreatedBy (ContID, EmployeeID) values (280, 24);
insert into CreatedBy (ContID, EmployeeID) values (281, 73);
insert into CreatedBy (ContID, EmployeeID) values (282, 33);
insert into CreatedBy (ContID, EmployeeID) values (283, 33);
insert into CreatedBy (ContID, EmployeeID) values (284, 24);
insert into CreatedBy (ContID, EmployeeID) values (285, 60);
insert into CreatedBy (ContID, EmployeeID) values (286, 9);
insert into CreatedBy (ContID, EmployeeID) values (287, 23);
insert into CreatedBy (ContID, EmployeeID) values (288, 60);
insert into CreatedBy (ContID, EmployeeID) values (289, 11);
insert into CreatedBy (ContID, EmployeeID) values (290, 52);
insert into CreatedBy (ContID, EmployeeID) values (291, 56);
insert into CreatedBy (ContID, EmployeeID) values (292, 6);
insert into CreatedBy (ContID, EmployeeID) values (293, 1);
insert into CreatedBy (ContID, EmployeeID) values (294, 33);
insert into CreatedBy (ContID, EmployeeID) values (295, 2);
insert into CreatedBy (ContID, EmployeeID) values (296, 63);
insert into CreatedBy (ContID, EmployeeID) values (297, 73);
insert into CreatedBy (ContID, EmployeeID) values (298, 27);
insert into CreatedBy (ContID, EmployeeID) values (299, 6);
insert into CreatedBy (ContID, EmployeeID) values (300, 1);
insert into CreatedBy (ContID, EmployeeID) values (301, 37);
insert into CreatedBy (ContID, EmployeeID) values (302, 2);
insert into CreatedBy (ContID, EmployeeID) values (303, 33);
insert into CreatedBy (ContID, EmployeeID) values (304, 73);
insert into CreatedBy (ContID, EmployeeID) values (305, 24);
insert into CreatedBy (ContID, EmployeeID) values (306, 16);
insert into CreatedBy (ContID, EmployeeID) values (307, 27);
insert into CreatedBy (ContID, EmployeeID) values (308, 9);
insert into CreatedBy (ContID, EmployeeID) values (309, 56);
insert into CreatedBy (ContID, EmployeeID) values (310, 11);
insert into CreatedBy (ContID, EmployeeID) values (311, 23);
insert into CreatedBy (ContID, EmployeeID) values (312, 52);
insert into CreatedBy (ContID, EmployeeID) values (313, 23);
insert into CreatedBy (ContID, EmployeeID) values (314, 63);
insert into CreatedBy (ContID, EmployeeID) values (315, 2);
insert into CreatedBy (ContID, EmployeeID) values (316, 5);
insert into CreatedBy (ContID, EmployeeID) values (317, 16);
insert into CreatedBy (ContID, EmployeeID) values (318, 73);
insert into CreatedBy (ContID, EmployeeID) values (319, 63);
insert into CreatedBy (ContID, EmployeeID) values (320, 5);
insert into CreatedBy (ContID, EmployeeID) values (321, 1);
insert into CreatedBy (ContID, EmployeeID) values (322, 73);
insert into CreatedBy (ContID, EmployeeID) values (323, 37);
insert into CreatedBy (ContID, EmployeeID) values (324, 27);
insert into CreatedBy (ContID, EmployeeID) values (325, 1);
insert into CreatedBy (ContID, EmployeeID) values (326, 23);
insert into CreatedBy (ContID, EmployeeID) values (327, 27);
insert into CreatedBy (ContID, EmployeeID) values (328, 23);
insert into CreatedBy (ContID, EmployeeID) values (329, 73);
insert into CreatedBy (ContID, EmployeeID) values (330, 37);
insert into CreatedBy (ContID, EmployeeID) values (331, 23);
insert into CreatedBy (ContID, EmployeeID) values (332, 37);
insert into CreatedBy (ContID, EmployeeID) values (333, 24);
insert into CreatedBy (ContID, EmployeeID) values (334, 55);
insert into CreatedBy (ContID, EmployeeID) values (335, 5);
insert into CreatedBy (ContID, EmployeeID) values (336, 24);
insert into CreatedBy (ContID, EmployeeID) values (337, 55);
insert into CreatedBy (ContID, EmployeeID) values (338, 16);
insert into CreatedBy (ContID, EmployeeID) values (339, 27);
insert into CreatedBy (ContID, EmployeeID) values (340, 17);
insert into CreatedBy (ContID, EmployeeID) values (341, 9);
insert into CreatedBy (ContID, EmployeeID) values (342, 16);
insert into CreatedBy (ContID, EmployeeID) values (343, 56);
insert into CreatedBy (ContID, EmployeeID) values (344, 24);
insert into CreatedBy (ContID, EmployeeID) values (345, 23);
insert into CreatedBy (ContID, EmployeeID) values (346, 37);
insert into CreatedBy (ContID, EmployeeID) values (347, 23);
insert into CreatedBy (ContID, EmployeeID) values (348, 16);
insert into CreatedBy (ContID, EmployeeID) values (349, 56);
insert into CreatedBy (ContID, EmployeeID) values (350, 63);
insert into CreatedBy (ContID, EmployeeID) values (351, 52);
insert into CreatedBy (ContID, EmployeeID) values (352, 1);
insert into CreatedBy (ContID, EmployeeID) values (353, 1);
insert into CreatedBy (ContID, EmployeeID) values (354, 5);
insert into CreatedBy (ContID, EmployeeID) values (355, 6);
insert into CreatedBy (ContID, EmployeeID) values (356, 56);
insert into CreatedBy (ContID, EmployeeID) values (357, 24);
insert into CreatedBy (ContID, EmployeeID) values (358, 16);
insert into CreatedBy (ContID, EmployeeID) values (359, 55);
insert into CreatedBy (ContID, EmployeeID) values (360, 2);
insert into CreatedBy (ContID, EmployeeID) values (361, 17);
insert into CreatedBy (ContID, EmployeeID) values (362, 6);
insert into CreatedBy (ContID, EmployeeID) values (363, 9);
insert into CreatedBy (ContID, EmployeeID) values (364, 27);
insert into CreatedBy (ContID, EmployeeID) values (365, 2);
insert into CreatedBy (ContID, EmployeeID) values (366, 1);
insert into CreatedBy (ContID, EmployeeID) values (367, 23);
insert into CreatedBy (ContID, EmployeeID) values (368, 27);
insert into CreatedBy (ContID, EmployeeID) values (369, 63);
insert into CreatedBy (ContID, EmployeeID) values (370, 37);
insert into CreatedBy (ContID, EmployeeID) values (371, 27);
insert into CreatedBy (ContID, EmployeeID) values (372, 33);
insert into CreatedBy (ContID, EmployeeID) values (373, 55);
insert into CreatedBy (ContID, EmployeeID) values (374, 2);
insert into CreatedBy (ContID, EmployeeID) values (375, 24);
insert into CreatedBy (ContID, EmployeeID) values (376, 56);
insert into CreatedBy (ContID, EmployeeID) values (377, 9);
insert into CreatedBy (ContID, EmployeeID) values (378, 23);
insert into CreatedBy (ContID, EmployeeID) values (379, 11);
insert into CreatedBy (ContID, EmployeeID) values (380, 52);
insert into CreatedBy (ContID, EmployeeID) values (381, 23);
insert into CreatedBy (ContID, EmployeeID) values (382, 1);
insert into CreatedBy (ContID, EmployeeID) values (383, 52);
insert into CreatedBy (ContID, EmployeeID) values (384, 52);
insert into CreatedBy (ContID, EmployeeID) values (385, 63);
insert into CreatedBy (ContID, EmployeeID) values (386, 6);
insert into CreatedBy (ContID, EmployeeID) values (387, 63);
insert into CreatedBy (ContID, EmployeeID) values (388, 60);
insert into CreatedBy (ContID, EmployeeID) values (389, 23);
insert into CreatedBy (ContID, EmployeeID) values (390, 5);
insert into CreatedBy (ContID, EmployeeID) values (391, 24);
insert into CreatedBy (ContID, EmployeeID) values (392, 24);
insert into CreatedBy (ContID, EmployeeID) values (393, 33);
insert into CreatedBy (ContID, EmployeeID) values (394, 16);
insert into CreatedBy (ContID, EmployeeID) values (395, 56);
insert into CreatedBy (ContID, EmployeeID) values (396, 27);
insert into CreatedBy (ContID, EmployeeID) values (397, 11);
insert into CreatedBy (ContID, EmployeeID) values (398, 1);
insert into CreatedBy (ContID, EmployeeID) values (399, 55);
insert into CreatedBy (ContID, EmployeeID) values (400, 27);
insert into CreatedBy (ContID, EmployeeID) values (401, 11);
insert into CreatedBy (ContID, EmployeeID) values (402, 37);
insert into CreatedBy (ContID, EmployeeID) values (403, 23);
insert into CreatedBy (ContID, EmployeeID) values (404, 27);
insert into CreatedBy (ContID, EmployeeID) values (405, 17);
insert into CreatedBy (ContID, EmployeeID) values (406, 33);
insert into CreatedBy (ContID, EmployeeID) values (407, 2);
insert into CreatedBy (ContID, EmployeeID) values (408, 63);
insert into CreatedBy (ContID, EmployeeID) values (409, 63);
insert into CreatedBy (ContID, EmployeeID) values (410, 27);
insert into CreatedBy (ContID, EmployeeID) values (411, 5);
insert into CreatedBy (ContID, EmployeeID) values (412, 56);
insert into CreatedBy (ContID, EmployeeID) values (413, 6);
insert into CreatedBy (ContID, EmployeeID) values (414, 73);
insert into CreatedBy (ContID, EmployeeID) values (415, 56);
insert into CreatedBy (ContID, EmployeeID) values (416, 5);
insert into CreatedBy (ContID, EmployeeID) values (417, 5);
insert into CreatedBy (ContID, EmployeeID) values (418, 16);
insert into CreatedBy (ContID, EmployeeID) values (419, 2);
insert into CreatedBy (ContID, EmployeeID) values (420, 17);
insert into CreatedBy (ContID, EmployeeID) values (421, 11);
insert into CreatedBy (ContID, EmployeeID) values (422, 9);
insert into CreatedBy (ContID, EmployeeID) values (423, 6);
insert into CreatedBy (ContID, EmployeeID) values (424, 73);
insert into CreatedBy (ContID, EmployeeID) values (425, 2);
insert into CreatedBy (ContID, EmployeeID) values (426, 63);
insert into CreatedBy (ContID, EmployeeID) values (427, 6);
insert into CreatedBy (ContID, EmployeeID) values (428, 17);
insert into CreatedBy (ContID, EmployeeID) values (429, 11);
insert into CreatedBy (ContID, EmployeeID) values (430, 5);
insert into CreatedBy (ContID, EmployeeID) values (431, 23);
insert into CreatedBy (ContID, EmployeeID) values (432, 23);
insert into CreatedBy (ContID, EmployeeID) values (433, 55);
insert into CreatedBy (ContID, EmployeeID) values (434, 56);
insert into CreatedBy (ContID, EmployeeID) values (435, 37);
insert into CreatedBy (ContID, EmployeeID) values (436, 16);
insert into CreatedBy (ContID, EmployeeID) values (437, 6);
insert into CreatedBy (ContID, EmployeeID) values (438, 33);
insert into CreatedBy (ContID, EmployeeID) values (439, 60);
insert into CreatedBy (ContID, EmployeeID) values (440, 5);
insert into CreatedBy (ContID, EmployeeID) values (441, 17);
insert into CreatedBy (ContID, EmployeeID) values (442, 63);
insert into CreatedBy (ContID, EmployeeID) values (443, 60);
insert into CreatedBy (ContID, EmployeeID) values (444, 56);
insert into CreatedBy (ContID, EmployeeID) values (445, 60);
insert into CreatedBy (ContID, EmployeeID) values (446, 55);
insert into CreatedBy (ContID, EmployeeID) values (447, 11);
insert into CreatedBy (ContID, EmployeeID) values (448, 9);
insert into CreatedBy (ContID, EmployeeID) values (449, 37);
insert into CreatedBy (ContID, EmployeeID) values (450, 63);
insert into CreatedBy (ContID, EmployeeID) values (451, 60);
insert into CreatedBy (ContID, EmployeeID) values (452, 2);
insert into CreatedBy (ContID, EmployeeID) values (453, 2);
insert into CreatedBy (ContID, EmployeeID) values (454, 1);
insert into CreatedBy (ContID, EmployeeID) values (455, 9);
insert into CreatedBy (ContID, EmployeeID) values (456, 9);
insert into CreatedBy (ContID, EmployeeID) values (457, 5);
insert into CreatedBy (ContID, EmployeeID) values (458, 56);
insert into CreatedBy (ContID, EmployeeID) values (459, 27);
insert into CreatedBy (ContID, EmployeeID) values (460, 16);
insert into CreatedBy (ContID, EmployeeID) values (461, 33);
insert into CreatedBy (ContID, EmployeeID) values (462, 24);
insert into CreatedBy (ContID, EmployeeID) values (463, 63);
insert into CreatedBy (ContID, EmployeeID) values (464, 23);
insert into CreatedBy (ContID, EmployeeID) values (465, 60);
insert into CreatedBy (ContID, EmployeeID) values (466, 6);
insert into CreatedBy (ContID, EmployeeID) values (467, 6);
insert into CreatedBy (ContID, EmployeeID) values (468, 11);
insert into CreatedBy (ContID, EmployeeID) values (469, 33);
insert into CreatedBy (ContID, EmployeeID) values (470, 55);
insert into CreatedBy (ContID, EmployeeID) values (471, 11);
insert into CreatedBy (ContID, EmployeeID) values (472, 56);
insert into CreatedBy (ContID, EmployeeID) values (473, 6);
insert into CreatedBy (ContID, EmployeeID) values (474, 73);
insert into CreatedBy (ContID, EmployeeID) values (475, 5);
insert into CreatedBy (ContID, EmployeeID) values (476, 11);
insert into CreatedBy (ContID, EmployeeID) values (477, 63);
insert into CreatedBy (ContID, EmployeeID) values (478, 63);
insert into CreatedBy (ContID, EmployeeID) values (479, 37);
insert into CreatedBy (ContID, EmployeeID) values (480, 2);
insert into CreatedBy (ContID, EmployeeID) values (481, 5);
insert into CreatedBy (ContID, EmployeeID) values (482, 23);
insert into CreatedBy (ContID, EmployeeID) values (483, 17);
insert into CreatedBy (ContID, EmployeeID) values (484, 9);
insert into CreatedBy (ContID, EmployeeID) values (485, 1);
insert into CreatedBy (ContID, EmployeeID) values (486, 56);
insert into CreatedBy (ContID, EmployeeID) values (487, 27);
insert into CreatedBy (ContID, EmployeeID) values (488, 5);
insert into CreatedBy (ContID, EmployeeID) values (489, 6);
insert into CreatedBy (ContID, EmployeeID) values (490, 63);
insert into CreatedBy (ContID, EmployeeID) values (491, 37);
insert into CreatedBy (ContID, EmployeeID) values (492, 60);
insert into CreatedBy (ContID, EmployeeID) values (493, 60);
insert into CreatedBy (ContID, EmployeeID) values (494, 16);
insert into CreatedBy (ContID, EmployeeID) values (495, 5);
insert into CreatedBy (ContID, EmployeeID) values (496, 16);
insert into CreatedBy (ContID, EmployeeID) values (497, 55);
insert into CreatedBy (ContID, EmployeeID) values (498, 16);
insert into CreatedBy (ContID, EmployeeID) values (499, 27);
insert into CreatedBy (ContID, EmployeeID) values (500, 37);
insert into CreatedBy (ContID, EmployeeID) values (501, 63);
insert into CreatedBy (ContID, EmployeeID) values (502, 52);
insert into CreatedBy (ContID, EmployeeID) values (503, 33);
insert into CreatedBy (ContID, EmployeeID) values (504, 16);
insert into CreatedBy (ContID, EmployeeID) values (505, 55);
insert into CreatedBy (ContID, EmployeeID) values (506, 17);
insert into CreatedBy (ContID, EmployeeID) values (507, 23);
insert into CreatedBy (ContID, EmployeeID) values (508, 17);
insert into CreatedBy (ContID, EmployeeID) values (509, 73);
insert into CreatedBy (ContID, EmployeeID) values (510, 16);
insert into CreatedBy (ContID, EmployeeID) values (511, 23);
insert into CreatedBy (ContID, EmployeeID) values (512, 55);
insert into CreatedBy (ContID, EmployeeID) values (513, 5);
insert into CreatedBy (ContID, EmployeeID) values (514, 24);
insert into CreatedBy (ContID, EmployeeID) values (515, 24);
insert into CreatedBy (ContID, EmployeeID) values (516, 52);
insert into CreatedBy (ContID, EmployeeID) values (517, 55);
insert into CreatedBy (ContID, EmployeeID) values (518, 56);
insert into CreatedBy (ContID, EmployeeID) values (519, 9);
insert into CreatedBy (ContID, EmployeeID) values (520, 11);
insert into CreatedBy (ContID, EmployeeID) values (521, 37);
insert into CreatedBy (ContID, EmployeeID) values (522, 73);
insert into CreatedBy (ContID, EmployeeID) values (523, 56);
insert into CreatedBy (ContID, EmployeeID) values (524, 24);
insert into CreatedBy (ContID, EmployeeID) values (525, 5);
insert into CreatedBy (ContID, EmployeeID) values (526, 73);
insert into CreatedBy (ContID, EmployeeID) values (527, 73);
insert into CreatedBy (ContID, EmployeeID) values (528, 37);
insert into CreatedBy (ContID, EmployeeID) values (529, 33);
insert into CreatedBy (ContID, EmployeeID) values (530, 9);
insert into CreatedBy (ContID, EmployeeID) values (531, 2);
insert into CreatedBy (ContID, EmployeeID) values (532, 37);
insert into CreatedBy (ContID, EmployeeID) values (533, 56);
insert into CreatedBy (ContID, EmployeeID) values (534, 11);
insert into CreatedBy (ContID, EmployeeID) values (535, 55);
insert into CreatedBy (ContID, EmployeeID) values (536, 23);
insert into CreatedBy (ContID, EmployeeID) values (537, 1);
insert into CreatedBy (ContID, EmployeeID) values (538, 2);
insert into CreatedBy (ContID, EmployeeID) values (539, 52);
insert into CreatedBy (ContID, EmployeeID) values (540, 23);
insert into CreatedBy (ContID, EmployeeID) values (541, 55);
insert into CreatedBy (ContID, EmployeeID) values (542, 16);
insert into CreatedBy (ContID, EmployeeID) values (543, 24);
insert into CreatedBy (ContID, EmployeeID) values (544, 63);
insert into CreatedBy (ContID, EmployeeID) values (545, 24);
insert into CreatedBy (ContID, EmployeeID) values (546, 52);
insert into CreatedBy (ContID, EmployeeID) values (547, 60);
insert into CreatedBy (ContID, EmployeeID) values (548, 11);
insert into CreatedBy (ContID, EmployeeID) values (549, 11);
insert into CreatedBy (ContID, EmployeeID) values (550, 16);
insert into CreatedBy (ContID, EmployeeID) values (551, 24);
insert into CreatedBy (ContID, EmployeeID) values (552, 9);
insert into CreatedBy (ContID, EmployeeID) values (553, 55);
insert into CreatedBy (ContID, EmployeeID) values (554, 63);
insert into CreatedBy (ContID, EmployeeID) values (555, 1);
insert into CreatedBy (ContID, EmployeeID) values (556, 33);
insert into CreatedBy (ContID, EmployeeID) values (557, 23);
insert into CreatedBy (ContID, EmployeeID) values (558, 73);
insert into CreatedBy (ContID, EmployeeID) values (559, 11);
insert into CreatedBy (ContID, EmployeeID) values (560, 27);
insert into CreatedBy (ContID, EmployeeID) values (561, 56);
insert into CreatedBy (ContID, EmployeeID) values (562, 9);
insert into CreatedBy (ContID, EmployeeID) values (563, 52);
insert into CreatedBy (ContID, EmployeeID) values (564, 1);
insert into CreatedBy (ContID, EmployeeID) values (565, 1);
insert into CreatedBy (ContID, EmployeeID) values (566, 17);
insert into CreatedBy (ContID, EmployeeID) values (567, 56);
insert into CreatedBy (ContID, EmployeeID) values (568, 5);
insert into CreatedBy (ContID, EmployeeID) values (569, 73);
insert into CreatedBy (ContID, EmployeeID) values (570, 27);
insert into CreatedBy (ContID, EmployeeID) values (571, 11);
insert into CreatedBy (ContID, EmployeeID) values (572, 27);
insert into CreatedBy (ContID, EmployeeID) values (573, 73);
insert into CreatedBy (ContID, EmployeeID) values (574, 52);
insert into CreatedBy (ContID, EmployeeID) values (575, 9);
insert into CreatedBy (ContID, EmployeeID) values (576, 27);
insert into CreatedBy (ContID, EmployeeID) values (577, 17);
insert into CreatedBy (ContID, EmployeeID) values (578, 23);
insert into CreatedBy (ContID, EmployeeID) values (579, 2);
insert into CreatedBy (ContID, EmployeeID) values (580, 60);
insert into CreatedBy (ContID, EmployeeID) values (581, 73);
insert into CreatedBy (ContID, EmployeeID) values (582, 37);
insert into CreatedBy (ContID, EmployeeID) values (583, 63);
insert into CreatedBy (ContID, EmployeeID) values (584, 33);
insert into CreatedBy (ContID, EmployeeID) values (585, 17);
insert into CreatedBy (ContID, EmployeeID) values (586, 16);
insert into CreatedBy (ContID, EmployeeID) values (587, 11);
insert into CreatedBy (ContID, EmployeeID) values (588, 60);
insert into CreatedBy (ContID, EmployeeID) values (589, 6);
insert into CreatedBy (ContID, EmployeeID) values (590, 5);
insert into CreatedBy (ContID, EmployeeID) values (591, 17);
insert into CreatedBy (ContID, EmployeeID) values (592, 5);
insert into CreatedBy (ContID, EmployeeID) values (593, 6);
insert into CreatedBy (ContID, EmployeeID) values (594, 1);
insert into CreatedBy (ContID, EmployeeID) values (595, 55);
insert into CreatedBy (ContID, EmployeeID) values (596, 23);
insert into CreatedBy (ContID, EmployeeID) values (597, 11);
insert into CreatedBy (ContID, EmployeeID) values (598, 63);
insert into CreatedBy (ContID, EmployeeID) values (599, 5);
insert into CreatedBy (ContID, EmployeeID) values (600, 23);
insert into CreatedBy (ContID, EmployeeID) values (601, 16);
insert into CreatedBy (ContID, EmployeeID) values (602, 60);
insert into CreatedBy (ContID, EmployeeID) values (603, 9);
insert into CreatedBy (ContID, EmployeeID) values (604, 33);
insert into CreatedBy (ContID, EmployeeID) values (605, 17);
insert into CreatedBy (ContID, EmployeeID) values (606, 2);
insert into CreatedBy (ContID, EmployeeID) values (607, 24);
insert into CreatedBy (ContID, EmployeeID) values (608, 2);
insert into CreatedBy (ContID, EmployeeID) values (609, 73);
insert into CreatedBy (ContID, EmployeeID) values (610, 9);
insert into CreatedBy (ContID, EmployeeID) values (611, 17);
insert into CreatedBy (ContID, EmployeeID) values (612, 11);
insert into CreatedBy (ContID, EmployeeID) values (613, 23);
insert into CreatedBy (ContID, EmployeeID) values (614, 55);
insert into CreatedBy (ContID, EmployeeID) values (615, 1);
insert into CreatedBy (ContID, EmployeeID) values (616, 11);
insert into CreatedBy (ContID, EmployeeID) values (617, 2);
insert into CreatedBy (ContID, EmployeeID) values (618, 33);
insert into CreatedBy (ContID, EmployeeID) values (619, 16);
insert into CreatedBy (ContID, EmployeeID) values (620, 17);
insert into CreatedBy (ContID, EmployeeID) values (621, 16);
insert into CreatedBy (ContID, EmployeeID) values (622, 5);
insert into CreatedBy (ContID, EmployeeID) values (623, 2);
insert into CreatedBy (ContID, EmployeeID) values (624, 33);
insert into CreatedBy (ContID, EmployeeID) values (625, 63);
insert into CreatedBy (ContID, EmployeeID) values (626, 60);
insert into CreatedBy (ContID, EmployeeID) values (627, 9);
insert into CreatedBy (ContID, EmployeeID) values (628, 55);
insert into CreatedBy (ContID, EmployeeID) values (629, 55);
insert into CreatedBy (ContID, EmployeeID) values (630, 9);
insert into CreatedBy (ContID, EmployeeID) values (631, 2);
insert into CreatedBy (ContID, EmployeeID) values (632, 16);
insert into CreatedBy (ContID, EmployeeID) values (633, 2);
insert into CreatedBy (ContID, EmployeeID) values (634, 6);
insert into CreatedBy (ContID, EmployeeID) values (635, 2);
insert into CreatedBy (ContID, EmployeeID) values (636, 23);
insert into CreatedBy (ContID, EmployeeID) values (637, 60);
insert into CreatedBy (ContID, EmployeeID) values (638, 27);
insert into CreatedBy (ContID, EmployeeID) values (639, 6);
insert into CreatedBy (ContID, EmployeeID) values (640, 9);
insert into CreatedBy (ContID, EmployeeID) values (641, 27);
insert into CreatedBy (ContID, EmployeeID) values (642, 17);
insert into CreatedBy (ContID, EmployeeID) values (643, 5);
insert into CreatedBy (ContID, EmployeeID) values (644, 5);
insert into CreatedBy (ContID, EmployeeID) values (645, 33);
insert into CreatedBy (ContID, EmployeeID) values (646, 63);
insert into CreatedBy (ContID, EmployeeID) values (647, 27);
insert into CreatedBy (ContID, EmployeeID) values (648, 24);
insert into CreatedBy (ContID, EmployeeID) values (649, 33);
insert into CreatedBy (ContID, EmployeeID) values (650, 9);
insert into CreatedBy (ContID, EmployeeID) values (651, 24);
insert into CreatedBy (ContID, EmployeeID) values (652, 37);
insert into CreatedBy (ContID, EmployeeID) values (653, 60);
insert into CreatedBy (ContID, EmployeeID) values (654, 52);
insert into CreatedBy (ContID, EmployeeID) values (655, 27);
insert into CreatedBy (ContID, EmployeeID) values (656, 24);
insert into CreatedBy (ContID, EmployeeID) values (657, 5);
insert into CreatedBy (ContID, EmployeeID) values (658, 52);
insert into CreatedBy (ContID, EmployeeID) values (659, 24);
insert into CreatedBy (ContID, EmployeeID) values (660, 16);
insert into CreatedBy (ContID, EmployeeID) values (661, 2);
insert into CreatedBy (ContID, EmployeeID) values (662, 5);
insert into CreatedBy (ContID, EmployeeID) values (663, 24);
insert into CreatedBy (ContID, EmployeeID) values (664, 2);
insert into CreatedBy (ContID, EmployeeID) values (665, 2);
insert into CreatedBy (ContID, EmployeeID) values (666, 52);
insert into CreatedBy (ContID, EmployeeID) values (667, 56);
insert into CreatedBy (ContID, EmployeeID) values (668, 11);
insert into CreatedBy (ContID, EmployeeID) values (669, 37);
insert into CreatedBy (ContID, EmployeeID) values (670, 73);
insert into CreatedBy (ContID, EmployeeID) values (671, 17);
insert into CreatedBy (ContID, EmployeeID) values (672, 27);
insert into CreatedBy (ContID, EmployeeID) values (673, 37);
insert into CreatedBy (ContID, EmployeeID) values (674, 5);
insert into CreatedBy (ContID, EmployeeID) values (675, 55);
insert into CreatedBy (ContID, EmployeeID) values (676, 17);
insert into CreatedBy (ContID, EmployeeID) values (677, 11);
insert into CreatedBy (ContID, EmployeeID) values (678, 24);
insert into CreatedBy (ContID, EmployeeID) values (679, 1);
insert into CreatedBy (ContID, EmployeeID) values (680, 1);
insert into CreatedBy (ContID, EmployeeID) values (681, 52);
insert into CreatedBy (ContID, EmployeeID) values (682, 52);
insert into CreatedBy (ContID, EmployeeID) values (683, 33);
insert into CreatedBy (ContID, EmployeeID) values (684, 24);
insert into CreatedBy (ContID, EmployeeID) values (685, 37);
insert into CreatedBy (ContID, EmployeeID) values (686, 33);
insert into CreatedBy (ContID, EmployeeID) values (687, 52);
insert into CreatedBy (ContID, EmployeeID) values (688, 60);
insert into CreatedBy (ContID, EmployeeID) values (689, 9);
insert into CreatedBy (ContID, EmployeeID) values (690, 73);
insert into CreatedBy (ContID, EmployeeID) values (691, 60);
insert into CreatedBy (ContID, EmployeeID) values (692, 9);
insert into CreatedBy (ContID, EmployeeID) values (693, 63);
insert into CreatedBy (ContID, EmployeeID) values (694, 17);
insert into CreatedBy (ContID, EmployeeID) values (695, 60);
insert into CreatedBy (ContID, EmployeeID) values (696, 16);
insert into CreatedBy (ContID, EmployeeID) values (697, 17);
insert into CreatedBy (ContID, EmployeeID) values (698, 2);
insert into CreatedBy (ContID, EmployeeID) values (699, 73);
insert into CreatedBy (ContID, EmployeeID) values (700, 17);
insert into CreatedBy (ContID, EmployeeID) values (701, 55);
insert into CreatedBy (ContID, EmployeeID) values (702, 27);
insert into CreatedBy (ContID, EmployeeID) values (703, 37);
insert into CreatedBy (ContID, EmployeeID) values (704, 9);
insert into CreatedBy (ContID, EmployeeID) values (705, 9);
insert into CreatedBy (ContID, EmployeeID) values (706, 5);
insert into CreatedBy (ContID, EmployeeID) values (707, 6);
insert into CreatedBy (ContID, EmployeeID) values (708, 63);
insert into CreatedBy (ContID, EmployeeID) values (709, 23);
insert into CreatedBy (ContID, EmployeeID) values (710, 55);
insert into CreatedBy (ContID, EmployeeID) values (711, 37);
insert into CreatedBy (ContID, EmployeeID) values (712, 2);
insert into CreatedBy (ContID, EmployeeID) values (713, 73);
insert into CreatedBy (ContID, EmployeeID) values (714, 1);
insert into CreatedBy (ContID, EmployeeID) values (715, 11);
insert into CreatedBy (ContID, EmployeeID) values (716, 2);
insert into CreatedBy (ContID, EmployeeID) values (717, 17);
insert into CreatedBy (ContID, EmployeeID) values (718, 33);
insert into CreatedBy (ContID, EmployeeID) values (719, 11);
insert into CreatedBy (ContID, EmployeeID) values (720, 33);
insert into CreatedBy (ContID, EmployeeID) values (721, 55);
insert into CreatedBy (ContID, EmployeeID) values (722, 56);
insert into CreatedBy (ContID, EmployeeID) values (723, 2);
insert into CreatedBy (ContID, EmployeeID) values (724, 27);
insert into CreatedBy (ContID, EmployeeID) values (725, 5);
insert into CreatedBy (ContID, EmployeeID) values (726, 16);
insert into CreatedBy (ContID, EmployeeID) values (727, 56);
insert into CreatedBy (ContID, EmployeeID) values (728, 73);
insert into CreatedBy (ContID, EmployeeID) values (729, 16);
insert into CreatedBy (ContID, EmployeeID) values (730, 6);
insert into CreatedBy (ContID, EmployeeID) values (731, 5);
insert into CreatedBy (ContID, EmployeeID) values (732, 33);
insert into CreatedBy (ContID, EmployeeID) values (733, 23);
insert into CreatedBy (ContID, EmployeeID) values (734, 9);
insert into CreatedBy (ContID, EmployeeID) values (735, 5);
insert into CreatedBy (ContID, EmployeeID) values (736, 17);
insert into CreatedBy (ContID, EmployeeID) values (737, 55);
insert into CreatedBy (ContID, EmployeeID) values (738, 63);
insert into CreatedBy (ContID, EmployeeID) values (739, 17);
insert into CreatedBy (ContID, EmployeeID) values (740, 55);
insert into CreatedBy (ContID, EmployeeID) values (741, 11);
insert into CreatedBy (ContID, EmployeeID) values (742, 17);
insert into CreatedBy (ContID, EmployeeID) values (743, 52);
insert into CreatedBy (ContID, EmployeeID) values (744, 55);
insert into CreatedBy (ContID, EmployeeID) values (745, 6);
insert into CreatedBy (ContID, EmployeeID) values (746, 33);
insert into CreatedBy (ContID, EmployeeID) values (747, 24);
insert into CreatedBy (ContID, EmployeeID) values (748, 60);
insert into CreatedBy (ContID, EmployeeID) values (749, 16);
insert into CreatedBy (ContID, EmployeeID) values (750, 23);
insert into CreatedBy (ContID, EmployeeID) values (751, 6);
insert into CreatedBy (ContID, EmployeeID) values (752, 6);
insert into CreatedBy (ContID, EmployeeID) values (753, 6);
insert into CreatedBy (ContID, EmployeeID) values (754, 73);
insert into CreatedBy (ContID, EmployeeID) values (755, 27);
insert into CreatedBy (ContID, EmployeeID) values (756, 11);
insert into CreatedBy (ContID, EmployeeID) values (757, 24);
insert into CreatedBy (ContID, EmployeeID) values (758, 9);
insert into CreatedBy (ContID, EmployeeID) values (759, 60);
insert into CreatedBy (ContID, EmployeeID) values (760, 1);
insert into CreatedBy (ContID, EmployeeID) values (761, 24);
insert into CreatedBy (ContID, EmployeeID) values (762, 63);
insert into CreatedBy (ContID, EmployeeID) values (763, 6);
insert into CreatedBy (ContID, EmployeeID) values (764, 2);
insert into CreatedBy (ContID, EmployeeID) values (765, 55);
insert into CreatedBy (ContID, EmployeeID) values (766, 9);
insert into CreatedBy (ContID, EmployeeID) values (767, 11);
insert into CreatedBy (ContID, EmployeeID) values (768, 27);
insert into CreatedBy (ContID, EmployeeID) values (769, 9);
insert into CreatedBy (ContID, EmployeeID) values (770, 60);
insert into CreatedBy (ContID, EmployeeID) values (771, 9);
insert into CreatedBy (ContID, EmployeeID) values (772, 23);
insert into CreatedBy (ContID, EmployeeID) values (773, 6);
insert into CreatedBy (ContID, EmployeeID) values (774, 6);
insert into CreatedBy (ContID, EmployeeID) values (775, 27);
insert into CreatedBy (ContID, EmployeeID) values (776, 9);
insert into CreatedBy (ContID, EmployeeID) values (777, 33);
insert into CreatedBy (ContID, EmployeeID) values (778, 5);
insert into CreatedBy (ContID, EmployeeID) values (779, 73);
insert into CreatedBy (ContID, EmployeeID) values (780, 37);
insert into CreatedBy (ContID, EmployeeID) values (781, 55);
insert into CreatedBy (ContID, EmployeeID) values (782, 24);
insert into CreatedBy (ContID, EmployeeID) values (783, 1);
insert into CreatedBy (ContID, EmployeeID) values (784, 17);
insert into CreatedBy (ContID, EmployeeID) values (785, 9);
insert into CreatedBy (ContID, EmployeeID) values (786, 1);
insert into CreatedBy (ContID, EmployeeID) values (787, 2);
insert into CreatedBy (ContID, EmployeeID) values (788, 2);
insert into CreatedBy (ContID, EmployeeID) values (789, 23);
insert into CreatedBy (ContID, EmployeeID) values (790, 27);
insert into CreatedBy (ContID, EmployeeID) values (791, 23);
insert into CreatedBy (ContID, EmployeeID) values (792, 1);
insert into CreatedBy (ContID, EmployeeID) values (793, 33);
insert into CreatedBy (ContID, EmployeeID) values (794, 16);
insert into CreatedBy (ContID, EmployeeID) values (795, 55);
insert into CreatedBy (ContID, EmployeeID) values (796, 9);
insert into CreatedBy (ContID, EmployeeID) values (797, 24);
insert into CreatedBy (ContID, EmployeeID) values (798, 27);
insert into CreatedBy (ContID, EmployeeID) values (799, 52);
insert into CreatedBy (ContID, EmployeeID) values (800, 56);
insert into CreatedBy (ContID, EmployeeID) values (801, 24);
insert into CreatedBy (ContID, EmployeeID) values (802, 33);
insert into CreatedBy (ContID, EmployeeID) values (803, 23);
insert into CreatedBy (ContID, EmployeeID) values (804, 60);
insert into CreatedBy (ContID, EmployeeID) values (805, 5);
insert into CreatedBy (ContID, EmployeeID) values (806, 60);
insert into CreatedBy (ContID, EmployeeID) values (807, 73);
insert into CreatedBy (ContID, EmployeeID) values (808, 56);
insert into CreatedBy (ContID, EmployeeID) values (809, 11);
insert into CreatedBy (ContID, EmployeeID) values (810, 5);
insert into CreatedBy (ContID, EmployeeID) values (811, 6);
insert into CreatedBy (ContID, EmployeeID) values (812, 6);
insert into CreatedBy (ContID, EmployeeID) values (813, 52);
insert into CreatedBy (ContID, EmployeeID) values (814, 23);
insert into CreatedBy (ContID, EmployeeID) values (815, 9);
insert into CreatedBy (ContID, EmployeeID) values (816, 17);
insert into CreatedBy (ContID, EmployeeID) values (817, 24);
insert into CreatedBy (ContID, EmployeeID) values (818, 37);
insert into CreatedBy (ContID, EmployeeID) values (819, 37);
insert into CreatedBy (ContID, EmployeeID) values (820, 17);
insert into CreatedBy (ContID, EmployeeID) values (821, 1);
insert into CreatedBy (ContID, EmployeeID) values (822, 55);
insert into CreatedBy (ContID, EmployeeID) values (823, 9);
insert into CreatedBy (ContID, EmployeeID) values (824, 1);
insert into CreatedBy (ContID, EmployeeID) values (825, 37);
insert into CreatedBy (ContID, EmployeeID) values (826, 17);
insert into CreatedBy (ContID, EmployeeID) values (827, 73);
insert into CreatedBy (ContID, EmployeeID) values (828, 23);
insert into CreatedBy (ContID, EmployeeID) values (829, 9);
insert into CreatedBy (ContID, EmployeeID) values (830, 2);
insert into CreatedBy (ContID, EmployeeID) values (831, 9);
insert into CreatedBy (ContID, EmployeeID) values (832, 56);
insert into CreatedBy (ContID, EmployeeID) values (833, 27);
insert into CreatedBy (ContID, EmployeeID) values (834, 55);
insert into CreatedBy (ContID, EmployeeID) values (835, 55);
insert into CreatedBy (ContID, EmployeeID) values (836, 56);
insert into CreatedBy (ContID, EmployeeID) values (837, 73);
insert into CreatedBy (ContID, EmployeeID) values (838, 2);
insert into CreatedBy (ContID, EmployeeID) values (839, 1);
insert into CreatedBy (ContID, EmployeeID) values (840, 24);
insert into CreatedBy (ContID, EmployeeID) values (841, 73);
insert into CreatedBy (ContID, EmployeeID) values (842, 63);
insert into CreatedBy (ContID, EmployeeID) values (843, 9);
insert into CreatedBy (ContID, EmployeeID) values (844, 33);
insert into CreatedBy (ContID, EmployeeID) values (845, 2);
insert into CreatedBy (ContID, EmployeeID) values (846, 16);
insert into CreatedBy (ContID, EmployeeID) values (847, 73);
insert into CreatedBy (ContID, EmployeeID) values (848, 1);
insert into CreatedBy (ContID, EmployeeID) values (849, 9);
insert into CreatedBy (ContID, EmployeeID) values (850, 5);
insert into CreatedBy (ContID, EmployeeID) values (851, 60);
insert into CreatedBy (ContID, EmployeeID) values (852, 56);
insert into CreatedBy (ContID, EmployeeID) values (853, 52);
insert into CreatedBy (ContID, EmployeeID) values (854, 2);
insert into CreatedBy (ContID, EmployeeID) values (855, 17);
insert into CreatedBy (ContID, EmployeeID) values (856, 1);
insert into CreatedBy (ContID, EmployeeID) values (857, 27);
insert into CreatedBy (ContID, EmployeeID) values (858, 11);
insert into CreatedBy (ContID, EmployeeID) values (859, 33);
insert into CreatedBy (ContID, EmployeeID) values (860, 1);
insert into CreatedBy (ContID, EmployeeID) values (861, 16);
insert into CreatedBy (ContID, EmployeeID) values (862, 16);
insert into CreatedBy (ContID, EmployeeID) values (863, 23);
insert into CreatedBy (ContID, EmployeeID) values (864, 17);
insert into CreatedBy (ContID, EmployeeID) values (865, 9);
insert into CreatedBy (ContID, EmployeeID) values (866, 9);
insert into CreatedBy (ContID, EmployeeID) values (867, 55);
insert into CreatedBy (ContID, EmployeeID) values (868, 17);
insert into CreatedBy (ContID, EmployeeID) values (869, 5);
insert into CreatedBy (ContID, EmployeeID) values (870, 1);
insert into CreatedBy (ContID, EmployeeID) values (871, 73);
insert into CreatedBy (ContID, EmployeeID) values (872, 6);
insert into CreatedBy (ContID, EmployeeID) values (873, 55);
insert into CreatedBy (ContID, EmployeeID) values (874, 17);
insert into CreatedBy (ContID, EmployeeID) values (875, 17);
insert into CreatedBy (ContID, EmployeeID) values (876, 2);
insert into CreatedBy (ContID, EmployeeID) values (877, 33);
insert into CreatedBy (ContID, EmployeeID) values (878, 5);
insert into CreatedBy (ContID, EmployeeID) values (879, 24);
insert into CreatedBy (ContID, EmployeeID) values (880, 27);
insert into CreatedBy (ContID, EmployeeID) values (881, 24);
insert into CreatedBy (ContID, EmployeeID) values (882, 9);
insert into CreatedBy (ContID, EmployeeID) values (883, 33);
insert into CreatedBy (ContID, EmployeeID) values (884, 27);
insert into CreatedBy (ContID, EmployeeID) values (885, 60);
insert into CreatedBy (ContID, EmployeeID) values (886, 5);
insert into CreatedBy (ContID, EmployeeID) values (887, 1);
insert into CreatedBy (ContID, EmployeeID) values (888, 17);
insert into CreatedBy (ContID, EmployeeID) values (889, 27);
insert into CreatedBy (ContID, EmployeeID) values (890, 63);
insert into CreatedBy (ContID, EmployeeID) values (891, 56);
insert into CreatedBy (ContID, EmployeeID) values (892, 27);
insert into CreatedBy (ContID, EmployeeID) values (893, 37);
insert into CreatedBy (ContID, EmployeeID) values (894, 52);
insert into CreatedBy (ContID, EmployeeID) values (895, 6);
insert into CreatedBy (ContID, EmployeeID) values (896, 5);
insert into CreatedBy (ContID, EmployeeID) values (897, 63);
insert into CreatedBy (ContID, EmployeeID) values (898, 56);
insert into CreatedBy (ContID, EmployeeID) values (899, 6);
insert into CreatedBy (ContID, EmployeeID) values (900, 27);
insert into CreatedBy (ContID, EmployeeID) values (901, 63);
insert into CreatedBy (ContID, EmployeeID) values (902, 55);
insert into CreatedBy (ContID, EmployeeID) values (903, 56);
insert into CreatedBy (ContID, EmployeeID) values (904, 60);
insert into CreatedBy (ContID, EmployeeID) values (905, 23);
insert into CreatedBy (ContID, EmployeeID) values (906, 56);
insert into CreatedBy (ContID, EmployeeID) values (907, 55);
insert into CreatedBy (ContID, EmployeeID) values (908, 33);
insert into CreatedBy (ContID, EmployeeID) values (909, 56);
insert into CreatedBy (ContID, EmployeeID) values (910, 73);
insert into CreatedBy (ContID, EmployeeID) values (911, 1);
insert into CreatedBy (ContID, EmployeeID) values (912, 37);
insert into CreatedBy (ContID, EmployeeID) values (913, 2);
insert into CreatedBy (ContID, EmployeeID) values (914, 17);
insert into CreatedBy (ContID, EmployeeID) values (915, 1);
insert into CreatedBy (ContID, EmployeeID) values (916, 2);
insert into CreatedBy (ContID, EmployeeID) values (917, 9);
insert into CreatedBy (ContID, EmployeeID) values (918, 16);
insert into CreatedBy (ContID, EmployeeID) values (919, 37);
insert into CreatedBy (ContID, EmployeeID) values (920, 16);
insert into CreatedBy (ContID, EmployeeID) values (921, 6);
insert into CreatedBy (ContID, EmployeeID) values (922, 52);
insert into CreatedBy (ContID, EmployeeID) values (923, 6);
insert into CreatedBy (ContID, EmployeeID) values (924, 27);
insert into CreatedBy (ContID, EmployeeID) values (925, 17);
insert into CreatedBy (ContID, EmployeeID) values (926, 2);
insert into CreatedBy (ContID, EmployeeID) values (927, 55);
insert into CreatedBy (ContID, EmployeeID) values (928, 63);
insert into CreatedBy (ContID, EmployeeID) values (929, 16);
insert into CreatedBy (ContID, EmployeeID) values (930, 60);
insert into CreatedBy (ContID, EmployeeID) values (931, 1);
insert into CreatedBy (ContID, EmployeeID) values (932, 11);
insert into CreatedBy (ContID, EmployeeID) values (933, 6);
insert into CreatedBy (ContID, EmployeeID) values (934, 33);
insert into CreatedBy (ContID, EmployeeID) values (935, 11);
insert into CreatedBy (ContID, EmployeeID) values (936, 17);
insert into CreatedBy (ContID, EmployeeID) values (937, 55);
insert into CreatedBy (ContID, EmployeeID) values (938, 5);
insert into CreatedBy (ContID, EmployeeID) values (939, 5);
insert into CreatedBy (ContID, EmployeeID) values (940, 9);
insert into CreatedBy (ContID, EmployeeID) values (941, 37);
insert into CreatedBy (ContID, EmployeeID) values (942, 63);
insert into CreatedBy (ContID, EmployeeID) values (943, 37);
insert into CreatedBy (ContID, EmployeeID) values (944, 2);
insert into CreatedBy (ContID, EmployeeID) values (945, 17);
insert into CreatedBy (ContID, EmployeeID) values (946, 5);
insert into CreatedBy (ContID, EmployeeID) values (947, 73);
insert into CreatedBy (ContID, EmployeeID) values (948, 37);
insert into CreatedBy (ContID, EmployeeID) values (949, 52);
insert into CreatedBy (ContID, EmployeeID) values (950, 56);
insert into CreatedBy (ContID, EmployeeID) values (951, 23);
insert into CreatedBy (ContID, EmployeeID) values (952, 52);
insert into CreatedBy (ContID, EmployeeID) values (953, 2);
insert into CreatedBy (ContID, EmployeeID) values (954, 5);
insert into CreatedBy (ContID, EmployeeID) values (955, 6);
insert into CreatedBy (ContID, EmployeeID) values (956, 2);
insert into CreatedBy (ContID, EmployeeID) values (957, 56);
insert into CreatedBy (ContID, EmployeeID) values (958, 73);
insert into CreatedBy (ContID, EmployeeID) values (959, 6);
insert into CreatedBy (ContID, EmployeeID) values (960, 23);
insert into CreatedBy (ContID, EmployeeID) values (961, 73);
insert into CreatedBy (ContID, EmployeeID) values (962, 16);
insert into CreatedBy (ContID, EmployeeID) values (963, 60);
insert into CreatedBy (ContID, EmployeeID) values (964, 24);
insert into CreatedBy (ContID, EmployeeID) values (965, 33);
insert into CreatedBy (ContID, EmployeeID) values (966, 60);
insert into CreatedBy (ContID, EmployeeID) values (967, 63);
insert into CreatedBy (ContID, EmployeeID) values (968, 16);
insert into CreatedBy (ContID, EmployeeID) values (969, 55);
insert into CreatedBy (ContID, EmployeeID) values (970, 5);
insert into CreatedBy (ContID, EmployeeID) values (971, 9);
insert into CreatedBy (ContID, EmployeeID) values (972, 55);
insert into CreatedBy (ContID, EmployeeID) values (973, 2);
insert into CreatedBy (ContID, EmployeeID) values (974, 27);
insert into CreatedBy (ContID, EmployeeID) values (975, 11);
insert into CreatedBy (ContID, EmployeeID) values (976, 6);
insert into CreatedBy (ContID, EmployeeID) values (977, 52);
insert into CreatedBy (ContID, EmployeeID) values (978, 23);
insert into CreatedBy (ContID, EmployeeID) values (979, 9);
insert into CreatedBy (ContID, EmployeeID) values (980, 1);
insert into CreatedBy (ContID, EmployeeID) values (981, 63);
insert into CreatedBy (ContID, EmployeeID) values (982, 56);
insert into CreatedBy (ContID, EmployeeID) values (983, 52);
insert into CreatedBy (ContID, EmployeeID) values (984, 9);
insert into CreatedBy (ContID, EmployeeID) values (985, 24);
insert into CreatedBy (ContID, EmployeeID) values (986, 5);
insert into CreatedBy (ContID, EmployeeID) values (987, 52);
insert into CreatedBy (ContID, EmployeeID) values (988, 37);
insert into CreatedBy (ContID, EmployeeID) values (989, 2);
insert into CreatedBy (ContID, EmployeeID) values (990, 2);
insert into CreatedBy (ContID, EmployeeID) values (991, 24);
insert into CreatedBy (ContID, EmployeeID) values (992, 5);
insert into CreatedBy (ContID, EmployeeID) values (993, 60);
insert into CreatedBy (ContID, EmployeeID) values (994, 5);
insert into CreatedBy (ContID, EmployeeID) values (995, 17);
insert into CreatedBy (ContID, EmployeeID) values (996, 24);
insert into CreatedBy (ContID, EmployeeID) values (997, 37);
insert into CreatedBy (ContID, EmployeeID) values (998, 9);
insert into CreatedBy (ContID, EmployeeID) values (999, 63);
insert into CreatedBy (ContID, EmployeeID) values (1000, 63);
insert into CreatedBy (ContID, EmployeeID) values (1002, 2);
insert into CreatedBy (ContID, EmployeeID) values (1003, 124);
insert into CreatedBy (ContID, EmployeeID) values (1004, 125);
insert into CreatedBy (ContID, EmployeeID) values (1005, 124);
insert into CreatedBy (ContID, EmployeeID) values (1006, 125);



