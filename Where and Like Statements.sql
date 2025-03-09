-- WHERE CLAUSE

SELECT *
FROM employee_salary
WHERE first_name = 'Leslie'
;

SELECT *
FROM employee_salary
WHERE salary <=50000
;

SELECT *
FROM employee_demographics
Where gender != 'Female'
OR  NOT birth_date > '1985-01-01'
;
-- 	We have AND, NOT & OR statements

#Lets look at the like statement
-- Special characters % and _---
SELECT *
FROM employee_demographics
WHERE birth_date like '19%'
;