create database Company;
use Company;
create table Employee(
Employee_id int,
first_name varchar(50),
last_name varchar(50),
salary varchar(50),
joining_date varchar(50),
department varchar(30) ,
primary key(Employee_id)
);
drop table Employee;
insert into Employee(Employee_id,first_name,last_name,salary,joining_date,department)values
(1,'Venkatesh','S','100000','08/28/2015','Banking'),
(2,'Ragavi','P','75000','08/28/2015','Business'),
(3,'Gopinath','C','50000','03/02/2016','Pharma'),
(4,'Dinesh','G','50000','03/02/2016','Insurance'),
(5,'Saibabu','E','40000','07/08/2017','Software'),
(6,'Hasan','S','29000','07/08/2017','Manufacturing'),
(7,'Divya','P','33000','07/08/2017','HealthCare'),
(8,'Aravindan','R','40000','07/08/2017','HealthCare'),
(9,'Sathish','MD','45000','03/02/2016','Automobile'),
(10,'Prasanth','PKP','34000','03/02/2016','Insurance'),
(11,'Vijay','R','25684','03/02/2016','Business'),
(12,'Sivakumar','K','54789','03/02/2016','Software');


create table Incentives(
Employee_ref_id int,
Incentive_date varchar(50),
Incentive_amount varchar(50),
foreign key (Employee_ref_id) references Employee (Employee_id)
);
insert into Incentives(Employee_ref_id,Incentive_date,Incentive_amount)values
(1,'01-Feb-16','5000'),
(2,'01-Feb-16','3000'),
(3,'01-Feb-17','4000'),
(1,'01-Jan-17','4500'),
(2,'01-Jan-17','3500');

-- 1 Get all employee details from the employee table
select * from Employee;
-- 2 Get first_name,last_name from employee table
select first_name,last_name from Employee;
-- 3 Get first_name from employee table using alias name"Employee Name"
select first_name as Employee_Name from Employee ;
-- 4 Get first_name from employee table in upper case
select upper(first_name) from Employee;
-- 5 Get first_name from employee table in lower case
select lower(first_name)from Employee;
-- 6 Get unique department from employee table
select distinct department from Employee;
-- 7 Select first 3 character of firt_name from employee
select left(first_name, 3) from Employee;
-- 8 Get position of a in name ragavi from employee table
select instr(first_name,'a')from Employee where first_name='Ragavi';
-- 9 Get first name from employee table after white spaces from right side
select rtrim(first_name) as first_name from Employee;
-- 10 Get first_name from employee table after white spaces from left side
select ltrim(first_name) as first_name from Employee;
-- 11 Get length of employee table
select length(first_name) from Employee;
-- 12 Get first_name from employee table after replacing a with $
select replace(first_name,'a','$') from Employee;
-- 13 Get first_name and last_name as single column from employee table seperating by a '_'
select concat(first_name,' ',last_name) as full_name from Employee;
-- 14 Get first_name,joining year,joining month,joining date from empployee table
select first_name,
substr(joining_date,7,4) as joining_year,
 substr(joining_date,1,2) as joining_month,
 substr(joining_date,4,2) as joining_date 
 from Employee;
 
 -- 15 Get all employee details from employee table order by first_name ascending
 select * from Employee order by first_name asc;
 -- 16 Get all employee details from employee table order by first_name descending
  select * from Employee order by first_name desc;
-- 17 Get all employee details from employee table order by first_name ascending and salary descending
select * from Employee
order by first_name asc,  
 salary desc;
 
-- 18 Get  employee details from employee table whose name is "Dhinesh"
select* from Employee where first_name='Dinesh';
-- 19 Get employee details from employee table whose name is "Dinesh" and "Roy"
select *from Employee where first_name='Dinesh'or'Roy';
-- 20 Get details details from employee table whose name are not "Dinesh" and "Roy"
select *from Employee where first_name !='Dinesh' and First_name!='Roy';

-- 21 Get employee details from employee table whose first_name starts s
select * from Employee where first_name like 'S%';
-- 22 Get employee details from employee table whose first_name starts v
select * from Employee where first_name like 'V%';
-- 23 Get employee details from employee table whose first_name starts n
select * from Employee where first_name like 'N%';

