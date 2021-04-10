-- HW#3
-- Section x
-- Student ID: 015063802
-- Markart, Mary
-- db2 -td"^" -f create.sql
-- connect to cs157a^
--Creating student table
drop table hw3.schedule^
drop table hw3.class_prereq^
drop table hw3.class^
drop table hw3.student^
CREATE TABLE hw3.student (
       student_id char (5) NOT NULL,
       first varchar (20) NOT NULL,
       last varchar (20) NOT NULL,
       gender char (1) NOT NULL,
       Constraint Sid UNIQUE (student_id),
       CONSTRAINT chk_gender CHECK (gender IN ('M', 'F', 'U'))
)^
--Creating class table
CREATE TABLE hw3.class (
       class_id char (5) NOT NULL,
       name varchar (10) NOT NULL,
       desc varchar (30) NOT NULL,
       Constraint cid UNIQUE (class_id)
)^
--Creating pre-req table
CREATE TABLE hw3.class_prereq (
       class_id char (5) NOT NULL,
       prereq_id char (5) NOT NULL,
       constraint fk_class_id  
            foreign key (class_id)  
            references hw3.class (class_id)
	    ON DELETE CASCADE, 
       constraint fk_prereq_id  
            foreign key (prereq_id)  
            references hw3.class (class_id) 
	    ON DELETE CASCADE

)^
--Creating schedule table
CREATE TABLE hw3.schedule (
       student_id char (5) NOT NULL,
       class_id char (5) NOT NULL,
       semester int NOT NULL,
       year int NOT NULL,
       grade char (1) NULL,
       CONSTRAINT chk_grade CHECK (grade IN ('A', 'B', 'C','D', 'F', 'I')),
       CONSTRAINT chk_year CHECK (year IN (2013,2014,2015,2016,2017,2018,2019,2020,2021)),
       CONSTRAINT chk_semester CHECK (semester IN (1, 2, 3)),
       constraint fk_class_id  
            foreign key (class_id)  
            references hw3.class (class_id) 
	   ON DELETE CASCADE,
       constraint fk_student_id  
            foreign key (student_id)  
            references hw3.student (student_id)
	    ON DELETE CASCADE
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
                            FROM hw3.class_prereq left join hw3.schedule on hw3.class_prereq.prereq_id = hw3.schedule.class_id
                            WHERE hw3.class_prereq.class_id = newrow.class_id AND (hw3.schedule.grade != '-' OR hw3.schedule.grade != 'F' OR hw3.schedule.grade != 'I' OR hw3.schedule.grade != NULL  ) ); 

IF ( prereq_pass < num_prereq) 
        THEN      SIGNAL SQLSTATE '88888' ( 'Missing Pre-req' );
       END IF;
END^