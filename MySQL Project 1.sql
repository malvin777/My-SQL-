## My SQL Project by Alex the Analyst
-- Data cleaning

Select *
from layoffs;

-- Step 1. Remove duplicates (Done)
-- Step 2. Standardize the data (Done)
-- Step 3. Null values or blank values (Done)
-- Step 4. Remove any columns (Done)

Create Table layoff_staging ## We create a Staging so that we do not change the Raw data ##
like layoffs;

select *
from layoff_staging;

Insert layoff_staging
select *
from layoffs;

## Step 1

select *,
Row_number() over(
Partition by company, industry, total_laid_off, percentage_laid_off, 'date') as row_num
from layoff_staging;

with duplicate_cte as 
(
select *,
Row_number() over(
Partition by company, industry, total_laid_off, percentage_laid_off, 'date', stage, country, funds_raised_millions) as row_num
from layoff_staging
)
select *
from duplicate_cte
where row_num > 1;

select*
From layoff_staging
where company = 'Casper';



CREATE TABLE `layoff_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select*
From layoff_staging2
where row_num >1;

insert into layoff_staging2
select *,
Row_number() over(
Partition by company, industry, total_laid_off, percentage_laid_off, `date`, stage
, country, funds_raised_millions) as row_num
from layoff_staging;

Delete 
from layoff_staging2
where row_num > 1;

Select *
from layoff_staging2;


-- Standardizing data

Select company, trim(company)
From layoff_staging2;

Update layoff_staging2
set company = trim(company);


Select *
from layoff_staging2
where industry like 'crypto';


update layoff_staging2
SET industry = 'Crypto'
where industry like 'Crypto%';

select distinct country
from layoff_staging2
order by 1;

Select distinct country, trim(trailing '.' from country)
from layoff_staging2
order by 1;

update layoff_staging2
set country = trim(trailing '.' from country)
where country like 'United States%';

select `date`,
str_to_date(`date`,'%m/%d/%Y') ##This is date formating using a string(Str_...) FUCNTION
from layoff_staging2;

UPDATE layoff_staging2
Set `date` = str_to_date(`date`,'%m/%d/%Y');

alter table layoff_staging2
Modify column `date` Date;

select *
from layoff_staging2;

-- Step 3 - Removing Null and blank values

select *
from layoff_staging2
where total_laid_off is null
and percentage_laid_off is null;

Select distinct industry
from layoff_staging2;

select *
from layoff_staging2
where industry is null
or industry = '';

select *
from layoff_staging2
where company = 'Airbnb';

update layoff_staging2
Set industry = null
where industry = '';

Select *
From layoff_staging2 t1
join layoff_staging2 t2
	on t1.company = t2.company
    and t1.location = t2.location
where (t1.industry is null or t1.industry = '')
and t2.industry is not null;

update layoff_staging2 t1
join layoff_staging2 t2
	on t1.company = t2.company
set t1.industry = t2.industry
where (t1.industry is null or t1.industry = '')
and t2.industry is not null;

select *
from layoff_staging2
where total_laid_off is null
and percentage_laid_off is null;

delete
from layoff_staging2
where total_laid_off is null
and percentage_laid_off is null;

select*
from layoff_staging2;

alter table layoff_staging2
drop column row_num;