-- 24 Get employee details from employee table whose first_name ends n and contains 4 letter
select *from Employee where length(first_name)=4 and first_name like '%n';
-- 25 Get employee details from employee table whose first_name starts J and contains 4 letter
select *from Employee where length(first_name)=4 and first_name like 'J%';
-- 26 Get employee details from employee table whose salary greater than 60000
select *from Employee where salary>60000;
-- 27 Get employee details from employee table whose salary less than 80000
select *from Employee where salary<80000;
-- 28 Get employee details from employee table whose salary between 50000 and 80000
select *from Employee where salary>=50000 and salary<=80000 ; 
-- 29 Get employee details from employee table whose name is venkatesh and ragavi
select *from Employee where first_name in ('Venkatesh','Ragavi');

-- 39 Get employee details from employee table who has '%' in last_name.Tip:Escape character for special character in a question
select *from Employee where last_name like '%!%%' escape '!';
-- 40 get last_name from employee after after replacing special character with white space
select regexp_replace(last_name, '[^A-Za-z0-9]', ' ') as last_name
from Employee;

-- 41 Get department,total salary with respect to department from employee table
select department,
sum(salary) as total_salary
from Employee
group by department;
-- 42 Get department,total salary with respect to department from employee table order by salary decrement
select department,
sum(salary) as total_salary
from Employee
group by department
order by total_salary desc;

-- 43 Get department ,no of employees in a department,,total salary with respect to a department from employee table order by salary descending
select department,
       count(*) as no_of_employees,
       sum(salary) as total_salary
from Employee
group by department
order by total_salary desc;
-- 44 Get department wise average salary from employee table order by salary ascending
select department,
       avg(salary) as avg_salary
from Employee
group by department
order by avg_salary asc;
-- 45 Get department wise maximum salary from employee table order by salary ascending
select department,
       max(salary +0) as max_salary
from Employee
group by department
order by max(Salary+0)asc;
-- 46 Get department wise minimum salary from employee table order by salary ascending
select department,
       min(salary+0) as min_salary
from Employee
group by department
order by min(salary+0) asc;
-- 47 Select no of employees joined with respect to year and month from employee table
select 
    substr(joining_date,7,4) as year,
    substr(joining_date,1,2) as month,
    count(*) as no_of_employees
    from Employee
    group by substr(joining_date,7,4),substr(joining_date,1,2)
    order by year,month;
-- 48 Select department, total salary with respect to department from employee table where total salary greater than 800000 total_salary descending
select department,
       sum(salary) as total_salary
from employee
group by department
having sum(salary) > 800000
order by total_salary desc;

-- 49 Select first_name,incentive amount from employee and table for those have incentives
select * from Employee em join Incentives inc
on em.Employee_id = inc.Employee_ref_id;
-- 50 Select first_name,incentive amount from employee and incentive table for those employees who have incentives and incentive greater than 3000
select em.first_name,
       inc.incentive_amount
from employee em
join incentives inc
  on em.employee_id = inc.employee_ref_id
where inc.incentive_amount > 3000;
-- 51  Select first_name,incentive amount from employee and incentive table for those employees who even don't have incentives 
select em.first_name,
       inc.incentive_amount
from employee em
left join incentives inc
  on em.employee_id = inc.employee_ref_id;
-- 52 Select first_name,incentive amount from employee and incentive table for those employees who even don't have incentives mark incentive amount as 0 for those who don't have incentives
select 
    em.first_name,
    coalesce(inc.incentive_amount, 0) as incentive_amount
from employee em
left join incentives inc
    on em.employee_id = inc.employee_ref_id;
-- 53 Select first_name,incentive amount from employee and incentive table for those employees who  got incentive using left join
select 
    em.first_name,
    0 as incentive_amount
from employee em
left join incentives inc
    on em.employee_id = inc.employee_ref_id
where inc.employee_ref_id is null;
-- 54 Select max  incentive with respect to employee from employee and incentive table using sub query
select em.first_name,
       (select max(inc.incentive_amount)
        from incentives inc
        where inc.employee_ref_id = em.employee_id) as max_incentive
from employee em;

-- 55 Select top2 salary from employee table 
select salary
from employee
order by salary desc
limit 2;
-- 56 Select top N salary from employee table 
select *
from employee
order by salary desc
limit 12 ;  
-- 57 Select 2nd Highesh salary from employee table
select max(salary) as second_highest_salary
from employee
where salary < (select max(salary) from employee);
-- 58 Select N Highesh salary from employee table
select max(salary) as highest_salary
from employee;










