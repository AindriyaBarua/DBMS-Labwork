﻿﻿﻿select name,building from department_demo,instructor_demo where instructor_demo.dept_name=department_demo.dept_name

select name,title from instructor_demo,course_demo where instructor_demo.dept_name=course_demo.dept_name

select* from student503
select* from instructor
select* from course
select* from department
select* from teaches
select* from register
select* from section

update instructor_demo set gender='M' 

select name,course_id,title from instructor,course where instructor.dept_name=course.dept_name and gender='F'
select title,budget from course_demo,department where course.dept_name=department.dept_name

select name from instructor,course_demo where course_demo.dept_name=instructor.dept_name and title='Operating System'

select name from instructor natural join course where title = 'Physics'

select dept_name,count(name) from instructor group by dept_name having count(name)>0 

select name,course_id from instructor,teaches where curr_year = 2017

select name,title from instructor natural join teaches natural join course where  dept_name='Biology' and curr_year = 2017 

insert into register (student_id,course_id,grade,date_reg,time_reg) values ('2','BIO-101','A','01/08/2018','12:00:00'),('3','CS-101','B','02/10/2017','2:00:00'),('4','CS-101','A','01/11/2017','12:30:00')

insert into register (student_id,course_id,grade,date_reg,time_reg) VALUES ('1','EE-181','B','02/08/2018','09:00:00')

select name from student503 natural join register NATURAL join course_demo where course_id = 'BIO-101' and grade = 'A'

select id from student503 natural join section natural join course_demo where course_id = 'BIO-101' and curr_year = '2017'

select name,count(name) from instructor natural join course natural join teaches where curr_year=2017 group by name

select name from instructor natural join department where building='Taylor'

select name,course_id from instructor natural join course; 

insert into teaches(ins_id,course_id,section_id,semester,curr_year) values ('2324','PHY-101','B','6',2017);

select name,title from instructor natural join course;

insert into student503 (id,name,stt,cgpa,bus_fee,tution_fee) values ('5','VEN','MAH','2.2','1450','7888')

Select * from student503 natural join register;

Select * from student503 natural left outer join register;

Select * from register natural right outer join student;

select name from instructor natural join course natural join teaches where dept_name='BIOLOGY' and semester='2';

select name,count(course_id) from instructor natural join course group by name;






