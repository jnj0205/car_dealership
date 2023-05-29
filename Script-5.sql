SELECT*
FROM employee;

CREATE OR REPLACE PROCEDURE add_new_employee(
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  phone VARCHAR(20),
  possition VARCHAR(75)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO employee (first_name, last_name, phone, possition)
  	VALUES (first_name, last_name, phone, possition);
END;
$$;

CALL add_new_employee('anna', 'dana', '223-333-4433', 'sales assistant');
CALL add_new_employee('tom', 'tom', '112-333-1414', 'mechanic');

CREATE OR REPLACE PROCEDURE add_customer(
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  address VARCHAR(100),
  phone_number VARCHAR(20),
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO customer(first_name, last_name, address, phone_number, new_customer)
  	VALUES (first_name, last_name, address, phone_number, new_customer);
END;
$$;

SELECT *
FROM customer;

CALL add_customer('anna', 'jazz', '1 main st', '222-323-1232', TRUE);
CALL add_customer('tim', 'tomson', '11 dice st', '333-222-1313', TRUE);

CREATE OR REPLACE PROCEDURE new_inventory(make VARCHAR(25), model VARCHAR(25), "year" INTEGER, color VARCHAR(20), price DECIMAL(9,2), invoice_id INTEGER)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT into vehicle(make, model,"year", color, price, customer_id)
	VALUES (make, model,"year", color, price, customer_id);
END;
$$;


