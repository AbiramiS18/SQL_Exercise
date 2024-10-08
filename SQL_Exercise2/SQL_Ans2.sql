-- 2.1 Select the last name of all employees.
SELECT Lastname FROM Employees;

-- 2.2 Select the last name of all employees, without duplicates.
SELECT DISTINCT Lastname FROM Employees;

-- 2.3 Select all the data of employees whose last name is "Smith".
SELECT * FROM Employees
WHERE Lastname = "Smith"; 

-- 2.4 Select all the data of employees whose last name is "Smith" or "Doe".
SELECT * FROM Employees
WHERE Lastname = "Smith" or Lastname = "Doe";

-- 2.5 Select all the data of employees that work in department 14.
SELECT * FROM Employees
WHERE Department = 14;

-- 2.6 Select all the data of employees that work in department 37 or department 77.
SELECT * FROM Employees
WHERE Department = 37 OR Department = 77;

-- 2.7 Select all the data of employees whose last name begins with an "S".
SELECT * FROM Employees
WHERE Lastname REGEXP "^S";

-- 2.8 Select the sum of all the departments' budgets.
SELECT SUM(d.budget) FROM Employees E JOIN
Departments d on e.department = d.code
GROUP BY e.Department;

-- 2.9 Select the number of employees in each department (you only need to show the department code and the number of employees).
SELECT Department, COUNT(*) FROM Employees
GROUP BY Department;

-- 2.10 Select all the data of employees, including each employee's department's data.
SELECT * FROM Employees E JOIN 
Departments d on e.department = d.code;

-- 2.11 Select the name and last name of each employee, along with the name and budget of the employee's department.
SELECT e.name, e.lastname, d.name, d.budget FROM Employees e JOIN
Departments d on e.department = d.code;

-- 2.12 Select the name and last name of employees working for departments with a budget greater than $60,000.
SELECT e.name, e.lastname  FROM Employees e JOIN
Departments d on e.department = d.code
WHERE d.budget > 65000;

-- 2.13 Select the departments with a budget larger than the average budget of all the departments.
SELECT distinct d.name FROM Employees e JOIN 
Departments d ON e.department = d.code
WHERE d.budget > (SELECT avg(budget) FROM Departments);

-- 2.14 Select the names of departments with more than two employees.
SELECT d.name FROM Departments d JOIN 
Employees e ON d.code = e.department
GROUP BY e.department HAVING count(e.department)>2;

-- 2.15 Select the name and last name of employees working for departments with second lowest budget.
SELECT e.Name, e.LastName
FROM Employees e 
WHERE e.Department = (
       SELECT sub.Code 
       FROM (SELECT * FROM Departments d ORDER BY d.budget LIMIT 2) sub 
       ORDER BY budget DESC LIMIT 1);

-- 2.16
-- Add a new department called "Quality Assurance", with a budget of $40,000 and departmental code 11. 
-- Add an employee called "Mary Moore" in that department, with SSN 847-21-9811.
INSERT INTO Departments(code,name,budget) VALUES (11,"Quality Assurance", 40000);
INSERT INTO Employees (ssn,name,lastname,department) VALUES (847219811,"Mary","Moore",11);

-- 2.17 Reduce the budget of all departments by 10%.
UPDATE Departments
SET Budget = 0.9*budget;

-- 2.18 Reassign all employees from the Research department (code 77) to the IT department (code 14).
UPDATE Employees
SET Department = 14 WHERE Department = 77; 

-- 2.19 Delete from the table all employees in the IT department (code 14).
DELETE FROM Employees WHERE Department = 14;
 
-- 2.20 Delete from the table all employees who work in departments with a budget greater than or equal to $60,000.
DELETE FROM Employees
WHERE Department IN (Select code FROM Departments WHERE Budget>=60000); 

-- 2.21 Delete from the table all employees.
DELETE FROM employees; 
