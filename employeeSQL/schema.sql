-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/mRLF39
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "employees" (
    "emp_num" int   NOT NULL,
    "emp_title_id" varchar   NOT NULL,
    "birthdate" varchar   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "sex" varchar   NOT NULL,
    "hire_date" varchar   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_num"
     )
);

CREATE TABLE "salaries" (
    "emp_num" int   NOT NULL,
    "salary" int   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_num"
     )
);

CREATE TABLE "titles" (
    "title_id" varchar   NOT NULL,
    "title" varchar   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "dept_manager" (
    "dept_num" varchar   NOT NULL,
    "emp_num" int   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "emp_num"
     )
);

CREATE TABLE "dept_employee" (
    "emp_num" int   NOT NULL,
    "dept_num" varchar   NOT NULL,
    CONSTRAINT "pk_dept_employee" PRIMARY KEY (
        "emp_num"
     )
);

CREATE TABLE "departments" (
    "dept_num" varchar   NOT NULL,
    "dept_name" varchar   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_num"
     )
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_num" FOREIGN KEY("emp_num")
REFERENCES "employees" ("emp_num");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_num" FOREIGN KEY("dept_num")
REFERENCES "departments" ("dept_num");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_num" FOREIGN KEY("emp_num")
REFERENCES "employees" ("emp_num");

ALTER TABLE "dept_employee" ADD CONSTRAINT "fk_dept_employee_emp_num" FOREIGN KEY("emp_num")
REFERENCES "employees" ("emp_num");

ALTER TABLE "dept_employee" ADD CONSTRAINT "fk_dept_employee_dept_num" FOREIGN KEY("dept_num")
REFERENCES "departments" ("dept_num");

