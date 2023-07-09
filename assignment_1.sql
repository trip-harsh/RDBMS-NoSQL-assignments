-- Using MySQL as the database

-- Question 1:-

CREATE TABLE regions(
  region_id int PRIMARY KEY,
  region_name varchar(255)
);
  
CREATE TABLE countries(
  country_id int PRIMARY KEY,
  country_name varchar(255),
  region_id int,
  FOREIGN KEY(region_id) REFERENCES regions(region_id)
);
  
  CREATE TABLE locations(
  location_id int PRIMARY key,
  street_address varchar(255),
  postal_code varchar(10),
  city varchar(255),
  state_province varchar(255),
  country_id int,
  FOREIGN key(country_id) REFERENCES countries(country_id)
);
  
CREATE TABLE departments(
  department_id int PRIMARY key,
  department_name varchar(255),
  location_id int,
  FOREIGN KEY(location_id) REFERENCES locations(location_id)
);
  
  CREATE TABLE jobs (
  job_id int PRIMARY KEY,
  job_title varchar(255),
  min_salary float check(min_salary > 1000),
  max_salary float
);
  
  CREATE TABLE employees (
  employee_id int PRIMARY KEY,
  first_name varchar(255) NOT NULL,
  last_name varchar(255) NOT NULL,
  email varchar(255),
  hire_date date,
  job_id int, 
  salary float,
  manager_id int,
  department_id int,
  FOREIGN KEY(job_id) REFERENCES jobs(job_id),
  FOREIGN KEY(manager_id) REFERENCES employees(employee_id),
  FOREIGN KEY(department_id) REFERENCES departments(department_id)
);
  
CREATE TABLE dependents(
  dependent_id int PRIMARY KEY,
  first_name varchar(255) NOT NULL,
  last_name varchar(255) NOT NULL,
  relationship varchar(255),
  employee_id int,
  FOREIGN KEY(employee_id) REFERENCES employees(employee_id)
);

-- Question 2:-

INSERT INTO jobs 
VALUES 
(1, "Software Developer", 700000, 2000000),
(2, "Web Developer", 500000, 1500000),
(3, "Cloud Developer", 800000, 2000000),
(4, "AI Developer", 700000, 2000000),
(5, "Network Architect", 1200000, 2200000);


INSERT INTO regions 
VALUES 
  (1, "Asia"),
  (2, "Euorpe"),
  (3, "North America"),
  (4, "Africa"),
  (5, "South America");


INSERT INTO countries 
VALUES 
  (1, "India", 1),
  (2, "China", 1),
  (3, "America", 3),
  (4, "Spain", 5),
  (5, "Belgium", 2);


INSERT INTO locations 
VALUES 
  (1, "abc street", "12345", "Bhopal", "Madhya Pradesh", 1),
  (2, "def street", "35675", "Cicero", "Illinois(IL)", 3),
  (3, "ghi street", "43234", "Madrid", "Spain", 4),
  (4, "jkl street", "34353", "Barcelona", "Spain", 4),
  (5, "mno street", "46323", "Sevilla", "Spain", 4);


INSERT INTO departments 
VALUES 
  (1, "IT", 1),
  (2, "IT", 2),
  (3, "IT", 3),
  (4, "HR", 1),
  (5, "HR", 2);


INSERT INTO employees 
VALUES 
  (1, "Harsh", "Tripathi", "abc@gmail.com", "2023-05-15", 5, 70000, 1, 3),
  (2, "Saket", "Patel", "bcd@gmail.com", "2022-05-15", 1, 40000, 1, 3),
  (3, "Shubh", "Agrawal", "cde@gmail.com", "2021-05-15", 1, 55000, 2, 3),
  (4, "Vineet", "Tiwari", "efg@gmail.com", "2022-05-15", 2, 45000, 1, 3),
  (5, "Diksha", "Sharma", "hij@gmail.com", "2020-05-15", 1, 43000, 1, 3),
  (6, "Sourabh", "Verma", "klm@gmail.com", "2022-06-15", 4, 34000, 1, 4),
  (7, "Priya", "Patel", "nop@gmail.com", "2021-03-15", 3, 35000, 1, 4),
  (8, "Somya", "Jain", "qrs@gmail.com", "2020-04-15", 2, 45000, 1, 4),
  (9, "Palak", "Yadav", "tuv@gmail.com", "2022-05-15", 1, 34000, 1, 2),
  (10, "Lokesh", "Chaudary", "wxy@gmail.com", "2021-08-15", 4, 1500000, 1, 3);


INSERT INTO dependents 
VALUES 
  (1, "Rushil", "Tripathi", "Brother", 1),
  (2, "Jim", "Moriarty", "Brother", 2),
  (3, "Jim", "Moriarty", "Brother", 3),
  (4, "Jim", "Moriarty", "Brother", 4),
  (5, "Jim", "Moriarty", "Brother", 5);

-- Question 3:-

-- (A)
ALTER TABLE departments ADD COLUMN manager_name varchar(255);

-- (B)
ALTER TABLE jobs DROP COLUMN max_salary;

-- (C)
ALTER TABLE locations RENAME postal_code TO pincode;

-- Question 4:-
-- Kept the constrints in question 1 already.


