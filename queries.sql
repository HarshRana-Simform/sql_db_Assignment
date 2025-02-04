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

-- 1. Write a query to fetch the number of employees working in the department ‘Admin’
SELECT department,count(empid) AS "No. of Employees" FROM EmployeeInfo 
GROUP BY department
HAVING department='Admin';

-- 2. Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table.
SELECT LEFT(EmpLname, 4) AS "First_Four_Char" from EmployeeInfo;

SELECT SUBSTR(EmpLname,1,4) AS "First_Four_Char" from EmployeeInfo;

-- 3. Write q query to find all the employees whose salary is between 50000 to 100000.
SELECT CONCAT_WS(' ',empfname,emplname) AS "Employee Name", salary from employeeinfo i 
INNER JOIN employeeposition p
ON i.empid=p.empid
WHERE p.salary BETWEEN 50000 AND 100000; 

-- 4. Write a query to find the names of employees that begin with ‘S’
SELECT Empfname FROM EmployeeInfo
WHERE Empfname LIKE 'S%';

-- 5. Write a query to fetch top N records order by salary. (ex. top 5 records)
SELECT ep.empid,ei.empfname,ep.salary FROM EmployeePosition ep
INNER JOIN EmployeeInfo ei
ON ep.empid = ei.empid
ORDER BY ep.salary DESC
LIMIT 5;

-- 6. Write a query to fetch details of all employees excluding the employees with first names, 
-- “Sanjay” and “Sonia” from the EmployeeInfo table.
SELECT * FROM EmployeeInfo
WHERE empfname NOT IN ('Sanjay','Sonia');

-- 7. Write a query to fetch the department-wise count of employees sorted by department’s 
-- count in ascending order.
SELECT department,COUNT(empid) AS "No. of Employees" FROM EmployeeInfo
GROUP BY department
ORDER BY COUNT(empid) ASC;

-- 8. Create indexing for any particular field and show the difference in data fetching 
-- before and after indexing

--Before Indexing fetching data for a particular lastname
SELECT * FROM EmployeeInfo
WHERE emplname = 'Kapoor';

--Creating index on the emplname
CREATE INDEX lname_idx ON EmployeeInfo(emplname);

--After Indexing fetching data for a particular lastname
SELECT * FROM EmployeeInfo
WHERE emplname = 'Kapoor';
