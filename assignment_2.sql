-- Using MySQL as the database

-- Q1
SELECT * FROM Employees WHERE last_name LIKE "sah%";

-- Q2
SELECT * FROM Employees 
WHERE hire_date BETWEEN '2021-06-01' AND '2022-02-15'
LIMIT 3,10;

-- Q3
SELECT DISTINCT salary AS `Top 5 salaries` FROM Employees 
ORDER BY salary DESC;

-- Q4
SELECT first_name, last_name, email FROM Employees 
WHERE salary >= 25000 and salary <= 45000;

-- Q5
SELECT first_name, manager_id, salary FROM Employees
WHERE department_id IS 101
ORDER BY salary;

-- Q6
SELECT first_name, last_name from Employees
WHERE first_name LIKE "A%"
OR last_name LIKE "_TH%";
