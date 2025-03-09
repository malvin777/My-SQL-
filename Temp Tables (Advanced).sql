-- Temporary Table

Create temporary table temp_table
( first_name varchar (50),
last_name varchar (50),
favourite_movie varchar (100)
);


Insert into temp_table
values ('Alex', 'Freberg', 'Lord of the rings; The to towers');

Select*
from temp_table
;
Create temporary table salary_over_50k
Select *
from employee_salary
where salary >= 50000;

select *
from salary_over_50k