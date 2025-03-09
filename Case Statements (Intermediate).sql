## Case Statements

Select first_name, 
last_name,
age,
Case
	when age <= 30 Then 'Young'
    when age between 31 and 50 then 'Old'
    When age >= 50 then 'Very old'
End As Age_bracket
From employee_demographics;



-- Pay Increase and Bonus
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10% bonus

Select *
From employee_salary;


Select first_name, last_name, Salary, 
Case
	when salary < 50000 then salary + (salary * 0.05)
    When salary > 50000 then salary + (salary * 0.07)
End as New_Salary,
Case
	When dept_id = 6 then salary * 0.10
End as Bonus
From employee_salary;
