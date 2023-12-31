

---------------------------------------RDBMS Assignment: Student Information System (SIS)--------------------------------------------------

/*
------Scenario: In this assignment, you will work with a simplified Student Information System (SIS) database. 
The SIS database contains information about students, courses, and enrollments. 
Your task is to perform various SQL operations on this database to retrieve and manipulate data. 
Database Tables: The SIS database consists of the following tables: 

1. Students 
� student_id (Primary Key) 
� first_name 
� last_name 
� date_of_birth 
� email � phone_number 

2. Courses 
� course_id (Primary Key) 
�  course_name � credits 
� teacher_id (Foreign Key) 

3. Enrollments 
� enrollment_id (Primary Key) 
� student_id (Foreign Key) 
� course_id (Foreign Key) 
� enrollment_date 

4. Teacher 
� teacher_id (Primary Key) 
� first_name 
� last_name 
� email 

5. Payments 
� payment_id (Primary Key) 
� student_id (Foreign Key) 
� amount 
� payment_date
*/




---Tasks: 
------------------------1. Database Design (Normalization): 

-- 1. Create the database named "SISDB" 

Create Database SISDB;

-- 2. Define the schema for the Students, Courses, Enrollments, Teacher, and Payments tables based on the provided schema.

/*

**Students Table**

| Column Name | Data Type | Constraints |
| student_id | INT | PRIMARY KEY |
| first_name | VARCHAR(50) | NOT NULL |
| last_name | VARCHAR(50) | NOT NULL |
| date_of_birth | DATE | NOT NULL |
| email | VARCHAR(100) | UNIQUE |
| phone_number | VARCHAR(20) | NOT NULL |

**Courses Table**

| Column Name | Data Type | Constraints |
| course_id   | INT | PRIMARY KEY |
| course_name | VARCHAR(100) | NOT NULL |
| credits     | INT | NOT NULL |
| teacher_id  | INT | FOREIGN KEY REFERENCES Teacher(teacher_id) |

**Enrollments Table**

| Column Name   | Data Type | Constraints |
| enrollment_id | INT | PRIMARY KEY |
| student_id    | INT | FOREIGN KEY REFERENCES Students(student_id) |
| course_id     | INT | FOREIGN KEY REFERENCES Courses(course_id) |
| enrollment_date | DATE | NOT NULL |

**Teacher Table**

| Column Name |   Data Type  | Constraints |
| teacher_id  |      INT     | PRIMARY KEY |
| first_name  | VARCHAR(50)  | NOT NULL |
| last_name   | VARCHAR(50)  | NOT NULL |
| email       | VARCHAR(100) | UNIQUE |

**Payments Table**

| Column Name | Data Type | Constraints |
| payment_id | INT | PRIMARY KEY |
| student_id | INT | FOREIGN KEY REFERENCES Students(student_id) |
| amount     | DECIMAL(10,2) | NOT NULL |
| payment_date | DATE | NOT NULL |

*/

-- 3. Perform the first three normal forms (1NF, 2NF, 3NF) analysis on the above tables.

/*

**First Normal Form (1NF)**

All of the tables in the SIS database are in first normal form (1NF). This means that they do not contain any repeating groups.

**Second Normal Form (2NF)**

All of the tables in the SIS database are also in second normal form (2NF). 
This means that they do not contain any non-prime attributes that are dependent on only a part of the primary key.

**Third Normal Form (3NF)**

The Students, Courses, and Teacher tables are in third normal form (3NF). 
This means that they do not contain any transitive dependencies. 
However, the Enrollments table is not in 3NF because the enrollment_date attribute is transitively dependent on the primary key. 
To normalize the Enrollments table, we can create a new table called CourseEnrollments that stores the 
enrollment_date attribute and add a foreign key constraint that references both the Courses and Students tables.

Here is the schema for the normalized Enrollments and CourseEnrollments tables:

**Enrollments Table**

| Column Name | Data Type | Constraints |
| enrollment_id | INT | PRIMARY KEY |
| student_id | INT | FOREIGN KEY REFERENCES Students(student_id) |
| course_id | INT | FOREIGN KEY REFERENCES Courses(course_id) |

**CourseEnrollments Table**

| Column Name | Data Type | Constraints |
| course_enrollment_id | INT | PRIMARY KEY |
| enrollment_id | INT | FOREIGN KEY REFERENCES Enrollments(enrollment_id) |
| enrollment_date | DATE | NOT NULL |


*/

