-- Exploratory Data Analysis

Select max(total_laid_off), max(percentage_laid_off)
From layoff_staging2;

Select *
from layoff_staging2
where percentage_laid_off = 1
order by funds_raised_millions desc;

select company, sum(total_laid_off)
from layoff_staging2
group by company
order by 2 desc;

select min(`date`), max(`date`)
from layoff_staging2;

select company, sum(total_laid_off)
from layoff_staging2
group by company
order by 2 desc;

select  year(`date`), sum(total_laid_off)
from layoff_staging2
group by year(`date`)
order by 1 desc;

select substring(`date`,1,7) as `Month`, sum(total_laid_off)
From layoff_staging2
where substring(`date`, 1,7) is not null
group by `Month`
order by 1 asc
;


With Rolling_Total as
(
select substring(`date`,1,7) as `Month`, sum(total_laid_off) as total_off
From layoff_staging2
where substring(`date`, 1,7) is not null
group by `Month`
order by 1 asc
)
Select `Month`, total_off
,sum(total_off) over(order by `Month`) as rolling_total
from Rolling_Total;

select company, sum(total_laid_off)
from layoff_staging2
group by company
order by 2 desc;

select company, year(`date`), sum(total_laid_off)
from layoff_staging2
group by company, year(`date`)
order by 3 desc;

WITH company_year (company, years, total_laid_off) as
(
select company, year(`date`), sum(total_laid_off)
from layoff_staging2
group by company, year(`date`)
), company_year_rank as
(select *, 
dense_rank() over (partition by years order by total_laid_off desc) as ranking
from company_year
Where years is not null
)
Select *
from company_year_rank
where ranking <= 5;