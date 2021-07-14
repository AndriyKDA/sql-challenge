--------------------------------------------------------
--DATA ANLYSIS
--------------------------------------------------------

--1) List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT  employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
ON salaries.emp_no = employees.emp_no;

--2) List first name, last name, and hire date for employees who were hired in 1986.
SELECT  last_name, first_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31' 

--3)List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name.
SELECT  department_manager.dept_no, departments.dept_name, department_manager.emp_no, employees.last_name, employees.first_name
FROM department_manager
JOIN departments ON departments.dept_no = department_manager.dept_no
JOIN employees ON department_manager.emp_no = employees.emp_no;

--4)List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT  employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM department_employees
JOIN departments ON departments.dept_no = department_employees.dept_no
JOIN employees ON employees.emp_no = department_employees.emp_no;

--5)List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT  last_name, first_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6)List all employees in the Sales department, including their employee number, last name, first name, 
--and department name.
SELECT  employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM department_employees
JOIN departments ON departments.dept_no = department_employees.dept_no
JOIN employees ON employees.emp_no = department_employees.emp_no
WHERE dept_name = 'Sales';

--7)List all employees in the Sales and Development departments, including their employee number, last name, 
--first name, and department name.
SELECT  employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM department_employees
JOIN departments ON departments.dept_no = department_employees.dept_no
JOIN employees ON employees.emp_no = department_employees.emp_no
WHERE dept_name IN ('Sales', 'Development');

--8)In descending order, list the frequency count of employee last names, i.e., 
--how many employees share each last name.
SELECT  last_name, COUNT(last_name) AS "frequency_count"
FROM employees
GROUP BY last_name
ORDER BY "frequency_count" DESC;

--BONUS: create a view to read employees' average salary per title in Pandas

CREATE VIEW Average_Salary AS
SELECT ROUND(AVG(salaries.salary),2) AS "AVG salary", titles.title
FROM salaries
JOIN employees ON employees.emp_no = salaries.emp_no
JOIN titles ON titles.title_id = employees.emp_title_id
GROUP by titles.title;

SELECT *
FROM Average_Salary