-- 4. Create an ERD (Entity Relationship Diagram) for the database.

-- 5. Create appropriate Primary Key and Foreign Key constraints for referential integrity.


-------------------------------2. Data Definition Language (DDL): 


/*
1. Write SQL scripts to create the mentioned tables with appropriate data types, constraints, and relationships.  
� Students  
� Courses 
� Enrollments  
� Teacher  
� Payments
*/

-- Students Table:
CREATE TABLE Students (
student_id INT PRIMARY KEY NOT NULL, 
first_name VARCHAR(50), 
last_name VARCHAR(50), 
date_of_birth DATE, 
email VARCHAR(100), 
phone_number VARCHAR(20));

-- Teacher Table:
CREATE TABLE Teacher (
teacher_id INT PRIMARY KEY NOT NULL, 
first_name VARCHAR(50), 
last_name VARCHAR(50), 
email VARCHAR(100));

-- Courses Table:
CREATE TABLE Courses (
course_id INT PRIMARY KEY NOT NULL, 
course_name VARCHAR(100) , 
credits INT NOT NULL, 
teacher_id INT, 
FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id));

-- Enrollments Table:
CREATE TABLE Enrollments (
enrollment_id INT PRIMARY KEY NOT NULL, 
student_id INT, 
course_id INT, 
enrollment_date DATE, 
FOREIGN KEY (student_id) REFERENCES Students(student_id), 
FOREIGN KEY (course_id) REFERENCES Courses(course_id));



--Payments Table:
CREATE TABLE Payments (
payment_id INT PRIMARY KEY, 
student_id INT, 
amount DECIMAL(10, 2), 
payment_date DATE, 
FOREIGN KEY (student_id) REFERENCES Students(student_id));

--------------------------------3. Data Manipulation Language (DML): 

/*
a) Insert at least 10 sample records into each of the following tables. 
� Students  
� Courses 
� Enrollments  
� Teacher  
� Payments
*/


INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number)
VALUES
(1, 'Arjun', 'Rao', '2000-01-15', 'arjun.rao@email.com', '9876543210'),
(2, 'Deepika', 'Nair', '2003-03-22', 'deepika.nair@email.com', '8765432109'),
(3, 'Rajesh', 'Menon', '2000-05-10', 'rajesh.menon@email.com', '7654321098'),
(4, 'Aishwarya', 'Kumar', '2000-07-08', 'aishwarya.kumar@email.com', '6543210987'),
(5, 'Prasad', 'Sinha', '2000-09-14', 'prasad.sinha@email.com', '6432109876'),
(6, 'Anjali', 'Singh', '2005-11-30', 'anjali.singh@email.com', '7321098765'),
(7, 'Vijay', 'Mishra', '2004-02-18', 'vijay.mishra@email.com', '8210987654'),
(8, 'Shreya', 'Yadav', '2002-04-25', 'shreya.yadav@email.com', '9109876543'),
(9, 'Naveen', 'Reddy', '2000-06-07', 'naveen.reddy@email.com', '9876543210'),
(10, 'Arjun', 'Rajput', '2000-08-03', 'arjun.rajput@email.com', '8765432109'),
(11, 'Sneha', 'Kumar', '2000-10-19', 'sneha.kumar@email.com', '7654321098'),
(12, 'Rajat', 'Mehra', '2003-12-05', 'rajat.mehra@email.com', '6543210987'),
(13, 'Ananya', 'Shukla', '2001-01-28', 'ananya.shukla@email.com', '6543219876'),
(14, 'Prateek', 'Gandhi', '2001-03-04', 'prateek.gandhi@email.com', '6432109876'),
(15, 'Divya', 'Rawat', '2001-05-22', 'divya.rawat@email.com', '9321098765'),
(16, 'Sandeep', 'Malhotra', '2005-07-11', 'sandeep.malhotra@email.com', '6543320987'),
(17, 'Nisha', 'Srivastava', '2001-09-26', 'nisha.srivastava@email.com', '7654321998'),
(18, 'Ravi', 'Choudhary', '2001-11-02', 'ravi.choudhary@email.com', '1098765432'),
(19, 'Simran', 'Biswas', '2002-12-18', 'simran.biswas@email.com', '9876543210'),
(20, 'Priya', 'Gupta', '2003-06-22', 'priya.gupta@email.com', '8765322109');

