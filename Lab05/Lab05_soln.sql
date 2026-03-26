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
    Faculty_teaching VARCHAR(50),
    FacultyID INT
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
    FacultyID INT,
    FOREIGN KEY (FacultyID) references Faculty(FacultyID),
    DeptID INT,
    FOREIGN KEY (DeptID) references Department(DeptID),
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
(105,"Sujeet Kumar","Asst. Professor","ksujeet.cs@gmail.com","CSE and AI-ML"),
(106,"Md.Izhar","Asst. Professor","mdizhar1996@gmail.com","CSE and AI-ML"),
(107,"Manisha Singh","Asst. Professor","manisha.ks241@gmail.com","CSE"),
(108,"Praveen Kumar","Asst. Professor","praveen123@gmail.com","AI-ML");

INSERT INTO Course(CourseID,Course_Name,Credits,Department,Faculty_teaching)
VALUES
(157501,"DBMS",5,"AI-ML","Sujeet Kumar"),
(157502,"AI",3,"AI-ML","E.Haque"),
(157503,"Computer Network",4,"AI-ML","Md.Izhar"),
(157504,"Machine Learning",3,"AI-ML","Praveen Kumar"),
(100508,"PSD",3,"CSE","Manisha Singh"),
(101504,"Hydraulic Engg.",4,"Civil","H.K Mishra");

INSERT INTO Student(StudentID,Student_Name,DOB,Gender,Contact_No,Department)
VALUES
(18,"Nishant Kumar",'2002-10-22','Male',8409212345,"AI-ML"),
(01,"Ramesh Ranjan",'2003-05-12','Male',9988776655,"CSE"),
(75,"Shradha Kapoor",'2001-08-15','Female',1122334455,"EEE"),
(25,"Mohanlal",'2002-01-23','Male',2233778899,"Civil"),
(15,"Faizal Khan",'2004-04-04','Male',9988776651,"Mechanical"),
(17,"Rakesh Kumar",'2003-03-23','Male',5544332211,"3DAG");

INSERT INTO Enrollment(StudentID,CourseID,FacultyID,DeptID,Semester,Grade)
VALUES
(18,157501,105,157,"5th","A"),
(01,100508,107,105,"5th","B"),
(15,101504,103,101,"4th","C"),
(75,157504,108,110,"6th","A"),
(25,157503,106,118,"5th","D"),
(17,157502,102,157,"3rd","P");


-- Part A: Student–Enrollment Relationship 
-- 1. Display StudentID and Name from Student table along with CourseID from Enrollment table.
SELECT s.StudentID,s.Student_Name,e.CourseID
FROM Student AS s
JOIN Enrollment AS e
ON s.StudentID = e.StudentID;

-- 2. Display student Name and Semester for all enrolled students. 
SELECT s.Student_Name,e.Semester
FROM Student AS s
JOIN Enrollment AS e
ON s.StudentID = e.StudentID;

-- 3. Display student Name and Grade obtained in each course. 
SELECT s.Student_Name,e.CourseID,e.Grade
FROM Student AS s
JOIN Enrollment AS e
ON s.StudentID = e.StudentID;

-- Part B: Course–Faculty Relationship
-- 4. Display CourseName and Credits along with the Faculty Name who teaches the course. 
SELECT c.Course_Name,c.Credits,c.Faculty_teaching
FROM Course AS c
JOIN Enrollment AS e
ON c.CourseID = e.CourseID;

-- 5. Display all courses taught by a faculty member whose FacultyID is '105'.
select c.Course_Name,e.FacultyID = 105
from Course as c
join enrollment as e
on c.CourseID = e.CourseID;

-- 6. Display faculty Name and Designation along with the CourseName they teach.

select f.Faculty_Name,f.Designation,c.Course_Name
from Faculty as f
join Enrollment as e
on f.facultyID = e.facultyID
join Course as c
on c.CourseID = e.CourseID;

-- Part C: Student–Course–Enrollment Relationship 
-- 7. Display student Name along with CourseName for all enrollments. 

select s.Student_Name,c.Course_Name
from Student as s
join Enrollment as e
on s.StudentID=e.StudentID
join Course as c
on c.CourseID=e.CourseID;

-- 8. Display student Name, CourseName, and Semester. 
select s.Student_Name,c.Course_Name,e.semester
from Student as s
join Enrollment as e
on s.StudentID=e.StudentID
join Course as c
on c.CourseID=e.CourseID;

-- 9. Display student Name, CourseName, and Grade for Semester 4 only.
select s.Student_Name,c.Course_Name,e.Grade
from Student as s
join Enrollment as e
on s.StudentID=e.StudentID
join Course as c
on c.CourseID=e.CourseID
where e.Semester = "4th";

-- 10. Display all courses taken by a student whose StudentID is '18'.
select c.Course_Name
from Student as s
join Enrollment as e
on s.StudentID=e.StudentID
join Course as c
on c.CourseID=e.CourseID
where e.StudentID=18;

-- Part D: Department-Based JOIN Queries 
-- 11. Display student Name and DepartmentID along with CourseName.
select s.Student_Name,c.Course_Name,e.DeptID
from Student as s
join Enrollment as e
on s.StudentID=e.StudentID
join Course as c
on c.CourseID=e.CourseID;

-- 12. Display department-wise list of courses using DepartmentID. 
select d.Dept_Name,c.Course_Name
from Department as d
join Enrollment as e
on d.DeptID=e.DeptID
join Course as c
on c.CourseID=e.CourseID;

-- 13. Display faculty Name along with department name they belong to
select d.Dept_Name,f.Faculty_Name
from Department as d
join Enrollment as e
on d.DeptID=e.DeptID
join Faculty as f
on f.FacultyID=e.FacultyID;

-- Part E: JOIN with Filtering and Sorting 
-- 14. Display student Name and CourseName for students belonging to Department '157'.
select s.Student_Name,c.Course_Name
from Student as s
join Enrollment as e
on s.StudentID=e.StudentID
join Course as c
on c.CourseID=e.CourseID
where e.DeptID = 157;

-- 15. Display student Name and CourseName sorted by student name in ascending order. 
select s.Student_Name,c.Course_Name
from Student as s
join Enrollment as e
on s.StudentID=e.StudentID
join Course as c
on c.CourseID=e.CourseID
order by Student_Name ASC;

-- 16. Display faculty Name and CourseName sorted by course credits in descending order.

select f.Faculty_Name,c.Course_Name,c.Credits
from Faculty as f
join Enrollment as e
on f.FacultyID=e.FacultyID
join Course as c
on c.CourseID=e.CourseID
order by Credits DESC;

-- Part F: Analytical JOIN Queries
-- 17. Display number of students enrolled in each course.
select c.Course_Name,count(StudentID) as No_of_Students
from Course as c
join Enrollment as e
on c.CourseID=e.CourseID
group by e.CourseID;

-- 18. Display number of courses taught by each faculty member
select f.Faculty_Name,count(CourseID) as No_of_Course
from Faculty as f
join Enrollment as e
on f.FacultyID=e.FacultyID
group by e.FacultyID;

-- 19. Display department-wise count of students.
select d.Dept_Name,count(StudentID) as No_of_Students
from Department as d
join Enrollment as e
on d.DeptID=e.DeptID
group by e.DeptID;

-- 20. Display course name along with maximum grade awarded in that course. 
select c.Course_Name,MAX(Grade) as Max_Grade
from Course as c
join Enrollment as e
on c.CourseID=e.CourseID
group by e.CourseID;
