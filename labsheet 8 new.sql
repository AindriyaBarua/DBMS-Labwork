

﻿create table Campus (campus_name varchar , campus_location varchar, pincode numeric, primary key(campus_name))

create table Programme (prog_name varchar primary key, Typess varchar);

create table Strength (prog_name varchar, strengths numeric, primary key(prog_name, strengths), foreign key(prog_name) references programme)

create table Stud(Reg_num varchar, Naame varchar, Address varchar, primary key (Reg_num) )

create table Enquire (reg_num varchar , prog_name varchar, campus_name varchar, primary key(reg_num,prog_name,campus_name),foreign key (reg_num) references Stud, foreign key(prog_name) references Programme, foreign key (campus_name) references Campus)

create table instructors (id varchar, namee varchar, street varchar, city varchar, salary int, rank int, primary key (id))

create table secretary (id varchar, namee varchar, street varchar, city varchar, salary int, hours_per_week time, primary key (id))

create table secretary (id varchar, namee varchar, street varchar, city varchar, salary int, hours_per_week time, primary key (id))

create table studentss (id varchar, namee varchar, street varchar, city varchar, salary int, tot_credits int, primary key (id))

insert into instructors values ('1','Rep','GB','kochi',8000,2)\

insert into instructors values ('2','Niku','PB','Kannur',8500,1)

insert into instructors values ('3','Venky','kB','Kannur',8500,4)

insert into secretary values ('4','Viveka','TB','Thane',9500, '05:00:00')

insert into secretary values ('5','Prash','SB','Mumbai',10500, '15:00:00')

insert into secretary values ('6','Rahul','FB','Coimabatore',7500, '17:00:00')

insert into studentss values ('7','Adi','LB','Tripunitura',19500, 25)

insert into studentss values ('8','Piku','DB','kozhikode',29500, 17)
insert into studentss values ('9','Kiku','VB','Thrissur',1500, 15)


select instructors.namee,secretary.namee from instructors,secretary
select avg(salary),rank from instructors group by rank



select* from secretary





crete table employee 

drop table person

select* from employee

select* from student_123,employee



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

insert into Stud values ('AM.EN.U4CSE16234','Sai Rajeev','Telengana'),
('HVU4MEC4578','George','London'),
('SRMU4ME4978','Tarun','Chennai')

insert into Enquire values ('SRMU4ME4978','Computational Thinking','Amrita')


insert into Enquire values('Fluid Mechanics','Amrita','AM.EN.U4CSE16234'),
('Thermodynamics','Haravard','HVU4MEC4578'),
('Computational Thinking','SRM','SRMU4ME4978')

select count(Reg_num) from Enquire group by Campus_name


create table salesman (
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
select name, customer1.cust_name, customer1.city, orders1.ord_no, orders1.ord_date, orders1.purch_amt from customer1 left outer join orders1 on customer1.customer_id = orders1.customer_id left outer join salesman on customer1.salesman_id = salesman.salesman_id﻿
select name,cust_name,grade from customer1 ,salesman where customer1.salesman_id = salesman.salesman_id order by salesman.salesman_id



select* from customer1
select* from salesman
select* from orders1

select name,cust_name,grade from customer1 ,salesman,orders1 where customer1.salesman_id = salesman.salesman_id and customer1.customer_id = orders1.customer_id order by salesman.salesman_id

select name,cust_name,grade from customer1 ,salesman,orders1 where customer1.salesman_id = salesman.salesman_id and customer1.customer_id = orders1.customer_id and purch_amt  > 2000 and grade is not null order by salesman.salesman_id

select cust_name, city, ord_no, ord_date, purch_amt from customer1, orders1 where customer1.customer_id = orders1.customer_id and grade is not null 

select name from salesman cross join customer1 
select name from salesman cross join customer1 where customer1.city is not null 
select name from salesman cross join customer1 where customer1.city is not null and grade is not null 

select name from salesman cross join customer1 where customer1.city != salesman.city and grade is not null 











