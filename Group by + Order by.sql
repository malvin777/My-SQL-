-- Group By
#This is Day 2

SELECT *
From employee_demographics;


SELECT gender, avg(age), max(age), min(age), count(age)
From employee_demographics
Group by gender
;

SELECT occupation, salary
From employee_salary
Group by occupation, salary
;

-- Order by

SELECT *
From employee_demographics
order by gender, age desc
;