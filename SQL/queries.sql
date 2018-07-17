

/* See Contracts*/
Select *
From Contracts;

/* See Teams */
Select *
From Teams;

/* See Employees */
Select *
From Employees;


/*QUERIES:*/

/*1) Insert a new contract with ACV of $90,000, On premises services, based in Montreal, with an initial amount of $10,000 given by "GSC Corporations"*/
INSERT INTO Contracts (CompanyName, City, Province, AVC, IV, Service)
VALUES ('GSC Corporations', 'Montreal', 'Quebec', 90000, 10000, 'On-Premises');

/*2) Insert details of a manager "Juan Vasquez" in the database, who is managing a team of 10 developers and responsible for "On-premises" projects.*/
INSERT INTO Employees (Name, LName, Department, IsManager)
VALUES ('Juan', 'Vasquez', 'Development', 1); /*Creating the employee*/

INSERT INTO Teams (ManagerID, ServiceType)
SELECT Employees.ID, 'On-premises'
FROM Employees
WHERE Employees.Name = 'Juan' AND Employees.LName = 'Vasquez' AND Employees.IsManager = 1; /*Creating an on-premises team with Juan's ID as manager*/

UPDATE Employees
SET TeamID = (SELECT Teams.ID FROM Teams WHERE Teams.ManagerID = Employees.ID)
WHERE Employees.Name = 'Juan' AND Employees.LName = 'Vasquez' AND Employees.IsManager = 1; /*Updating Juan's employee info to list the Team's ID*/

UPDATE Contracts
SET TeamID = (SELECT Employees.TeamID FROM Employees WHERE Employees.Name = 'Juan' AND Employees.LName = 'Vasquez' AND Employees.IsManager = 1)
WHERE Contracts.Service = 'On-Premises'; /*Making Juan's team in charge of all On-premises contracts*/

/*Bonus: create 10 users to be in his team*/
INSERT INTO Employees (Name, LName, Department, IsManager,  TeamID) SELECT 'John', 'Crichton', 'Development', 0, Teams.ID FROM Teams, Employees WHERE Teams.ManagerID = Employees.ID AND Employees.Name = 'Juan' AND Employees.LName = 'Vasquez';
INSERT INTO Employees (Name, LName, Department, IsManager,  TeamID) SELECT 'Aeryn', 'Sun', 'Development', 0, Teams.ID FROM Teams, Employees WHERE Teams.ManagerID = Employees.ID AND Employees.Name = 'Juan' AND Employees.LName = 'Vasquez';
INSERT INTO Employees (Name, LName, Department, IsManager,  TeamID) SELECT 'Bialar', 'Crais', 'Development', 0, Teams.ID FROM Teams, Employees WHERE Teams.ManagerID = Employees.ID AND Employees.Name = 'Juan' AND Employees.LName = 'Vasquez';
INSERT INTO Employees (Name, LName, Department, IsManager,  TeamID) SELECT 'Chiana', '--', 'Development', 0, Teams.ID FROM Teams, Employees WHERE Teams.ManagerID = Employees.ID AND Employees.Name = 'Juan' AND Employees.LName = 'Vasquez';
INSERT INTO Employees (Name, LName, Department, IsManager,  TeamID) SELECT 'Ka', 'D''Argo', 'Development', 0, Teams.ID FROM Teams, Employees WHERE Teams.ManagerID = Employees.ID AND Employees.Name = 'Juan' AND Employees.LName = 'Vasquez';
INSERT INTO Employees (Name, LName, Department, IsManager,  TeamID) SELECT 'Pilot', '--', 'Development', 0, Teams.ID FROM Teams, Employees WHERE Teams.ManagerID = Employees.ID AND Employees.Name = 'Juan' AND Employees.LName = 'Vasquez';
INSERT INTO Employees (Name, LName, Department, IsManager,  TeamID) SELECT 'Dominar', 'Rygel', 'Development', 0, Teams.ID FROM Teams, Employees WHERE Teams.ManagerID = Employees.ID AND Employees.Name = 'Juan' AND Employees.LName = 'Vasquez';
INSERT INTO Employees (Name, LName, Department, IsManager,  TeamID) SELECT 'Scorpius', '--', 'Development', 0, Teams.ID FROM Teams, Employees WHERE Teams.ManagerID = Employees.ID AND Employees.Name = 'Juan' AND Employees.LName = 'Vasquez';
INSERT INTO Employees (Name, LName, Department, IsManager,  TeamID) SELECT 'Stark', '--', 'Development', 0, Teams.ID FROM Teams, Employees WHERE Teams.ManagerID = Employees.ID AND Employees.Name = 'Juan' AND Employees.LName = 'Vasquez';
INSERT INTO Employees (Name, LName, Department, IsManager,  TeamID) SELECT 'Zhaan', '--', 'Development', 0, Teams.ID FROM Teams, Employees WHERE Teams.ManagerID = Employees.ID AND Employees.Name = 'Juan' AND Employees.LName = 'Vasquez';


/*3) Provide a list of all managers supervising projects with more than $80,000 ACV*/

SELECT DISTINCT Employees.ID, Employees.Name, Employees.Lname
FROM Contracts, Employees, Teams
WHERE Contracts.AVC > 80000 AND Contracts.TeamID = Teams.ID AND Teams.ManagerID = Employees.ID AND Employees.IsManager = 1;

/*4) Give a list of all the employees who are working on contracts with ACV of at least $85,000*/

SELECT DISTINCT Employees.ID, Employees.Name, Employees.Lname
FROM Employees, Contracts
WHERE Contracts.AVC >= 85000 AND Contracts.TeamID = Employees.TeamID;

/*5) List of all the contracts managed by "Juan Vasquez"*/

SELECT Contracts.*
FROM Contracts, Employees, Teams
WHERE Employees.IsManager = 1 AND Employees.Name = 'Juan' AND Employees.Lname = 'Vasquez' AND Teams.ManagerID = Employees.ID AND Contracts.TeamID = Teams.ID;









