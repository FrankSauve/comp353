CREATE TABLE Contracts
(
ID int NOT NULL AUTO_INCREMENT,
CompanyName char(255),
RespoName char(255),
RespoLName char(255),
RespoMName char(255),
ContactNum varchar(50),
Email varchar(255),
City varchar(255),
Province varchar(255),
PostalCode varchar(50),
AVC double,
IV double,
StartDate Date,
Service char(100),
Type char(50),
TeamID int,
PRIMARY KEY (ID)
);

CREATE TABLE Employees 
(
ID int NOT NULL AUTO_INCREMENT,
LName char(255),
Name char(255),
Department char(50),
IsManager bit,
TeamID int,
PRIMARY KEY (ID)
);

CREATE TABLE Teams
(
ID int NOT NULL AUTO_INCREMENT,
ManagerID int,
ServiceType varchar(255),
PRIMARY KEY (ID)
)
