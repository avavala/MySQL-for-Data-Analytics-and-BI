## SELECT STATEMENT

-- Select all data from the “departments” table
SELECT * FROM departments;

-- Select the information from the “dept_no” column of the “departments” table
SELECT dept_no FROM departments;

-- Select all people from the “employees” table whose first name is “Elvis”
SELECT * FROM employees
WHERE first_name = 'Elvis';

-- Retrieve a list with all female employees whose first name is Kellie
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' AND gender = 'F';

-- Retrieve a list with all employees whose first name is either Kellie or Aruna
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie'
        OR first_name = 'Aruna';
        
-- Retrieve a list with all female employees whose first name is either Kellie or Aruna
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND (first_name = 'Kellie'
        OR first_name = 'Aruna');
        
### IN - NOT IN exercises ###
-- Use the IN operator to select all individuals from the “employees” table, whose first name is either “Denis”, or “Elvis”
SELECT * FROM employees
WHERE
    first_name IN ('Denis' , 'Elvis');
-- Extract all records from the ‘employees’ table, aside from those with employees named John, Mark, or Jacob
SELECT * FROM employees
WHERE 
	first_name NOT IN ('John', 'Mark', 'Jacob');
    
### LIKE - NOT LIKE exercises ###
-- Working with the “employees” table, use the LIKE operator to select the data about all individuals, 
-- whose first name starts with “Mark”; specify that the name can be succeeded by any sequence of characters.
SELECT * FROM employees
WHERE 
	first_name LIKE ('Mark%');

-- Retrieve a list with all employees who have been hired in the year 2000.
SELECT * FROM employees
WHERE
	hire_date LIKE ('%2000%');
    
-- Retrieve a list with all employees whose employee number is written with 5 characters, and starts with “1000”. 
SELECT * FROM employees
WHERE 
	emp_no LIKE ('1000_');
    
### Wildcard characters - exercises ###
-- Extract all individuals from the ‘employees’ table whose first name contains “Jack”.
SELECT * FROM employees
WHERE 
	first_name LIKE ('%Jack%');

-- Extract another list containing the names of employees that do not contain “Jack”.
SELECT * FROM employees
WHERE 
	first_name NOT LIKE ('%Jack%');

### BETWEEN - AND excercises ###
-- Select all the information from the “salaries” table regarding contracts from 66,000 to 70,000 dollars per year.
SELECT * FROM salaries
WHERE
    salary BETWEEN 66000 AND 70000;

-- Retrieve a list with all individuals whose employee number is not between ‘10004’ and ‘10012’.
SELECT * FROM employees
WHERE 
	emp_no NOT BETWEEN 10004 AND 10012
;

-- Select the names of all departments with numbers between ‘d003’ and ‘d006’.
SELECT dept_name FROM departments
WHERE 
	dept_no BETWEEN 'd003' AND 'd006'
;

### IS/NOT NULL exercises
-- Select the names of all departments whose department number value is not null
SELECT dept_name FROM departments
WHERE 
	dept_no IS NOT NULL
;

### Comparison exercises ###
-- Retrieve a list with data about all female employees who were hired in the year 2000 or after.
SELECT * FROM employees
	WHERE hire_date >= '2000-01-01' 
		AND gender = 'F'
;

-- Extract a list with all employees’ salaries higher than $150,000 per annum.
SELECT * FROM salaries
WHERE 
	salary >150000
;

### SELECT DISTINCT exercises ###
-- Obtain a list with all different “hire dates” from the “employees” table.
SELECT DISTINCT hire_date 
FROM employees
;

### AGGREGATE FUNCTION exercises ###
-- How many annual contracts with a value higher than or equal to $100,000 have been registered in the salaries table?
SELECT COUNT(*)
	FROM salaries
    WHERE salary >= 100000
;

-- How many managers do we have in the “employees” database?
SELECT COUNT(*)
	FROM dept_manager
;

### ORDER BY exercises ###
-- Select all data from the “employees” table, ordering it by “hire date” in descending order.
SELECT * FROM employees
ORDER BY hire_date DESC
;

-- Select all data from the “employees” table, ordering it by “first name” and "last name"
SELECT * FROM employees
ORDER BY 
	first_name, last_name
;

### GROUP BY exercises ###
-- Write a query that obtains two columns. The first column must contain annual salaries higher than 80,000 dollars. 
-- The second column, renamed to “emps_with_same_salary”, must show the number of employees contracted to that salary. 
-- Lastly, sort the output by the first column.

SELECT 
    salary, COUNT(emp_no) AS emps_with_same_salary
FROM salaries
WHERE
    salary > 80000
GROUP BY salary
ORDER BY 1
;

### HAVING exercise ###

SELECT first_name, COUNT(first_name) AS count_name
FROM employees
WHERE hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name DESC
;

-- Select the employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000.
SELECT emp_no
FROM dept_emp
WHERE from_date > 2000-01-01
GROUP BY emp_no
HAVING COUNT(dept_no) >1
;


