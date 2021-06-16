--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
--select tables with relevant information

select * from salaries
select * from employees
--create view displaying the required output
CREATE VIEW step1 AS
	SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
	FROM employees, salaries
	WHERE employees.emp_no = salaries.emp_no;
--verify it worked
select * from step1
--drop view
DROP VIEW step1

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
--create hire date column on employee table in datetime format

ALTER TABLE employees
ADD hiredate DATE;
--update new date column with varchar information
UPDATE employees 
SET hiredate=TO_DATE(hire_date,'MM/DD/YYYY');
--verify it worked
SELECT * FROM employees
--create view to show requested info
CREATE VIEW step2 AS 
	SELECT employees.first_name, employees.last_name, employees.hiredate
	FROM employees;
--select and list the employees using between
select * from step2 
WHERE step2.hiredate BETWEEN '1986-01-01' AND '1986-12-31';
--drop view
DROP VIEW step2;

--. List the manager of each department with the following information:
--department number, department name, the manager's employee number, last name, first name.

--bring up relevant tables
select * from dept_manager;
select * from employees;
select * from departments;
--create view of the requested information
CREATE VIEW step3 AS
	SELECT  dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
	FROM dept_manager, departments, employees
	WHERE dept_manager.emp_no = employees.emp_no AND departments.dept_no = dept_manager.dept_no;
--Check to see if it worked
select * from step3
DROP VIEW step3

--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

--Pull up relevant tables
select * from employees;
select * from departments
select * from dept_emp;
--create view of requested info
CREATE VIEW step4 AS
	SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name 
	FROM employees, dept_emp, departments
	WHERE dept_emp.emp_no = employees.emp_no AND departments.dept_no = dept_emp.dept_no	
--Check to see if it works
select * from step4;
DROP VIEW step4

--5. List first name, last name, and sex for employees 
--whose first name is "Hercules" and last names begin with "B."
CREATE VIEW step5 AS
	SELECT employees.first_name, employees.last_name, employees.sex
	FROM employees
	WHERE employees.first_name = 'Hercules'	AND employees.last_name LIKE 'B%'
--Check to see if it works
SELECT * FROM step5 
DROP VIEW step5

--6. List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
--relevant tables for obtaining department numbers and name

SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM departments;
--create view listing requested information
CREATE VIEW step6 AS
	SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
	FROM employees, departments, dept_emp
	WHERE employees.emp_no = dept_emp.emp_no AND departments.dept_no = dept_emp.dept_no;
--Check to see if it worked
SELECT * FROM step6 WHERE dept_name = 'Sales';
DROP VIEW step6;

departments.dept_no = dept_emp.dept_no	

-- 7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
CREATE VIEW step7 AS
	SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
	FROM employees, departments, dept_emp
	WHERE employees.emp_no = dept_emp.emp_no AND departments.dept_no = dept_emp.dept_no;
--Check to see if it worked
SELECT * FROM step7 WHERE dept_name = 'Sales' OR dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
CREATE VIEW step8 AS
	SELECT employees.last_name,
			COUNT(employees.last_name) AS count
	FROM employees
	GROUP BY employees.last_name
	ORDER BY count DESC
--Check to see if it worked
SELECT * FROM step8
--All steps complete!
	

