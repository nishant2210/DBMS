CREATE DATABASE BPMCE;

USE BPMCE;

CREATE table Department(
	DeptID INT PRIMARY KEY,
    Dept_Name VARCHAR(50),
    Dept_location VARCHAR(10)
    );
    
CREATE table Faculty(
	FacultyID INT PRIMARY KEY,
    Faculty_Name VARCHAR(50),
    Designation VARCHAR(50),
    Official_EmailID VARCHAR(50),
    Department VARCHAR(50)
    );
    
CREATE table Course(
	CourseID INT PRIMARY KEY,
    Course_Name VARCHAR(50),
    Credits INT,
    Department VARCHAR(50),
    Faculty_teaching VARCHAR(50)
    );
    
CREATE table Student(
	StudentID INT PRIMARY KEY,
    Student_Name VARCHAR(50),
    DOB DATE,
    Gender ENUM ('Male','Female'),
    Contact_No BIGINT,
    Department VARCHAR(50)
    );
    
CREATE table Enrollment(
	StudentID INT ,
    FOREIGN KEY (StudentID) references Student(StudentID),
    CourseID INT,
    FOREIGN KEY (CourseID) references Course(CourseID),
    Semester VARCHAR(5),
    Grade VARCHAR(3)
    );
  
INSERT INTO Department(DeptID,Dept_Name,Dept_location)
VALUES
(105,"CSE","Block-A"),
(157,"CSE(AI&ML)","Block-B"),
(118,"3DAG","Block-C"),
(110,"EEE","Block-D"),
(101,"Civil","Block-E"),
(102,"Mechanical","Block-F");

INSERT INTO Faculty(FacultyID,Faculty_Name,Designation,Official_EmailID,Department)
VAlUES
(101,"Murlidhar Prasad Singh","HOD(CSE)","singhmurlidhar@gmail.com","CSE"),
(102,"E.Haque","HOD(AI-ML)","ehtasham47@gmail.com","AI-ML"),
(103,"H.K Mishra","HOD(EEE)","hare.dbit@gmail.com","EEE"),
(104,"Arbind Kumar Amar","HOD(Mechanical)","ak_amar73@gmail.com","Mechanical"),
(105,"Sujeet Kumar","Asst.Professor","ksujeet.cs@gmail.com","CSE and AI-ML"),
(106,"Md.Izhar","Asst.Professor","mdizhar1996@gmail.com","CSE and AI-ML"),
(107,"Manisha Singh","Asst.Professor","manisha.ks241@gmail.com","CSE");

INSERT INTO Course(CourseID,Course_Name,Credits,Department,Faculty_teaching)
VALUES
(157501,"DBMS",5,"AI-ML","Sujeet Kumar"),
(157502,"AI",3,"AI-ML","E.Haque"),
(157503,"Computer Network",4,"AI-ML","Md.Izhar"),
(157504,"Machine Learning",3,"AI-ML","Praveen Kumar"),
(100508,"PSD",3,"CSE","Prity Chaudhary"),
(101504,"Hydraulic Engg.",4,"Civil","Kunal Kumar");

INSERT INTO Student(StudentID,Student_Name,DOB,Gender,Contact_No,Department)
VALUES
(18,"Nishant Kumar",'2002-10-22','Male',8409212345,"AI-ML"),
(01,"Ramesh Ranjan",'2003-05-12','Male',9988776655,"CSE"),
(75,"Shradha Kapoor",'2001-08-15','Female',1122334455,"EEE"),
(25,"Mohanlal",'2002-01-23','Male',2233778899,"Civil"),
(15,"Faizal Khan",'2004-04-04','Male',9988776651,"Mechanical");

INSERT INTO Enrollment(StudentID,CourseID,Semester,Grade)
VALUES
(18,157501,"5th","A"),
(01,100508,"5th","B"),
(15,101504,"4th","C"),
(75,157504,"6th","A");

