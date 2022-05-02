--Checking that all tables display appropriately
SELECT * FROM departments
SELECT * FROM titles
SELECT * FROM employees
SELECT * FROM salaries
SELECT * FROM dept_employee
SELECT * FROM dept_manager

--Step 1: list employee number, last name, first name,
--sex and salary for each employee
SELECT emp_num, last_name, first_name, sex, 
(SELECT salary
	FROM salaries s
	WHERE e.emp_num = s.emp_num) 
FROM employees e;

--Step 2: list first name, last name and hire date
--for employees hired in 1986
SELECT first_name, last_name, hire_date
FROM employees e
WHERE e.hire_date LIKE '%1986';

--Step 3: list manager of each department with following info:
--department number, department name, employee number, first and last name
SELECT dept_num,
(SELECT dept_name
	FROM departments d
	WHERE dm.dept_num = d.dept_num),
emp_num,
(SELECT first_name
	FROM employees e
	WHERE dm.emp_num = e.emp_num),
(SELECT last_name
	FROM employees e
	WHERE dm.emp_num = e.emp_num)
FROM dept_manager dm;
