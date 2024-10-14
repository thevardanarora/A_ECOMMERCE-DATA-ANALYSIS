CREATE DATABASE EmployeeManagement;

USE EmployeeManagement;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    position VARCHAR(100),
    salary DECIMAL(10, 2),
    hire_date DATE,
    department VARCHAR(100),
    status ENUM('active', 'inactive')
);

select * from employees;

DESCRIBE employees;
SELECT employee_id, first_name, last_name, position, salary, department FROM employees;

