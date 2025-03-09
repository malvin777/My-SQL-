	SELECT *
    FROM parks_and_recreation.employee_demographics;
    
    SELECT first_name, 
    last_name, 
    birth_date,
    age,
    age +10
    FROM parks_and_recreation.employee_demographics;
    #This is hwo you comment in MySQL
    #In MySQL the mathematical operations that it uses are PEMDAS, in that order of operation. 
    
    Select distinct first_name, gender
    FROM parks_and_recreation.employee_demographics;