SELECT * FROM Students;
SELECT * FROM Teacher;
SELECT * FROM Courses;
SELECT * FROM Enrollments;
SELECT * FROM Payments;


INSERT INTO Courses (course_id, course_name, credits, teacher_id)
VALUES
(1, 'Mathematics', 3, 101),
(2, 'Physics', 4, 102),
(3, 'Computer Science', 5, 103),
(4, 'Biology', 3, 104),
(5, 'Chemistry', 4, 105),
(6, 'History', 3, 106),
(7, 'Literature', 3, 107),
(8, 'Economics', 4, 108),
(9, 'Psychology', 3, 109),
(10, 'Engineering', 5, 110),
(11, 'Political Science', 3, 111),
(12, 'Business Management', 4, 112),
(13, 'Fine Arts', 3, 113),
(14, 'Environmental Science', 4, 114),
(15, 'Information Technology', 5, 115);



INSERT INTO Teacher (teacher_id, first_name, last_name, email)
VALUES
(101, 'Surya', 'Naidu', 'surya.naidu@email.com'),
(102, 'Priyanka', 'Reddy', 'priyanka.reddy@email.com'),
(103, 'Rajendra', 'Varma', 'rajendra.varma@email.com'),
(104, 'Meenakshi', 'Kumar', 'meenakshi.kumar@email.com'),
(105, 'Venkatesh', 'Rao', 'venkatesh.rao@email.com'),
(106, 'Divya', 'Singh', 'divya.singh@email.com'),
(107, 'Ravi', 'Mehra', 'ravi.mehra@email.com'),
(108, 'Anusha', 'Yadav', 'anusha.yadav@email.com'),
(109, 'Krishna', 'Verma', 'krishna.verma@email.com'),
(110, 'Aruna', 'Kumar', 'aruna.kumar@email.com'),
(111, 'Srinivas', 'Rajput', 'srinivas.rajput@email.com'),
(112, 'Radha', 'Shukla', 'radha.shukla@email.com'),
(113, 'Prakash', 'Gandhi', 'prakash.gandhi@email.com'),
(114, 'Vijaya', 'Rawat', 'vijaya.rawat@email.com'),
(115, 'Anand', 'Malhotra', 'anand.malhotra@email.com');


INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES
(1, 7, 14, '2020-07-10'),
(2, 5, 11, '2021-02-15'),
(3, 14, 8, '2021-11-20'),
(4, 9, 6, '2022-05-25'),
(5, 2, 2, '2022-09-01'),
(6, 20, 3, '2020-12-05'),
(7, 10, 12, '2022-08-10'),
(8, 18, 10, '2021-07-15'),
(9, 12, 5, '2023-01-20'),
(10, 1, 7, '2022-03-25'),
(11, 3, 9, '2023-05-01'),
(12, 16, 13, '2021-06-05'),
(13, 19, 1, '2020-03-10'),
(14, 15, 4, '2022-04-15'),
(15, 8, 15, '2023-02-20'),
(16, 11, 8, '2020-01-25'),
(17, 6, 6, '2021-10-01'),
(18, 4, 3, '2022-12-05'),
(19, 13, 5, '2023-07-10'),
(20, 17, 2, '2020-08-15');



