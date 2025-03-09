-- Subqueries

Select *
From employee_demographics
Where employee_id in 
					( select employee_id
						from employee_salary
                        where dept_id = 1)
;


Select first_name, salary, 
(Select avg(salary)
From employee_salary)
From employee_salary;


Select gender,avg(age), max(age), min(age), count(age)
From employee_demographics
group by gender;


Select avg(max_age)
from 
(Select gender,avg(age) as avg_age, max(age) as max_Age, min(age) as min_age, count(age)
From employee_demographics
group by gender) as Agg_Table

;