-- Part A: Basic Data Display (Using Aliases) 
-- 1. Display all columns from the Student table using suitable aliases for every column.
SELECT StudentID AS Roll_No,Student_Name AS Name,DOB AS Date_of_Birth,Gender AS Sex,Contact_No AS Mobile_No,Department AS Dept
FROM Student;

-- 2. Display only StudentID, Name, and DepartmentID from the Student table, renaming them as Roll_No, Student_Name, and Dept_ID 
SELECT StudentID AS Roll_No,Student_Name AS Name,Department AS Dept
FROM Student;

-- 3. Display FacultyID, Name, Designation, and Email from the Faculty table using readable column names.
SELECT FacultyID AS Faculty_Code,Faculty_Name As Name,Designation as job_title,Official_EmailID AS Gmail
FROM Faculty;

-- 4. Display all columns from the Course table with renamed column headers. 
SELECT CourseID AS Course_code,Course_Name as Course_Title,Credits AS Credit_Hours,Department as Dept
FROM Course; 

-- 5. Display all columns from the Enrollment table with meaningful aliases. 

SELECT StudentID AS Roll_No,CourseID AS Course_Code, Semester AS Sem, Grade AS Marks
FROM Enrollment;

-- Part B: Conditional Data Display (WHERE Clause)

-- 6. Display all students whose DepartmentID is 'D101'. 
SELECT * FROM Student
WHERE DepartmentID = 'D101';

-- 7. Display all students whose Gender is 'Female'.
SELECT *
FROM Student
where Gender = 'Female';

-- 8. Display faculty members whose Designation is 'Assistant Professor'.
SELECT *
FROM Faculty
where Designation = 'Asst.Professor';

-- 9. Display faculty members whose DepartmentID is 'D102'. 
SELECT * FROM Faculty
WHERE DepartmentID = 'D102';

-- 10. Display courses whose Credits are greater than or equal to 4.
SELECT *
FROM Course
WHERE Credits >=4;

-- 11. Display students born after 2003-01-01 using the DOB column.
SELECT *
FROM Student
where DOB > '2003-01-01';

-- 12. Display enrollment records for students enrolled in Semester 4. 
SELECT *
FROM Enrollment
where Semester = '4th';

-- Part C: Sorting and Limiting Results 
-- 13. Display student records sorted by Name in ascending order. 
SELECT Student_Name
FROM Student
ORDER BY Student_Name ASC;

-- 14. Display student records sorted by DOB in descending order. 
SELECT *
FROM Student
ORDER BY DOB DESC;

-- 15. Display faculty records sorted by Designation in ascending order. 
SELECT * FROM Faculty
order by Designation ASC;

-- 16. Display courses sorted by Credits in descending order. 
SELECT * FROM Course
order by Credits DESC;

-- 17. Display only the first 3 student records
SELECT * FROM Student
LIMIT 3;

-- 18. Display only the first 5 course records. 
SELECT * FROM Course
LIMIT 5;

-- Part D: Derived / Computed Output (No Table Modification)

-- 19. Display student Name along with their calculated Age using DOB.
SELECT Student_Name,year(curdate())-year(DOB) AS Calculated_Age
FROM Student;

-- 20. Display course CourseName along with Credits + 1 as Updated_Credits. 
select Course_Name,Credits+1 as Updated_Credits
from Course;

-- 21. Display enrollment details with column Grade shown as Final_Grade. 
SELECT StudentID, CourseID, Semester, Grade AS Final_Grade
FROM Enrollment;

-- 22. Display student Name along with year of birth extracted from DOB. 
 select Student_Name ,year(DOB) as Year_of_Birth
 from Student;
 
 -- 23. Display faculty Name along with email domain extracted from Email. 
SELECT Faculty_Name, SUBSTRING(Official_EmailID, LOCATE('@', Official_EmailID) + 1) AS Email_Domain
FROM Faculty;



    
