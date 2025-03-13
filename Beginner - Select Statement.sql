-- SELECT STATEMENET

-- the SELECT statement is used to work with columns and specify what columns you want to work see in your output.

#We can also select a specefic number of column based on our requirement. 

select * 
from `Employee and their data`.employee_data;

#Let's try selecting a specific column
SELECT first_name
FROM employee_data;

#Now let's add some more columns, we just need to separate the columns with columns
SELECT first_name, last_name
FROM employee_data;

#Now the order doesn't normall matter when selecting your columns.
#Names in the select statement will matter, but for this you can put them in any order

SELECT last_name, first_name, gender, age
FROM employee_data;

#You'll also often see SQL queries formatted like this.
SELECT last_name, 
first_name, 
gender, 
age
FROM employee_data;

#The query still runs the exact same, but it is easier to read and pick out the columns
#being selected and what you're doing with them.

#For example let's take a look at using a calculation in the select statement

#You can see here we have the total_money_spent - we can perform calculations on this
SELECT first_name,
 last_name,
 salary + 100 as total_salary
FROM employee_salary;

#See how it's pretty easy to read and to see which columns we are using.

#Math in SQL does follow PEMDAS which stands for Parenthesis, Exponent, Multiplication,
#Division, Addition, subtraction - it's the order of operation for math

#For example - What will the output be?:
SELECT first_name, 
last_name,
salary,
salary + 100
FROM employee_salary;
#This is going to do 10* 100 which is 1000 and then adds the original 540

#Now what will the output be when we do this?
SELECT first_name, 
last_name,
salary,
(salary + 100) * 10
FROM employee_salary;

 -- The DISTINCT Statement - this will return only unique values in
#The output - and you won't have any duplicates

SELECT dept_id
FROM employee_salary;

SELECT DISTINCT dept_id
FROM employee_salary;


