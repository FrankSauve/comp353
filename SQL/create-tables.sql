CREATE TABLE Contract
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
EmployeeID int, 
PRIMARY KEY (ID)
);


CREATE TABLE Employees 
(
EmployeeID int NOT NULL AUTO_INCREMENT, 
Name char(255), 
Lname char(255),
Department char(50), 
Manager bit, 
teamID int, 
TypeOfContracts char(50),  
PRIMARY KEY (EmployeeID)
);