INSERT INTO Payments (payment_id, student_id, amount, payment_date)
VALUES
(1, 1, 15000, '2020-08-01'),
(2, 2, 12000, '2020-09-15'),
(3, 3, 18000, '2020-10-20'),
(4, 4, 25000, '2020-11-25'),
(5, 5, 11000, '2020-12-01'),
(6, 6, 13500, '2021-01-05'),
(7, 7, 12500, '2021-02-10'),
(8, 8, 20000, '2021-03-15'),
(9, 9, 14500, '2021-04-20'),
(10, 10, 10000, '2021-05-25'),
(11, 11, 18500, '2021-06-01'),
(12, 12, 12000, '2021-07-05'),
(13, 13, 15500, '2021-08-10'),
(14, 14, 13000, '2021-09-15'),
(15, 15, 17500, '2021-10-20'),
(16, 16, 16000, '2021-11-25'),
(17, 17, 19500, '2021-12-01'),
(18, 18, 22000, '2022-01-05'),
(19, 19, 14500, '2022-02-10'),
(20, 20, 21000, '2022-03-15');


--b) Write SQL queries for the following tasks:  
/*
1. Write an SQL query to insert a new student into the "Students" table with the following details: 
a. First Name: John 
b. Last Name: Doe 
c. Date of Birth: 1995-08-15 
d. Email: john.doe@example.com 
e. Phone Number: 1234567890 */
INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number)
VALUES (21, 'John', 'Doe', '1995-08-15', 'john.doe@example.com', '1234567890');

-- 2. Write an SQL query to enroll a student in a course. Choose an existing student and course and insert a record into the "Enrollments" table with the enrollment date. 

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES (21, 21, 9, GETDATE());

-- 3. Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and modify their email address. 
UPDATE Teacher SET email = 'divya.s@email.com'
WHERE teacher_id = 106;

--  4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select an enrollment record based on student and course. 
DELETE FROM Enrollments
WHERE student_id = 21 AND course_id IS NULL;


-- 5. Update the "Courses" table to assign a specific teacher to a course. Choose any course and teacher from the respective tables.

UPDATE Courses SET teacher_ID = 106 WHERE course_ID = 7;
UPDATE Courses SET teacher_ID = 107 WHERE course_ID = 6;

-- 6. Delete a specific student from the "Students" table and remove all their enrollment records from the "Enrollments" table. Be sure to maintain referential integrity.

BEGIN TRANSACTION;
DELETE FROM Enrollments WHERE student_id = 21;
DELETE FROM Students WHERE student_id = 21;
COMMIT;


-- 7. Update the payment amount for a specific payment record in the "Payments" table. Choose any payment record and modify the payment amount.

UPDATE Payments SET amount = 20500 WHERE payment_id = 8;


SELECT * FROM Students;
SELECT * FROM Teacher;
SELECT * FROM Courses;
SELECT * FROM Enrollments;
SELECT * FROM Payments;

------------------------Joins---------------
-- 1. Write an SQL query to calculate the total payments made by a specific student. You will need to join the "Payments" table with the "Students" table based on the student's ID.

SELECT S.student_id, CONCAT(S.first_name,' ', S.last_name) AS Name, SUM(P.amount) As TotalAmount FROM Students S
JOIN Payments P ON S.student_id = P.student_id
GROUP BY S.student_id, S.first_name, S.last_name;

-- 2. Write an SQL query to retrieve a list of courses along with the count of students enrolled in each course. Use a JOIN operation between the "Courses" table and the "Enrollments" table.

SELECT C.course_id, C.course_name, COUNT(E.student_id) AS student_count FROM Courses C
LEFT JOIN Enrollments E ON C.course_id = E.course_id
GROUP BY C.course_id, C.course_name;

-- 3. Write an SQL query to find the names of students who have not enrolled in any course. Use a LEFT JOIN between the "Students" table and the "Enrollments" table to identify students without enrollments.

SELECT S.student_id, S.first_name, S.last_name FROM Students S
LEFT JOIN Enrollments E ON S.student_id = E.student_id
WHERE E.enrollment_id IS NULL;

-- 4. Write an SQL query to retrieve the first name, last name of students, and the names of the courses they are enrolled in. Use JOIN operations between the "Students" table and the "Enrollments" and "Courses" tables.

SELECT S.first_name, S.last_name, C.course_name FROM Students S
JOIN Enrollments E ON S.student_id = E.student_id
JOIN Courses C ON E.course_id = C.course_id;

-- 5. Create a query to list the names of teachers and the courses they are assigned to. Join the "Teacher" table with the "Courses" table.

