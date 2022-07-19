CREATE DATABASE Patient_Diagnosis;

USE Patient_Diagnosis;

-- 1. Creating a table and setting data types for each column
CREATE TABLE patient_info (
Date Date NOT NULL,
patient_id varchar(45) NOT NULL,
patient_name varchar(45) NOT NULL,
age int NOT NULL,
weight int NOT NULL,
gender varchar (45) NOT NULL,
location varchar(45) NOT NULL,
phone_number int NOT NULL,
disease varchar(45) NOT NULL,
doctor_name varchar(45) NOT NULL,
doctor_id int NOT NULL,
PRIMARY KEY (patient_id) );

-- 2. Inserting values into a table
INSERT INTO patient_info (date, patient_id, patient_name, age, weight, gender, location, phone_number, disease, doctor_name, doctor_id)
	VALUES ('2019-06-15', 'AP2021', 'Sarath', '67', '76', 'Male', 'Chennai', '5462829', 'Cardiac', 'Mohan', '21');
    
/* Data imported using wizard tool */
    
-- 3. Query to display total number of patients in the table
SELECT COUNT(*) AS total_number_of_patients FROM patient_info;

-- 4. Query to display the oldest patient in the list
SELECT patient_id, patient_name, gender, disease, max(age) AS maximum_age FROM patient_info;

-- 5. Query to display patient id and patient name with the current date:
SELECT patient_id, patient_name, NOW() AS currentdate FROM patient_info;

-- 6. Query to display old patient name and new patient name in uppercase:
SELECT patient_name, UPPER(patient_name) AS new_patient_name FROM patient_info;

-- 7. Query to display patient names along with the numner of characters in their names:
SELECT patient_names, length(patient_name) as number_of_characters FROM patient_info;

-- 8. Query to display patient name and their gender as either 'M' or 'F':
SELECT patient_name, MID(gender,1,1) AS Gender FROM patient_info;

-- 9. Query to combine patient name and doctors name in a new column:
SELECT patient_name, doctor_name, CONCAT(patient_name, doctor_name) AS patient_doctor_name FROM patient_info;

-- 10. Query to display patient's name with their age and the logarithmic value of their age:
SELECT age, LOG(age) AS log_age FROM patient_info;

-- 11. Query to extract the year for a given date and place in a seperate column:
SELECT *, YEAR(date) AS Year FROM patient_info;

-- 12. Query to return NULL if patient and doctor name is similar IF NOT then return patient's naem:
SELECT NULLIF(patient_name,doctor_name) FROM patient_info; 

-- 13. Query to display patient's age and return YES or NO:
SELECT age, IF(age>40, 'Yes','No') AS Above40 FROM patient_info;

-- 14. Query to display duplicate entries in the doctor name column:
SELECT doctor_name, COUNT(*) occurences FROM patient_info
GROUP BY doctor_name HAVING COUNT(*)>1;

/* END */

SELECT * FROM patient_info;