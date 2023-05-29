CREATE TABLE car(
	car_id SERIAL PRIMARY KEY,
	year INTEGER NOT NULL,
	make VARCHAR(25) NOT NULL,
	model VARCHAR(25) NOT NULL,
	color VARCHAR(20)
);

CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	address VARCHAR(100) NOT NULL,
	phone_number NUMERIC NOT NULL
);

ALTER TABLE car
ADD COLUMN customer_id INTEGER;

ALTER TABLE car
ADD FOREIGN KEY(customer_id) REFERENCES customer(customer_id);

CREATE TABLE invoice(
	invoice_id SERIAL PRIMARY KEY,
	invoice_date TIMESTAMP,
	amount DECIMAL(9,2)
);

ALTER TABLE invoice
ADD COLUMN customer_id INTEGER;

ALTER TABLE invoice
ADD FOREIGN KEY(customer_id) REFERENCES customer(customer_id);

CREATE TABLE employee(
	employee_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	phone INTEGER NOT NULL,
	possition VARCHAR (50) NOT NULL,
	customer_id INTEGER,
	invoice_id INTEGER,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id)
);


ALTER TABLE invoice
ADD COLUMN employee_id INTEGER;

ALTER TABLE invoice
ADD FOREIGN KEY(employee_id) REFERENCES employee(employee_id);

CREATE TABLE inventory(
	stock_id SERIAL PRIMARY KEY,
	make VARCHAR(25) NOT NULL,
	model VARCHAR(25) NOT NULL,
	year INTEGER NOT NULL,
	color VARCHAR(20),
	price DECIMAL(9,2) NOT NULL,
	invoice_id INTEGER,
	FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id)
);

CREATE TABLE services(
	service_date TIMESTAMP,
	service_records VARCHAR(1000),
	car_id INTEGER,
	customer_id INTEGER,
	invoice_id INTEGER,
	FOREIGN KEY (car_id) REFERENCES car(car_id),
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id)
);

ALTER TABLE services
ADD COLUMN employee_id INTEGER;

ALTER TABLE services
ADD FOREIGN KEY(employee_id) REFERENCES employee(employee_id);

CREATE TABLE sales(
	sales_id SERIAL PRIMARY KEY,
	stock_id INTEGER,
	invoice_id INTEGER,
	FOREIGN KEY (stock_id) REFERENCES inventory(stock_id),
	FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id)	
);

