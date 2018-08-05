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
