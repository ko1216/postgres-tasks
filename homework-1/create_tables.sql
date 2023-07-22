-- SQL-команды для создания таблиц
CREATE TABLE customers
(
	customer_id varchar(5) PRIMARY KEY NOT NULL,
	company_name varchar(100) NOT NULL,
	contact_name varchar(100) NOT NULL
);

CREATE TABLE employees
(
	employee_id int PRIMARY KEY NOT NULL,
	first_name varchar (100) NOT NULL,
	last_name varchar (100) NOT NULL,
	title varchar (100) NOT NULL,
	birth_date date NOT NULL,
	notes text
);

CREATE TABLE orders
(
	order_id int PRIMARY KEY,
	customer_id varchar(5) REFERENCES customers(customer_id) NOT NULL,
	employee_id int REFERENCES employees(employee_id) NOT NULL,
	order_date date NOT NULL,
	ship_city varchar(100) NOT NULL
);