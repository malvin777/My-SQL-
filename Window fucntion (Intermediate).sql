-- Window Fuctions

Select gender, avg(salary) as avg_salary
From employee_demographics dem
Join employee_salary sal
	on dem.employee_id = sal.employee_id
Group by gender;


Select gender, avg(salary) over(partition by gender )
From employee_demographics dem
Join employee_salary sal
	on dem.employee_id = sal.employee_id;



## Rolling total (It adds all the totals for the two groups
Select dem.first_name, dem.last_name, gender, salary,
sum(salary) over(partition by gender order by dem.employee_id) as rolling_total
From employee_demographics dem
Join employee_salary sal
	on dem.employee_id = sal.employee_id;


Select dem.first_name, dem.last_name, gender, salary,
row_number() over(partition by gender order by salary desc) as row_num,
rank() over(partition by gender order by salary desc) rank_num,
dense_rank() over(partition by gender order by salary desc) dense_rank_num
From employee_demographics dem
Join employee_salary sal
	on dem.employee_id = sal.employee_id;