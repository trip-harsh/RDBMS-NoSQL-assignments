-- Using MySQL as the database

-- Q1

SELECT d.department_name
FROM Departments d
JOIN Employees e ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING MIN(e.salary) < 10000;

-- Q2

SELECT country_name FROM Countries
WHERE country_name NOT IN
(
  SELECT DISTINCT(c.country_name) FROM Employees e 
  JOIN Departments d ON d.department_id = e.department_id
  JOIN Locations l ON l.location_id = d.location_id
  JOIN Countries c ON l.country_id = c.country_id
);

-- Q3

SELECT job_title FROM
(
	SELECT d.department_id, d.department_name, COUNT(e.employee_id) e_count, e.job_id, 		j.job_title	
	FROM Departments d, Employees e, Jobs j
	WHERE d.department_id = e.department_id AND j.job_id = e.job_id
	GROUP BY d.department_id
) R WHERE R.e_count >= 2;

-- Q4

SELECT c.country_name FROM Countries c
WHERE c.country_id IN
(
	SELECT country_id FROM Locations l
  WHERE l.city LIKE "a%"
);

-- Q5

SELECT department_name FROM Departments d
WHERE d.location_id IN
(
	SELECT l.location_id FROM Locations l
  WHERE l.city IS NULL
);
