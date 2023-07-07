-- Using MySQL as the database

-- Q1
SELECT Departments.department_name, SUM(Employees.salary) AS Total_Salary from Departments 
JOIN Employees ON Departments.department_id = Employees.department_id
GROUP BY Departments.department_id, Departments.department_name
ORDER BY Total_Salary ASC;

-- Q2

SELECT d.department_name, COUNT(e.employee_id) AS total_employees, SUM(e.salary) AS total_salary
FROM Departments d
JOIN Employees e ON d.department_id = e.department_id
GROUP BY d.department_name;

-- Q3

SELECT d.department_name, MAX(e.salary) AS max_salary
FROM Departments d
JOIN Employees e ON d.department_id = e.department_id
GROUP BY d.department_name
ORDER BY max_salary ASC;

-- Q4

SELECT department_name FROM
(
  SELECT d.department_name, AVG(e.salary) AS Average_Salary
  FROM Departments d
  JOIN Employees e ON d.department_id = e.department_id
  GROUP BY d.department_name
) WHERE Average_Salary > 60000;


-- Q5

SELECT department_name FROM
(
  SELECT d.department_name, COUNT(e.employee_id) AS total_employees
  FROM Departments d
  JOIN Employees e ON d.department_id = e.department_id
  GROUP BY d.department_name
) WHERE total_employees > 1;

-- Q6

SELECT d.department_name, 
	CASE
    	WHEN COUNT(e.employee_id) = 1 THEN "One Candidate"
        ELSE "Multiple Candidates"
    END AS AssignedTo
FROM Departments d
JOIN Employees e ON e.department_id = d.department_id
GROUP BY d.department_name;
