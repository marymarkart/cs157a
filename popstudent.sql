-- -- db2 -td"^" -v -f popstudent.sql
insert into hw3.student(student_id,first,last,gender) values(12345,'Mary','Markart','f')^
insert into hw3.student(student_id,first,last,gender) values(11111,'Elizabeth','Conner','f')^
insert into hw3.student(student_id,first,last,gender) values(22222,'Austin','Ribinson','m')^
insert into hw3.student(student_id,first,last,gender) values(33333,'This','Student','m')^
insert into hw3.student(student_id,first,last,gender) values(44444,'That','Student','f')^
insert into hw3.student(student_id,first,last,gender) values(55555,'Undefined','Student','u')^
insert into hw3.student(student_id,first,last,gender) values(54321,'Backwards','Student','u')^
--Duplicate studentID
insert into hw3.student(student_id,first,last,gender) values(54321,'Duplicate','Student','u')^
-- Wrong gender char
insert into hw3.student(student_id,first,last,gender) values(87654,'No Gender','Student','X')^