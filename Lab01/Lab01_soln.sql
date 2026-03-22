-- Part A: DDL

-- 1. Create Database
CREATE DATABASE CollegeDB;

-- 2. Use Database
USE CollegeDB;

-- 3. Create Student Table
CREATE TABLE Student (
    RollNo INT,
    Name VARCHAR(50),
    Dept VARCHAR(20),
    Age INT,
    Phone VARCHAR(15)
);

-- 4. Create Course Table
CREATE TABLE Course (
    CourseID INT,
    CourseName VARCHAR(50),
    Credits INT
);

-- 5. Add City Column
ALTER TABLE Student ADD City VARCHAR(30);

-- 6. Add Semester Column
ALTER TABLE Student ADD Semester INT;

-- 7. Rename Phone to MobileNo
ALTER TABLE Student RENAME COLUMN Phone TO MobileNo;

-- 8. Drop Course Table
DROP TABLE Course;


-- Part B: DML

-- 9. Insert 5 Records
INSERT INTO Student (RollNo, Name, Dept, Age, MobileNo, City, Semester)
VALUES
(101, 'Nishant','CSE',20,'84xxxxxxxx','Sitamarhi',5),
(102, 'Amit', 'ECE', 21, '98xxxxxxxx','Saharsa',4),
(103, 'Ashish', 'CSE', 22, '97xxxxxxxxx','Patna',5),
(104, 'Piyush', 'IT', 19, '94xxxxxxxx','Motihari',2),
(105, 'Rahul', 'ME', 23, '95xxxxxxxx','Bhagalpur',6);

-- 10. Display All Records
SELECT * FROM Student;

-- 11. Display RollNo and Name
SELECT RollNo, Name FROM Student;

-- 12. Students from CSE
SELECT * FROM Student WHERE Dept = 'CSE';

-- 13. Age > 20
SELECT * FROM Student WHERE Age > 20;

-- 14. Update Dept of RollNo 101
UPDATE Student SET Dept = 'ECE' WHERE RollNo = 101;

-- 15. Update City of Rahul
UPDATE Student SET City = 'Patna' WHERE Name = 'Rahul';

-- 16. Increase Age by 1
UPDATE Student SET Age = Age + 1;

-- 17. Delete RollNo 105
DELETE FROM Student WHERE RollNo = 105;

-- 18. Delete All Records
DELETE FROM Student;