SELECT T.first_name, T.last_name, C.course_name FROM Teacher T
JOIN Courses C ON T.teacher_id = C.teacher_id;

-- 6. Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the "Students" table with the "Enrollments" and "Courses" tables.

SELECT S.first_name, S.last_name, E.enrollment_date FROM Students S
JOIN Enrollments E ON S.student_id = E.student_id
JOIN Courses C ON E.course_id = C.course_id
WHERE C.course_id = 5;

-- 7. Find the names of students who have not made any payments. Use a LEFT JOIN between the "Students" table and the "Payments" table and filter for students with NULL payment records. 

SELECT S.first_name, S.last_name FROM Students S
LEFT JOIN Payments P ON S.student_id = P.student_id
WHERE P.payment_id IS NULL;

-- 8. Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN between the "Courses" table and the "Enrollments" table and filter for courses with NULL enrollment records.

SELECT C.course_id, C.course_name FROM Courses C
LEFT JOIN Enrollments E ON C.course_id = E.course_id
WHERE E.enrollment_id IS NULL;

-- 9. Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments" table to find students with multiple enrollment records.

SELECT E.student_id, S.first_name, S.last_name, COUNT(E.course_id) AS course_count FROM Enrollments AS E
JOIN Students AS S ON E.student_id = S.student_id
GROUP BY E.student_id, S.first_name, S.last_name HAVING COUNT(E.course_id) > 1;

-- 10. Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher" table and the "Courses" table and filter for teachers with NULL course assignments.

SELECT T.first_name, T.last_name FROM Teacher T
LEFT JOIN Courses C ON T.teacher_id = C.teacher_id
WHERE C.course_id IS NULL;


----------------------------5. Aggregate Functions and Subqueries----------------------

SELECT * FROM Students;
SELECT * FROM Teacher;
SELECT * FROM Courses;
SELECT * FROM Enrollments;
SELECT * FROM Payments;


-- 1. Write an SQL query to calculate the average number of students enrolled in each course. Use aggregate functions and subqueries to achieve this.

SELECT course_id, AVG(StudentCount) AS AvgStudentsEnrolled FROM (SELECT course_id, COUNT(student_id) 
AS StudentCount FROM Enrollments GROUP BY course_id) AS CourseEnrollments
GROUP BY course_id;

--or without(avg)

SELECT course_id, COUNT(student_id) AS AvgStudentsEnrolled FROM Enrollments
GROUP BY course_id;

-- 2. Identify the student(s) who made the highest payment. Use a subquery to find the maximum payment amount and then retrieve the student(s) associated with that amount.

SELECT TOP 5 student_id, amount FROM Payments WHERE amount IN (SELECT amount FROM Payments) ORDER BY amount DESC;

--or using max

SELECT student_id,amount FROM Payments WHERE amount IN (SELECT MAX(amount) FROM Payments);

-- 3. Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the course(s) with the maximum enrollment count.

SELECT course_id,COUNT(student_id) AS EnrollmentCount FROM Enrollments GROUP BY course_id
HAVING COUNT(student_id) = (SELECT TOP 1 COUNT(student_id) AS MaxEnrollments FROM Enrollments
GROUP BY course_id
ORDER BY MaxEnrollments DESC);

-- 4. Calculate the total payments made to courses taught by each teacher. Use subqueries to sum payments for each teacher's courses.

SELECT t.teacher_id, CONCAT(t.first_name,' ', t.last_name) AS Name_, SUM(P.amount) AS total_payments FROM Teacher t
JOIN Courses C ON t.teacher_id = C.teacher_id
LEFT JOIN Enrollments E ON C.course_id = E.course_id
LEFT JOIN Payments P ON E.student_id = P.student_id
GROUP BY t.teacher_id, t.first_name, t.last_name;
--or
SELECT t.teacher_id, t.first_name,
(SELECT SUM(P.amount) FROM Payments P WHERE p.payment_id IN (
Select course_id from Courses c where c.teacher_id = t.teacher_id)) AS total_payments
FROM Teacher t;

-- 5. Identify students who are enrolled in all available courses. Use subqueries to compare a student's enrollments with the total number of courses. 

