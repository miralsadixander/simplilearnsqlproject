CREATE DATABASE School_Ranking_Practice_Project;

USE school_ranking_practice_project;

CREATE TABLE students (
student_id int,
student_first_name text,
student_last_name text, 
class int (2),
age int
);

-- student last name, student first name and student id should be a NOT NULL constraint
ALTER TABLE students
MODIFY student_first_name text NOT NULL,
MODIFY student_last_name text NOT NULL,
MODIFY student_id int NOT NULL;

-- student id should be PRIMARY KEY
ALTER TABLE students
ADD PRIMARY KEY (student_id);

-- Create a markshet table with it's columns
CREATE TABLE marksheet (
score int,
year year,
ranking int,
class int (2),
student_id int
);

/*inserting values manually into student & marksheet table
1- Student Table
2 - Marksheet Table */
INSERT INTO students (student_id, student_first_name, student_last_name, class, age)
	VALUES (1,'krishna','gee', 10, 18);
    
INSERT INTO marksheet (score, year, ranking, class, student_id)
	VALUES (989, 2014, 10, 1, 1);
        
-- Data imported from data set using the import wizard tool and then checked:    
SELECT * FROM students;
SELECT * FROM marksheet;

-- Query to display student id and first name if age is greater than or equal to 16 and last name = Kumar
SELECT student_id, student_first_name FROM students
WHERE age >= 16 AND student_last_name = 'kumar';

-- Query to display all details from marksheet for scores between 800 and 1000
SELECT * FROM marksheet
WHERE score between 800 AND 1000;

-- Query to display all details from marksheet table by adding +5 to the score and naming column as new score
 SELECT *,
 score +5 AS new_score FROM marksheet;

-- Display marksheet in descending order of score
SELECT * FROM marksheet
ORDER BY score desc;

-- Display details of students who's first name starts with 'a':
SELECT * FROM students
WHERE student_first_name LIKE "a%";

SELECT * FROM students;
SELECT * FROM marksheet;

