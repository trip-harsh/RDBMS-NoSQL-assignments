-- Using MySQL as the database


-- Q1

SELECT first_name, last_name, email, salary, department_name, pincode, city FROM Employees e
JOIN (
  	SELECT * FROM Departments d
	JOIN Locations l ON d.location_id = l.location_id
) r ON e.department_id = r.department_id;


-- Q2

SELECT d.department_name, l.state_province, l.street_address FROM Departments d
JOIN Locations l ON d.location_id = l.location_id
WHERE l.state_province = "Jammu Kashmir" or l.state_province = "Jharkhand";

-- Q3

SELECT j.job_title, COUNT(e.employee_id) AS employee_count, AVG(e.salary) AS average_salary
FROM Jobs j
JOIN Employees e ON j.job_id = e.job_id
GROUP BY j.job_id, j.job_title
HAVING AVG(e.salary) > 10000;

-- Q4

SELECT first_name, last_name
FROM dependents
UNION ALL
SELECT first_name, last_name
FROM employees
ORDER BY last_name DESC;

-- Q5

SELECT e1.first_name name, e2.first_name manager FROM employees e1
JOIN employees e2 ON e1.manager_id = e2.employee_id;

-- Q6

SELECT d.department_name, l.state_province, COUNT(e.employee_id) e_count FROM Departments d
JOIN Employees e ON e.department_id = d.department_id
JOIN Locations l on d.location_id = l.location_id
WHERE e.salary > 50000 AND l.state_province IN ("New York", "California", "Spain")
GROUP BY d.department_id, l.state_province
HAVING COUNT(e.employee_id) > 5;

-- Q7

SELECT e.first_name FROM Employees e
JOIN Dependents d ON d.employee_id = e.employee_id
JOIN Jobs j ON j.job_id = e.job_id
WHERE j.job_title LIKE '%Manager%';

--Q8

ALTER TABLE
   Dependents
ADD
   COLUMN city VARCHAR(255);

SELECT
   e.employee_id,
   e.first_name,
   e.last_name,
   d.department_name,
   l.city,
   e.salary,
   j.job_title
FROM
   Employees e
   JOIN Departments d ON e.department_id = d.department_id
   JOIN Locations l ON d.location_id = l.location_id
   JOIN Dependents de ON e.employee_id = de.employee_id
   JOIN Jobs j ON e.job_id = j.job_id
WHERE
   e.hire_date > CURRENT_DATE - INTERVAL 3 YEAR
   AND de.city <> l.city
   AND e.salary > (
      SELECT
         AVG(salary)
      FROM
         Employees
      WHERE
         job_id = j.job_id
   )
   AND j.job_title LIKE '%Director%'
ORDER BY
   d.department_name;
