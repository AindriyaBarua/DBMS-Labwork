create table documents5(

	document_id int primary key,
	header_text varchar(300) not null,
	posting_date date not null default current_date);

create table shifts(

	id int primary key,
	shift_name varchar not null,
	start_at time not null , end_at time not null);

insert into shifts(id, shift_name, start_at, end_at) values (1, 'Morning', '08:00:00', '12:00:00'), (2, 'Afternoon', '13:00:00', '17:00:00'),(3, 'Night', '18:00:00', '22:00:00'); 

create table timestamp_demo(

	id int,
	ts timestamp);

insert into timestamp_demo(id, ts) values (1, '2016-06-22 19:10:25');

create table product(

	prod_id int primary key,
	prod_name varchar(15),
	price numeric (6,2));

create table order(

	order_id int,
	product_id int,
	quantity int,
	primary key (order_id, product_id), 
	foreign key(product_id) references product on delete cascade on update cascade);

create table student(

	student_id int primary key,
	student_name varchar(300),
	state varchar(300),
	dept_name varchar(20)
	foriegn key (dept_name) references deparment2 on delete cascade on update cascade);


create table pre-req (

	course_id varchar(7),
	prereq_id varchar(7) primary key,
	foriegn key (course_id) references course on delete cascade on update cascade);

create table advisor(

	student_id int,
	id varchar(5),
	foriegn key (id) references instructor on delete cascade on update cascade);

create table register(

	student_id int;
	course_id varchar(7);
	grade numeric(4,2)
	foriegn key (course_id) references course on delete cascade on update cascade);
	foriegn key (student_id) references student on delete cascade on update cascade);

	
select * from department2;
select * from course;
select * from instructor;













	
