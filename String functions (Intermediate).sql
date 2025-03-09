-- String Functions
SELECT length('skyfall');

select first_name, length(first_name) 
from employee_demographics
order by 2;

Select upper('Sky') ;
Select lower('sky');

select first_name, upper(first_name)
from employee_demographics;

## Trim, removes the excess space

Select Trim('    sky      ');

Select first_name, 
left(first_name, 4),
right(first_name, 4),
substring(first_name,3,2),
birth_date,
substring(birth_date,6,2) as birth_month
From employee_demographics;

select first_name, replace(first_name, 'a', 'z')
from employee_demographics;

select locate('x', 'alexander');

Select first_name, locate('An', first_name)
from employee_demographics;

Select first_name, last_name,
concat(first_name,' ',last_name) as full_name
from employee_demographics;