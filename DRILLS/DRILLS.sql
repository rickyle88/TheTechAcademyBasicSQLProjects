USE db_zooTest2
GO
--DRILL 1:
--Compose a SELECT statement that queries for the following information

--All information from the habitat table.
SELECT *
FROM tbl_habitat;

--DRILL 2:
--Compose a SELECT statement that queries for the following information:

-- Retrieve all names from the species_name column that have a species_order value of 3.
SELECT species_name, species_order
FROM tbl_species
WHERE species_order = 3;

--DRILL 3:
--Compose a SELECT statement that queries for the following information:

-- Retrieve only the nutrition_type from the nutrition table that have a nutrition_cost of 600.00 or less.
SELECT nutrition_type
FROM tbl_nutrition
WHERE nutrition_cost <=600;

--DRILL 4:
--Compose a SELECT statement that queries for the following information:

-- Retrieve all species_names with the nutrition_id between 2202 and 2206 from the nutrition table.
SELECT s.species_name
FROM tbl_nutrition n
INNER JOIN tbl_species s
ON n.nutrition_id = s.species_nutrition
WHERE n.nutrition_id BETWEEN 2202 AND 2206;

SELECT *
FROM tbl_nutrition;



--DRILL 5:
--Compose a SELECT statement that queries for the following information:

-- Retrieve all names within the species_name column using the alias "Species Name:" from the species table 
--and their corresponding nutrition_type under the alias "Nutrition Type:" from the nutrition table.
SELECT s.species_name AS "Species Name:", n.nutrition_type AS "Nutrition Type:"
FROM tbl_nutrition n
INNER JOIN tbl_species s
ON n.nutrition_id = s.species_nutrition;

--DRILL 6:
--Compose a SELECT statement that queries for the following information:

-- From the specialist table, retrieve the first and last name and contact number of those 
--that provide care for the penguins from the species table.
SELECT st.specialist_fname, st.specialist_lname
FROM tbl_species ss
INNER JOIN tbl_care c ON ss.species_care = c.care_id
INNER JOIN tbl_specialist st ON c.care_specialist = st.specialist_id
WHERE ss.species_name = 'penguin';

SELECT *
FROM tbl_species;

SELECT *
FROM tbl_specialist st;

SELECT *
FROM tbl_care c;


--DRILL 7:
--Creating your own tables: Build a select statement that queries for the following information:

-- Create a database with two tables. Assign a foreign key constraint on one table that shares related data with the primary key on the second table. Finally, create a statement that queries data from both tables.

CREATE DATABASE db_contact;

CREATE TABLE tbl_customer (
		customer_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		customer_fname VARCHAR(50) NOT NULL,
		customer_lname VARCHAR(50) NOT NULL
	);

INSERT INTO tbl_customer
		(customer_fname, customer_lname)
		VALUES 
		( 'mike','robin'),
		('mary', 'le'),
		('james','jeremy')
	;


CREATE TABLE tbl_contact (
	contact_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	contact_address VARCHAR(50) NOT NULL,
	contact_phone VARCHAR(50) NOT NULL,
	customer_id INT NOT NULL CONSTRAINT fk_customer_id FOREIGN KEY REFERENCES tbl_customer(customer_id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO tbl_contact
		(contact_address, contact_phone, customer_id)
		VALUES 
		( '123 abc','7147631232',3),
		('321 des', '7655431232',2),
		('432 seq','7654321232',1)
	;

SELECT *
FROM tbl_customer cu
INNER JOIN tbl_contact co
ON cu.customer_id = co.customer_id;