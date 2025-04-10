create database office;
use office;

create table department(
dept_id int primary key,
dept_name varchar(50) not null,
location varchar(50)
);

create table employees(
emp_id int primary key,
emp_name varchar(50) not null,
salary decimal(10,2),
dept_id int,
hire_date date,
foreign key (dept_id) references department(dept_id)
);

insert into department
values
(10,'Accounting','New York'),
(20,'Research','Dallas'),
(30,'Sales','Chicago'),
(40,'Operations','Boston'),
(50,'IT','San Francisco');

select * from department;

insert into employees
values
(101,'John Smith',75000,10,'2020-01-15'),
(102,'Jane Doe',82000,20,'2019-05-22'),
(103,'Michael Johnson',65000,30,'2021-03-10'),
(104,'Emily Davis',88000,20,'2018-11-05'),
(105,'Robert Brown',92000,10,'2017-07-30');

select * from employees;

#Basic Join
select employees.emp_id as Employee_ID,employees.emp_name as Employee_Name,department.dept_name as Department_Name,department.location as Location
from employees
join department
on employees.dept_id=department.dept_id; 

#Aggregation with Group By
select department.dept_id as Department_ID,department.dept_name as Department_Name,avg(employees.salary) as Average_Salary
from department 
join employees
on department.dept_id=employees.dept_id
group by department.dept_id, department.dept_name
order by avg(employees.salary) desc;

#Nested Query
select * from employees
where salary > (select avg(salary)from employees) ;

#Having Clause
select department.dept_name as Department_Name , sum(employees.salary) as Total_Salary
from employees 
join department
on employees.dept_id=department.dept_id
group by department.dept_name
having sum(employees.salary) > 150000;

#Complex Join with Aggregation
SELECT department.dept_name as Department_Name, employees.emp_name as Employee_Name, employees.salary as Employee_Salary
FROM employees 
JOIN department  
ON  employees.dept_id=department.dept_id 
WHERE salary = (SELECT MAX(employees.salary) FROM employees WHERE employees.dept_id = department.dept_id);
