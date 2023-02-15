-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Table departments:

-- Remove table if it exists
DROP TABLE IF EXISTS departments CASCADE;

CREATE TABLE departments (
	dept_no VARCHAR(30) NOT NULL,
	dept_name VARCHAR(100) NOT NULL,
	PRIMARY KEY (dept_no)
);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Table titles:

-- Remove table if it exists
DROP TABLE IF EXISTS titles;

-- Create the table
CREATE TABLE titles(
	title_id VARCHAR(30) NOT NULL,
	title VARCHAR(30) NOT NULL,
	PRIMARY KEY (title_id)
);
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Table employees:

-- Remove table if it exists
DROP TABLE IF EXISTS employees CASCADE;

CREATE TABLE employees (
	emp_no INT NOT NULL,
	emp_title_id VARCHAR(30) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	sex VARCHAR(10) NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id), 
	PRIMARY KEY(emp_no)
);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Table dept_emp:

--Remove table if it exists
DROP TABLE IF EXISTS dept_emp CASCADE;

CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(30) NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY(emp_no, dept_no)
);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Table managers:

-- Remove table if it exists
DROP TABLE IF EXISTS dept_manager;

-- Create the table
CREATE TABLE dept_manager (
	dept_no VARCHAR(30) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY(dept_no, emp_no)
);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Table salaries:

-- Remove table if it exists
DROP TABLE IF EXISTS salaries;

-- Create the table
CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary BIGINT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY(emp_no)
);


select *
from departments;
select *
from employees;
select *
from dept_emp;
select *
from dept_manager;
select *
from salaries;
select *
from titles;