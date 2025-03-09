-- Day 3 JOINS --

SELECT *
FROM employee_salary;

SELECT dem.employee_id, age, occupation ##Everything after "select" indicates what to select.
FROM employee_demographics as dem
INNER JOIN employee_salary as sal
	on dem.employee_id = sal.employee_id

;

-- Outer Join

Select *
From employee_demographics as Dem
right join employee_salary as Sal ##Joins the tables from right to left, starting with employee-salary hence it will produce "null" for missing values.
	On Dem.employee_id = Sal.employee_id
;    

-- Self Join
Select emp1.employee_id as emp_santa,
emp1.first_name as first_name_santa,
emp1.last_name as last_name_santa,
emp2.employee_id as emp_name,
emp2.first_name as first_name_emp,
emp2.last_name as last_name_emp

FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id +1 = emp2.employee_id
;


-- Joining multiple tables together

SELECT *
FROM employee_demographics as dem ##Even though employee_demographics has no common element with parks, but because we joined it to employee_salary, we can reference and join it
INNER JOIN employee_salary as sal
	on dem.employee_id = sal.employee_id
inner join parks_departments pd
	on sal.dept_id = pd.department_id
;
Select *
From parks_departments;