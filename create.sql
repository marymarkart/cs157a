-- HW#3
-- Section 2
-- Student ID: 015063802
-- Markart, Mary
-- db2 -td"^" -f create.sql
connect to cs157a^
-- Creating student table
CREATE TABLE hw3.student (
       student_id char (5) NOT NULL PRIMARY KEY,
       first varchar (20) NOT NULL,
       last varchar (20) NOT NULL,
       gender char (1) NOT NULL CHECK (gender IN ('M', 'F', 'U'))
)^
--Creating class table
CREATE TABLE hw3.class (
       class_id char (5) NOT NULL PRIMARY KEY,
       name varchar (10) NOT NULL,
       desc varchar (30) NOT NULL
)^
--Creating pre-req table
CREATE TABLE hw3.class_prereq (
       class_id char (5) NOT NULL REFERENCES hw3.class(class_id) ON DELETE CASCADE,
       prereq_id char (5) NOT NULL REFERENCES hw3.class(class_id) ON DELETE CASCADE
)^
--Creating schedule table
CREATE TABLE hw3.schedule (
       student_id char (5) NOT NULL REFERENCES hw3.student(student_id) ON DELETE CASCADE,
       class_id char (5) NOT NULL REFERENCES hw3.class(class_id) ON DELETE CASCADE,
       semester int NOT NULL CHECK (semester IN (1, 2, 3)),
       year int NOT NULL CHECK (year IN (2013,2014,2015,2016,2017,2018,2019,2020,2021)),
       grade char (1) NULL CHECK (grade IN ('A', 'B', 'C','D', 'F', 'I'))

)^
--Creating trigger for pre-req
CREATE TRIGGER hw3.classcheck
NO CASCADE BEFORE INSERT ON hw3.schedule
REFERENCING NEW AS newrow  
FOR EACH ROW MODE DB2SQL
WHEN ( 0 < (SELECT COUNT(*)
              FROM hw3.class_prereq
               WHERE hw3.class_prereq.class_id = newrow.class_id ) ) 
BEGIN ATOMIC
       DECLARE num_prereq int;
       DECLARE prereq_pass int;
       SET num_prereq = (SELECT COUNT(*)
                            FROM hw3.class_prereq 
                            WHERE hw3.class_prereq.class_id = newrow.class_id);    

       SET prereq_pass = (SELECT COUNT(*)
                            FROM hw3.class_prereq left join hw3.schedule on hw3.class_prereq.prereq_id = hw3.schedule.class_id AND hw3.schedule.student_id = newrow.student_id
                            WHERE hw3.class_prereq.class_id = newrow.class_id AND (hw3.schedule.grade != 'F' AND hw3.schedule.grade != 'I' AND hw3.schedule.grade is NOT NULL  ) ); 

IF ( prereq_pass != num_prereq) 
        THEN      SIGNAL SQLSTATE '88888' ( 'Missing Pre-req' );
       END IF;
END^