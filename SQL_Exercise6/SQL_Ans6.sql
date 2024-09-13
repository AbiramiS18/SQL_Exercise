-- 6.1
-- List all the scientists' names, their projects' names, 
-- and the hours worked by that scientist on each project, 
-- in alphabetical order of project name, then scientist name.
SELECT s.name Sname, p.name Pname,p.hours FROM Scientists S JOIN 
AssignedTo a on s.ssn = a.scientist JOIN
Projects p on p.code = a.project
ORDER BY p.name, s.name;

-- 6.2 Select the project names which are not assigned yet
SELECT name FROM Projects 
WHERE code NOT IN  (SELECT project FROM Assignedto);
