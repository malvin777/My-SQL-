-- Stored Procedures

Select *
From employee_salary
where salary >= 50000;

## To specify the database write the following

Use parks_and_recreation;
Create procedure large_salaries()
select *
from employee_salary
where salary >= 50000;

call large_salaries();