use `employee and their data`;

select * 
from employee_data;

#Now let's say we wanted to look at employees who actually work and Rec Department, we could join tables together or we could use a subquery
#We can do that like this:

select * 
from employee_data
where employee_id in ( select employee_id
					  from employee_salary
                      where dept_id = 1);
                
#So we are using that subquery in the where statement and if we just highlight the subwuery and run it it's basically a list we are selecting from in the outer query

                
select * 
from employee_data
where employee_id in (select employee_id, salary
						from employee_salary
                        where dept_id = 1);


# now if we try to have more than 1 column in the subquery we get an error saying the operand should contain 1 column only 

#We can also use subqueries in the select and the from statements - let's see how we can do this

-- Let's say we want to look at the salaries and compare them to the average salary

SELECT first_name, salary, AVG(salary)
FROM employee_salary;
-- if we run this it's not going to work, we are using columns with an aggregate function so we need to use group by
-- if we do that though we don't exactly get what we want
SELECT first_name, salary, AVG(salary)
FROM employee_salary
GROUP BY first_name, salary;

-- it's giving us the average PER GROUP which we don't want
-- here's a good use for a subquery

SELECT first_name, 
salary, 
(SELECT AVG(salary) 
	FROM employee_salary)
FROM employee_salary;

-- We can also use it in the FROM Statement
-- when we use it here it's almost like we are creating a small table we are querying off of

select * 
from (select gender, Min(age), Max(age), count(age), Avg(age)
from employee_data
group by gender);

-- now this doesn't work because we get an error saying we have to name it

select * 
from (select gender, Min(age) as min_age, Max(age) as max_age, count(age) as total_age_count, Avg(age) as avg_age
from employee_data 
group by gender) as agg_table
group by gender;
					