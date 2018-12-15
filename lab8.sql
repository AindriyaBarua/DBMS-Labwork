create table instructor(
id int,
namee varchar,
street varchar,
city varchar,
rank int,
salary int,
primary key(id)
)

create table secretary(
id int,
namee varchar,
street varchar,
city varchar,
hours_per_week int,
salary int,
primary key(id)
)

create table student_2(
id int,
namee varchar,
street varchar,
city varchar,
tot_credits int,
primary key(id)
)

insert into instructor values(1,'soumi','pj','mumbai',1,45009)
insert into instructor values(2,'prashu','yepi','mumbai',5,45009)
insert into instructor values(3,'aindriya','vk','amritapuri',1,450645)
insert into instructor values(4,'rep','tp','kochi',10,486464)
insert into instructor values(5,'venky','vk','amritapuri',3,86546)


insert into secretary values (4,'Viveka','TB','Thane',05,9500)

insert into secretary values (5,'Prash','SB','Mumbai',15,10500)

insert into secretary values (6,'Rahul','FB','Coimabatore',17,7500)

insert into student_2 values (7,'Adi','LB','Tripunitura',25)

insert into student_2 values (8,'Piku','DB','kozhikode',17)
insert into student_2 values (9,'Kiku','VB','Thrissur',15)


select instructor.namee,secretary.namee from instructor,secretary
select avg(salary),rank from instructor group by rank



select* from secretary




insert into Campus values ('Amrita','Amritapuri',654123)
insert into Campus values ('Haravard','USA',784512)
insert into Campus values ('Oxford','London',456891),
('SRM','Tamil Nadu',412563),
('VIT','Tamil Nadu',789456)

insert into Programme values ('Database management',50),
('Intergarted Chemistry',30),
('Thermodynamics',45),
('Organic chemistry',45),
('Fluid Mechanics',45),
('Computational Thinking',50)

insert into Student_1 values ('AM.EN.U4CSE16234','Sai Rajeev','Telengana'),
('HVU4MEC4578','George','London'),
('SRMU4ME4978','Tarun','Chennai')

insert into Enquire values ('SRMU4ME4978','Computational Thinking','Amrita')


insert into Enquire values('Fluid Mechanics','Amrita','AM.EN.U4CSE16234'),
('Thermodynamics','Haravard','HVU4MEC4578'),
('Computational Thinking','SRM','SRMU4ME4978')

select count(Reg_num) from Enquire group by Campus_name

﻿create table campus(
campus_name varchar,
campus_location varchar,
pincode int,
primary key(campus_name)
)

create table programme(
prog_name varchar,
type1 varchar,
primary key (prog_name)
)

create table strength(
strength varchar,
prog_name varchar,
primary key(strength,prog_name),
foreign key(prog_name)
    references programme)

 create table student_1(
 reg_num int,
 name varchar,
 address varchar,
 primary key(reg_num)
 )




 ﻿create table salesman (
 salesman_id int primary key,
 name varchar(50),
 city varchar(50),
 commission numeric(3,2));

insert into salesman values(5001,'James Hoog','New York',0.15);
insert into salesman values(5002,'Nail Knite','Paris',0.13);
insert into salesman values(5005,'Pit Alex','London',0.11);
insert into salesman values(5006,'Mc Lyon','Paris',0.14);
insert into salesman values(5003,'Lauson Hen',NULL,0.12);
insert into salesman values(5007,'Paul Adam','Rome',0.13);

select * from salesman

create table customer1 (
 customer_id int primary key,
 cust_name varchar(80),
 city varchar(80),
 grade int,
 salesman_id int references salesman);

insert into customer1 values(3002,'Nick Rimando','New York',100,5001);
insert into customer1 values(3005,'Graham Zusi','California',200,5002);
insert into customer1 values(3001,'Brad Guzan','London',NULL,5005);
insert into customer1 values(3004,'Fabian Johns','Paris',300,5006);
insert into customer1 values(3007,'Brad Davis','New York',200,5001);
insert into customer1 values(3009,'Geoff Camero','Berlin',100,5003);
insert into customer1 values(3008,'Julian Green','London',300,5002);
insert into customer1 values(3003,'Jozy Altidor','Moncow',200,5007);

select * from customer1

create table orders1 (
 ord_no int primary key,
 purch_amt decimal,
 ord_date date,
 customer_id int references customer1,
 salesman_id int references salesman);
 
insert into orders1 values(70001,150.5,'2012-10-05',3005,5002);
insert into orders1 values(70009,270.65,'2012-09-10',3001,5005);
insert into orders1 values (70002,65.26,'2012-10-05',3002,5001);
insert into orders1 values (70004,110.5,'2012-08-17',3009,5003);
insert into orders1 values (70007,948.5,'2012-09-10',3005,5002);
insert into orders1 values (70005,2400.6,'2012-07-27',3007,5001);
insert into orders1 values (70008,5760,'2012-09-10',3002,5001);
insert into orders1 values (70010,1983.43,'2012-10-10',3004,5006);
insert into orders1 values (70003,2480.4,'2012-10-10',3009,5003);
insert into orders1 values (70012,250.45,'2012-06-27',3008,5002);
insert into orders1 values (70011,75.29,'2012-08-17',3003,5007);
insert into orders1 values (70013,3045.6,'2012-04-25',3002,5001);

select * from orders1

select name, cust_name from customer1 join salesman on customer1.salesman_id = salesman.salesman_id
select name, cust_name, commission from customer1 join salesman on customer1.salesman_id = salesman.salesman_id where salesman.commission > 0.12
select name, cust_name, commission from customer1 join salesman on customer1.salesman_id = salesman.salesman_id where salesman.commission > 0.12 and customer1.city!=salesman.city
select name, ord_no, purch_amt, ord_date, cust_name, commission from orders1 join customer1 on orders1.customer_id = customer1.customer_id join salesman on orders1.salesman_id = salesman.salesman_id
select cust_name from customer1 join salesman on customer1.salesman_id = salesman.salesman_id order by cust_name asc
select cust_name, grade from customer1 join salesman on customer1.salesman_id = salesman.salesman_id where grade < 300 order by cust_name asc
select customer1.cust_name, customer1.city, orders1.ord_no, orders1.ord_date, orders1.purch_amt from customer1 left outer join orders1 on customer1.customer_id = orders1.customer_id order by orders1.ord_date asc
select name, customer1.cust_name, customer1.city, orders1.ord_no, orders1.ord_date, orders1.purch_amt from customer1 left outer join orders1 on customer1.customer_id = orders1.customer_id left outer join salesman on customer1.salesman_id = salesman.salesman_id



