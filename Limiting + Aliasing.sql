-- Limit & Aliasing

Select *
From employee_demographics
Order by age desc
Limit 2, 1
;

-- Aliasing

Select gender, avg(age) as av_g
from employee_demographics
group by gender
having av_g > 40
;