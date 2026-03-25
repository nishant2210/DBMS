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
  
-- Part A (Data Insertion)
-- 1. Write INSERT INTO SQL queries to populate all tables.

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
(107,"Manisha Singh","Asst. Professor","manisha.ks241@gmail.com","CSE");

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

-- Part(B) Verification
-- Display Department Table
SELECT *
FROM Department;

-- Display Faculty Table
SELECT *
FROM Faculty;

-- Display Course Table
SELECT *
FROM Course;

-- Display Student Table 
SELECT *
FROM Student;

-- Display Enrollment Table
SELECT *
FROM Enrollment;

    
