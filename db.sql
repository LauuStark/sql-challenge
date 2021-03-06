-- create all tables 
CREATE TABLE departments (
	dept_no VARCHAR,
	dept_name VARCHAR
);

CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR
);

CREATE TABLE dept_manager (
	dept_no VARCHAR,
	emp_no INT
);

CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	emp_title VARCHAR,
	birth_date VARCHAR,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date VARCHAR
);

CREATE TABLE salaries (
	emp_no INT,
	salary INT,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE titles (
	title_id VARCHAR,
	title VARCHAR
);

DROP TABLE employees CASCADE

--verify that tables have information

SELECT *
FROM employees

-- List the following details of each employee: employee number, last name, first name, sex, and salary. 

CREATE VIEW first_hw AS
SELECT employees.emp_no,
  employees.last_name,
  employees.first_name,
  employees.sex,
  salaries.salary

FROM salaries
INNER JOIN employees ON
salaries.emp_no = employees.emp_no

SELECT * FROM first_hw

--List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date FROM employees
WHERE hire_date > '1/01/1986' AND hire_date < '12/31/1986'

--List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name.

SELECT m.dept_no, m.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_manager m
LEFT JOIN employees e
ON m.emp_no = e.emp_no
LEFT JOIN departments d
ON m.dept_no = d.dept_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT a.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp a
ON a.emp_no = e.emp_no
INNER JOIN departments d
ON a.dept_no = d.dept_no

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
CREATE VIEW sales AS
SELECT a.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp a
ON a.emp_no = e.emp_no
INNER JOIN departments d
ON a.dept_no = d.dept_no

SELECT * FROM sales
WHERE dept_name = 'Sales'

-- List all employees in the Sales and Development departments, including their employee number, last name, 
--first name, and department name.
CREATE VIEW sales_dev AS
SELECT a.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp a
ON a.emp_no = e.emp_no
INNER JOIN departments d
ON a.dept_no = d.dept_no

SELECT * FROM sales_dev
WHERE dept_name = 'Sales' OR dept_name = 'Development'

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) AS "last_name count"
FROM employees
GROUP BY last_name
ORDER BY "last_name count" DESC;

