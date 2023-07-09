-- using mysql as database
 
-- Question 1


ALTER TABLE Dependents
ADD COLUMN full_name VARCHAR(255);

DELIMITER $$ 

CREATE TRIGGER add_full_name BEFORE
INSERT ON Dependents FOR EACH ROW 
BEGIN
  SET NEW.full_name = CONCAT(NEW.first_name, ' ', NEW.last_name);

END; $$ 

DELIMITER ;

-- Question 2

DELIMITER $$ 

CREATE TRIGGER on_insert_log
AFTER
    INSERT ON Locations FOR EACH ROW BEGIN
INSERT INTO
    locations_info (
        location_id,
        operation,
        old_value,
        new_value
    )
VALUES
    (
        NEW.location_id,
        CASE
            WHEN @old_value IS NULL THEN 'INSERT'
            WHEN @new_value IS NULL THEN 'DELETE'
            ELSE 'UPDATE'
        END,
        COALESCE(@old_value, NULL),
        COALESCE(@new_value, NULL)
    );

SET
    @old_value = NEW;

SET
    @new_value = NULL;

END; $$

DELIMITER ;

DELIMITER $$ 

CREATE TRIGGER on_delete_log
AFTER
    DELETE ON Locations FOR EACH ROW BEGIN
INSERT INTO
    locations_info (
        location_id,
        operation,
        old_value,
        new_value
    )
VALUES
    (
        OLD.location_id,
        'DELETE',
        OLD.location_id,
        NULL
    );

END; $$

DELIMITER ; 

DELIMITER $$ 

CREATE TRIGGER on_update_log
AFTER
UPDATE
    ON Locations FOR EACH ROW BEGIN
INSERT INTO
    locations_info (
        location_id,
        operation,
        old_value,
        new_value
    )
VALUES
    (
        NEW.location_id,
        'UPDATE',
        OLD.location_id,
        NEW.location_id
    );

END; $$

DELIMITER ;

-- Question 3

CREATE VIEW employee_information AS
SELECT
   e.first_name,
   e.last_name,
   e.salary,
   d.department_name,
   l.city,
   l.pincode
FROM
   Employees e
   INNER JOIN Departments d ON e.department_id = d.department_id
   INNER JOIN Locations l ON d.location_id = l.location_id
WHERE
   length(pincode) < 5;



-- Question 4

--ACID is an acronym that stands for Atomicity, Consistency, Isolation, and Durability. These are fundamental properties that ensure reliable and transactional behavior in database management systems (DBMS). Let's explore each of these properties:

-- 1. Atomicity:
-- Atomicity guarantees that a transaction is treated as a single, indivisible unit of work. Either all the operations within a transaction are successfully completed, or none of them are applied. If any part of a transaction fails, the entire transaction is rolled back, and the database remains unchanged. Atomicity ensures that the database is always in a consistent state.

-- 2. Consistency:
-- Consistency ensures that a transaction brings the database from one consistent state to another. It enforces the integrity constraints defined on the database, ensuring that the data meets certain rules or conditions. If a transaction violates any of the integrity constraints, it is rolled back, and the database remains in its original consistent state.

-- 3. Isolation:
-- Isolation ensures that concurrent transactions do not interfere with each other, providing the illusion that each transaction is executed in isolation. Concurrently executing transactions should not be aware of other transactions executing concurrently. Each transaction should see the database as if it were the only one accessing it, preventing any conflicts or anomalies caused by concurrent access.

-- 4. Durability:
-- Durability guarantees that once a transaction is committed, its changes are permanent and will survive any subsequent failures, such as power outages or system crashes. The changes made by committed transactions are stored in a persistent manner and will not be lost.

-- The ACID properties ensure data integrity, consistency, and reliability in a DBMS, providing a robust and dependable environment for managing transactions. These properties are essential for applications that require reliable data processing, such as financial systems, e-commerce platforms, and other mission-critical systems.

-- It's important to note that ensuring ACID properties may involve some performance overhead, as maintaining isolation and durability can require additional system resources. Therefore, it's necessary to strike a balance between ensuring ACID properties and meeting the performance requirements of the application.
  


-- Question 5

-- The index is build from the Occupation field.
-- Explanation:

-- The index field associated with the values 1, 3, 2, 5 and 4 is the Occupation field because after 
-- sorting the Occupational field lexicographically will give the sequence 1,3,2,5,4.
