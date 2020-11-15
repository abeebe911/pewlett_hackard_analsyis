CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" text   NOT NULL,
    "last_name" text   NOT NULL,
    "gender" text  NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "titles" (
    "emp_no" int   NOT NULL,
    "title" text   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
    FOREIGN KEY ("emp_no") REFERENCES "employees"("emp_no")
     
);

CREATE TABLE "departments" (
    "dep_no" text   NOT NULL,
    "dept_name" text   NOT NULL
);

CREATE TABLE "dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" text   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_manager" (
    "dept_no" text   NOT NULL,
    "emp_no" int NOT NULL,
	"from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
    PRIMARY KEY (
        "emp_no"
     )
);

SELECT * FROM departments;
SELECT * FROM titles;

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;