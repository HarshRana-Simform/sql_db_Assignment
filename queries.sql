CREATE TABLE EmployeeInfo (
	EmpID INTEGER PRIMARY KEY,
	EmpFname VARCHAR(100) NOT NULL,
	EmpLname VARCHAR(100) NOT NULL,
	Department VARCHAR(20),
	Project VARCHAR(10),
	Address VARCHAR(50) NOT NULL,
	DOB DATE NOT NULL,
	Gender VARCHAR(1)
);

CREATE TABLE EmployeePosition (
	EmpID INTEGER PRIMARY KEY,
	EmpPosition VARCHAR(100),
	DateOfJoining DATE DEFAULT CURRENT_DATE,
	Salary INTEGER,
	FOREIGN KEY (EmpID) REFERENCES EmployeeInfo(EmpID)
);


INSERT INTO EmployeeInfo (EmpID,EmpFname,EmpLname,Department,Project,Address,DOB,Gender)
VALUES (1,'Sanjay','Mehra','HR','P1','Hyderabad(HYD)','1976/12/01','M'),
(2,'Ananya','Mishra','Admin','P2','Delhi(DEL)','1968/05/02','F'),
(3,'Rohan','Diwan','Account','P3','Mumbai(BOM)','1980/01/01','M'),
(4,'Sonia','Kulkarni','HR','P1','Hyderabad(HYD)','1992/05/02','F'),
(5,'Ankit','Kapoor','Admin','P2','Delhi(DEL)','1994/07/03','M');

INSERT INTO EmployeePosition (EmpID, EmpPosition, DateOfJoining, Salary)
VALUES (1,'Manager','2022/05/01',500000),
(2,'Executive','2022/05/02',75000),
(3,'Manager','2022/05/01',90000),
(4,'Lead','2022/05/02',85000),
(5,'Executive','2022/05/01',300000);

SELECT * FROM EmployeeInfo;
SELECT * FROM EmployeePosition;
