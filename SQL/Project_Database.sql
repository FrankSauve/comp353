use comp353_Project_db;
CREATE TABLE `Responsible` (
  `RespoID` int not null auto_increment,
  `fName` varchar(50),
  `mName` varchar(50),
  `lName` varchar(50),
  `contact` varchar(50),
  `Email` varchar(255),
  PRIMARY KEY (`RespoID`)
);

CREATE TABLE `Company` (
  CompID int not null auto_increment,
  CompName char(250),
  PostalCode char(50),
  PRIMARY KEY (`CompID`),
  foreign key (PostalCode) references PostalCode (PostalCode)
);

CREATE TABLE `Hours` (
  `ID` int not null auto_increment,
  `Date` date,
  `EmployeeID` int,
  `contID` int,
  `hours` double,
  PRIMARY KEY (`ID`),
  foreign key (`EmployeeID`) references Employees (EmployeeID),
  foreign key (`contID`) references Contracts (ContID)
);

CREATE TABLE `TypeOfContracts` (
  `Category` char(10),
  `St` int,
  `nd` int,
  `Rd` int,
  `Th` int,
  PRIMARY KEY (`Category`)
);

CREATE TABLE `Contracts` (
  `ContID` int NOT NULL AUTO_INCREMENT,
  `CompID` int,
  `RespoID` int,
  `AVC` double,
  `IV` double,
  `StartDate` date,
  `Category` char(10),
  `TypeOfService` char(50),
  `FirstDeliv` date,
  `SecondDeliv` date,
  `ThirdDeliv` date,
  `FourthDeliv` date,
  `Rating` int,
  PRIMARY KEY (`ContID`),
  foreign key (`CompID`) references Company (CompID),
  foreign key (`RespoID`) references Responsible (RespoID),
  foreign key (`Category`) references TypeOfContracts (Category)
);

CREATE TABLE `Teams` (
  `TeamID` int not null auto_increment,
  `ManagerID` int,
  PRIMARY KEY (`TeamID`),
  foreign key (`ManagerID`) references Employees (EmployeeID)
);

CREATE TABLE `Employees` (
  `EmployeeID` int not null auto_increment,
  `fName` varchar(50),
  `lName` varchar(50),
  `InsuranceID` int,
  `EDID` int,
  PRIMARY KEY (`EmployeeID`),
  foreign key (`InsuranceID`) references Insurance (InsuranceID),
  foreign key (`EDID`) references EmployeeType (EDID)
);

CREATE TABLE `Users` (
  `username` char(255) not null,
  `Password` varchar(255) not null,
  `userType` char(50),
  PRIMARY KEY (`username`)
);

CREATE TABLE `EmployeeType` (
  `EDID` int not null auto_increment,
  `Descript` Char(50),
  PRIMARY KEY (`EDID`)
);

CREATE TABLE `Prefernces` (
  `EmployeeID` int,
  `Category` int,
  foreign key (`EmployeeID`) references Employees (EmployeeID),
  foreign key (`Category`) references TypeOfContracts (Category)
);

CREATE TABLE `Cites` (
  `CPID` int not null auto_increment,
  `City` varchar(250),
  `Province` varchar(250),
  PRIMARY KEY (`CPID`)
);

CREATE TABLE `PostalCode` (
  `PostalCode` Char(50),
  `CPID` int,
  PRIMARY KEY (`PostalCode`),
  foreign key (`CPID`) references Cites (CPID)
);

CREATE TABLE `EmployeeHistory` (
  `ID` int not null auto_increment,
  `EmployeeID` int,
  `teamID` int,
  `contID` int,
  `isActive` int,
  PRIMARY KEY (`ID`),
  foreign key (`EmployeeID`) references Employees (EmployeeID),
  foreign key (`teamID`) references Teams (teamID),
  foreign key (`contID`) references Contracts (contID)
);

CREATE TABLE `Insurance` (
  `InsuranceID` int not null auto_increment,
  `TypeDescript` varchar(250),
  `Covrage` double,
  PRIMARY KEY (`InsuranceID`)
);

