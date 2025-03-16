-- Window Functions

-- windows functions are really powerful and are somewhat like a group by - except they don't roll everything up into 1 row when grouping. 
-- windows functions allow us to look at a partition or a group, but they each keep their own unique rows in the output
-- we will also look at things like Row Numbers, rank, and dense rank

SELECT * 
FROM employee_data;

-- first let's look at group by
SELECT gender, ROUND(AVG(salary),1) as Avg_salary
FROM employee_data ed
JOIN employee_salary sal
	ON ed.employee_id = sal.employee_id
GROUP BY gender
;

SELECT ed.first_name, ed.last_name, gender, AVG(salary) over(partition by gender)
FROM employee_data ed
JOIN employee_salary sal
	ON ed.employee_id = sal.employee_id
;

SELECT ed.first_name, ed.last_name, gender, salary, sum(salary) over(partition by gender order by ed.employee_id) as Rolling_total
FROM employee_data ed
JOIN employee_salary sal
	ON ed.employee_id = sal.employee_id
;

SELECT ed.employee_id, ed.first_name, ed.last_name, gender, salary,
row_number() over(partition by gender )
FROM employee_data ed
JOIN employee_salary sal
	ON ed.employee_id = sal.employee_id
;

SELECT ed.employee_id, ed.first_name, ed.last_name, gender, salary,
row_number() over(partition by gender order by salary desc ) as row_num,
Rank() over(partition by gender order by salary desc) as rank_num
FROM employee_data ed
JOIN employee_salary sal
	ON ed.employee_id = sal.employee_id
;

SELECT ed.employee_id, ed.first_name, ed.last_name, gender, salary,
row_number() over(partition by gender order by salary desc ) as row_num,
Rank() over(partition by gender order by salary desc) as rank_num,
Dense_Rank() over(Partition by gender order by salary desc) as dense_rank_num
FROM employee_data ed
JOIN employee_salary sal
	ON ed.employee_id = sal.employee_id
;




