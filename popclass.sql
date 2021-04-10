-- -- db2 -td"^" -v -f popclass.sql
insert into hw3.class(class_id,name,desc) values(12345,'CS146','Data Structures and Algorithms')^
insert into hw3.class(class_id,name,desc) values(11111,'CS147','Computer Architecture')^
insert into hw3.class(class_id,name,desc) values(22222,'CS151','Object Oriented Design')^
insert into hw3.class(class_id,name,desc) values(33333,'CS149','Operating Systems')^
insert into hw3.class(class_id,name,desc) values(44444,'CS157A','Database Management')^
insert into hw3.class(class_id,name,desc) values(55555,'CS100W','Computer Science Writing')^
-- Test duplicate ID
insert into hw3.class(class_id,name,desc) values(12345,'Dummy','Dummy Class Description')^