SELECT s.student_id FROM Students s
WHERE NOT EXISTS ( SELECT 1 FROM Courses c,Enrollments e WHERE e.student_id = s.student_id AND e.course_id = c.course_id);

-- 6. Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to find teachers with no course assignments.

SELECT t.teacher_id, t.first_name, t.last_name FROM Teacher t
WHERE t.teacher_id NOT IN (SELECT DISTINCT teacher_id FROM Courses);

-- 7. Calculate the average age of all students. Use subqueries to calculate the age of each student based on their date of birth.

SELECT AVG(DATEDIFF(YEAR, date_of_birth, GETDATE())) AS AverageAge
FROM Students;

-- 8. Identify courses with no enrollments. Use subqueries to find courses without enrollment records.

SELECT c.course_id, c.course_name FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id WHERE e.course_id IS NULL;
--or
SELECT c.course_id, c.course_name FROM Courses c WHERE NOT EXISTS(SELECT * FROM Enrollments e where e.course_id=c.course_id);

-- 9. Calculate the total payments made by each student for each course they are enrolled in. Use subqueries and aggregate functions to sum payments.

SELECT S.student_id, CONCAT(S.first_name,'',S.last_name) AS StudentName, SUM(P.amount) AS TotalPayments FROM Students S
JOIN Enrollments E ON S.student_id = E.student_id
LEFT JOIN Payments P ON E.student_id = P.student_id
GROUP BY S.student_id, CONCAT(S.first_name,'',S.last_name)
Order BY TotalPayments DESC;
--- to check --check student_id 8 --2courses
SELECT S.student_id,(SELECT SUM(P.amount) From Payments P where S.student_id=P.student_id)AS TotalPayments FROM Students S
Where S.student_id IN(Select distinct e.student_id from Enrollments e) order by TotalPayments desc;

-- 10.Identify students who have made more than one payment. Use subqueries and aggregate functions to count payments per student and filter for those with counts greater than one.  

SELECT P.payment_id,SUM(amount) AS TotalAmount,E.student_id, S.first_name, S.last_name, COUNT(E.course_id) AS course_count FROM Enrollments E
JOIN Students S ON E.student_id = S.student_id
JOIN Payments P ON S.student_id=P.student_id
GROUP BY P.payment_id,E.student_id, S.first_name, S.last_name HAVING COUNT(E.course_id) > 1;

-- 11. Write an SQL query to calculate the total payments made by each student. Join the "Students" table with the "Payments" table and use GROUP BY to calculate the sum of payments for each student.

SELECT S.student_id, CONCAT(S.first_name,'',S.last_name) AS StudentName, SUM(P.amount) AS TotalPayments FROM Students S
LEFT JOIN Payments P ON S.student_id = P.student_id
GROUP BY S.student_id, CONCAT(S.first_name,'',S.last_name)
Order BY S.student_id ASC;

-- 12. Retrieve a list of course names along with the count of students enrolled in each course. Use JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to count enrollments.

SELECT C.course_id, C.course_name, COUNT(E.student_id) AS enrollment_count FROM Courses C
LEFT JOIN Enrollments E ON C.course_id = E.course_id
GROUP BY C.course_id, C.course_name
HAVING COUNT(E.student_id) = ( SELECT TOP 1 COUNT(student_id) AS MaxEnrollments FROM Enrollments
GROUP BY course_id
ORDER BY MaxEnrollments DESC );

-- 13. Calculate the average payment amount made by students. Use JOIN operations between the "Students" table and the "Payments" table and GROUP BY to calculate the average.

SELECT S.student_id,CONCAT(S.first_name,'',S.last_name) AS StudentName,AVG(P.amount) AS average_payment_amount FROM Students S
LEFT JOIN Enrollments E ON S.student_id = E.student_id
LEFT JOIN Payments P ON E.enrollment_id = P.student_id
GROUP BY S.student_id,CONCAT(S.first_name,'',S.last_name);

SELECT * FROM Students;
SELECT * FROM Teacher;
SELECT * FROM Courses;
SELECT * FROM Enrollments;
SELECT * FROM Payments;