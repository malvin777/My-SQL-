-- Triggers and Events

Select *
From employee_demographics;

Select *
From employee_salary;

Delimiter $$
Create trigger employee_insert
	After insert on employee_salary
    for each row
Begin
	insert into employee_demographics (employee_id, first_name, last_name)
    values (new.employee_id, new.first_name, new.last_name);
End $$
Delimiter ;


insert into employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
values(13, 'Jean-Ralphio', 'Saperstein', 'Entertainment 720 CEO', 1000000, null);


-- Events
select *
from employee_demographics;

DELIMITER $$
Create event delete_retirees
on schedule every 30 second
do
begin
	select *
    From employee_demographics
    where age >= 60;
end $$
DELIMITER $$

Show variables like 'event%';