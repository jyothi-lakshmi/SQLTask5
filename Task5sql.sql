
-- Department Table
create table department(d_id int auto_increment primary key,department varchar(50));


-- Employees Table
create table employees_table(e_id int auto_increment primary key,d_id int,fullname varchar(50) not null,age varchar(20) not null,gender varchar(20) not null, location varchar(100) default 'banglore' not null,foreign key(d_id) references department(d_id));


 -- Salary Table
create table salary(s_id int auto_increment primary key,e_id int not null unique,salary int not null,foreign key(e_id) references employees_table(e_id));

 -- Insert Into

insert into department(department) values('IT'),
('sales'),
('HR');
select * from department;


insert into employees_table(fullname,age,gender,location,d_id) values('jyothi lakshmi',30,'female',default,2),
 ('Karthika Menon',23,'female','hyderabad',1),
 ('Karthik Menon',23,'male','pune',1),
  ('Vineeth P',35,'male','pune',3),
 ('varun Mohan',23,'male','banglore',1);
 
 insert into employees_table(fullname,age,gender,location) values('Ganesh M',30,'female',default);

 select * from employees_table;


insert into salary(e_id,salary) values(1,30000),
(2,50000),
(3,100000),
(4,30000),
(5,25000);
select * from salary;
delete from salary where e_id=4;


-- Applying joins for connect tables

-- Inner join
select * from employees_table emp inner join department dep on emp.d_id=dep.d_id;

select e_id,fullname age,gender,location,department from employees_table emp inner join department dep on emp.d_id=dep.d_id;

-- left join
select * from employees_table e left join salary s on e.e_id=s.e_id where location !=  'banglore' order by e.e_id;

select e_id,fullname age,gender,location,department from employees_table emp left join department dep on emp.d_id=dep.d_id;


-- right join
select * from employees_table emp right join department dep on emp.d_id=dep.d_id;

select e_id,fullname age,gender,location,department from employees_table emp right join department dep on emp.d_id=dep.d_id;


-- Full outer join(in mysql full join is not supported alternative way :-)

select e_id,fullname age,gender,location,department from employees_table emp left join department dep on emp.d_id=dep.d_id
union
select e_id,fullname age,gender,location,department from employees_table emp right join department dep on emp.d_id=dep.d_id;


select * from employees_table emp left join salary sal on emp.e_id=sal.e_id
union
select * from employees_table emp right join salary sal on emp.e_id=sal.e_id;



-- joins in multiple table
select * from salary s join employees_table e on s.e_id=e.e_id join department d on e.d_id=d.d_id where salary >=50000;

select fullname,age,location,department,salary from salary s join employees_table e on s.e_id=e.e_id join department d on e.d_id=d.d_id;


