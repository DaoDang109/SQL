CREATE TABLE store (
	store_id smallint PRIMARY KEY,
	store_city varchar (55) NOT NULL,
	store_state text NOT NULL,
	store_manager_id smallint NOT NULL);

INSERT INTO store (store_id, store_city, store_state, store_manager_id)
VALUES  (01, 'Beaverton','OR',01),
	    (02, 'Hillsboro','OR',02),
	    (03, 'Portland','OR',03) ;

SELECT*
FROM store

DROP table vendor;
CREATE TABLE vendor (
	vendor_id SERIAL PRIMARY KEY,
	vendor_name varchar (55) NOT NULL,
	store_id smallint NOT NULL);
	
INSERT INTO vendor (vendor_name, store_id)
VALUES ('Butcher', 01),
	   ('Henz Farm', 01),
	   ('Kroger', 01),
	   ('Kroger', 01),
	   ('Peet', 01),
	   ('Butcher', 02),
	   ('Henz Farm', 02),
	   ('Kroger', 02),
	   ('Kroger', 02),
	   ('Peet', 02),
	   ('Butcher', 03),
	   ('Henz Farm', 03),
	   ('Kroger', 03),
	   ('Kroger', 03),
	   ('Peet', 03);
	   
SELECT*
FROM vendor

DROP Table Product;
CREATE TABLE Product (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    product_price DECIMAL(10, 2) NOT NULL,
    store_id INT NOT NULL,
    vendor_id INT NOT NULL,
    category_id INT NOT NULL,
    store_city VARCHAR(100) NOT NULL,
	FOREIGN KEY(vendor_id) REFERENCES vendor(vendor_id));
	
INSERT INTO product (product_name, product_price, store_id, vendor_id, category_id, store_city)
VALUES ('meat', 10, 01, 1, 1, 'Beaverton'),
		('egg', 5, 01, 2, 2, 'Beaverton'),
		('salad', 4, 01, 3, 3, 'Beaverton'),
		('cookie', 4, 01, 4, 4, 'Beaverton'),
		('coffee', 5, 01, 5, 5, 'Beaverton'),
		('meat', 10, 02, 1, 1, 'Hillsboro'),
		('egg', 5, 02, 2, 2, 'Hillsboro'),
		('salad', 4, 02, 3, 3, 'Hillsboro'),
		('cookie', 4, 02, 4, 4, 'Hillsboro'),
		('coffee', 5, 02, 5, 5, 'Hillsboro'),
		('meat', 10, 03, 1, 1, 'Portland'),
		('egg', 5, 03, 2, 2, 'Portland'),
		('salad', 4, 03, 3, 3, 'Portland'),
		('cookie', 4, 03, 4, 4, 'Portland'),
		('coffee', 5, 03, 5, 5, 'Portland');
		
SELECT*
FROM product;

DROP Table Board_of_Director;
CREATE TABLE Board_of_Director (
    Board_ID SERIAL PRIMARY KEY,
    CEO_name VARCHAR(100) NOT NULL,
	Position_name VARCHAR(100) NOT NULL,
	Payment INT NOT NULL,
	Supplier_ID INT NOT NULL,
	FOREIGN KEY(Supplier_id) REFERENCES Business_partners_suppliers(Supplier_id));
	
INSERT INTO Board_of_Director (CEO_name, Position_name, Payment, Supplier_id)
VALUES ('John Smith', 'Board Member', 1, 1),
		('Sarah Johnson', 'Chief Executive ', 2, 6),
		('Emily Richards', 'Board Member', 3, 2),
		 ('Olivia Bennett', 'Board Member', 4, 7),
		 ('James Anderson', 'Board Member', 5, 3),
		 ('Noah Thomas', 'Board Member', 6, 8),
		 ('Isabella Walker', 'Board Member', 7, 4),
		 ('Ava Harrision', 'Board Member', 8, 9),
		 ('Sophia Evans', 'Board Member', 9, 5),
		 ('Daniel Miller', 'Board Member', 10, 10);
		 
SELECT *
FROM Board_of_Director;
		 
	 
DROP Table Business_partners_suppliers;
CREATE TABLE Business_partners_suppliers (
   Supplier_ID SERIAL PRIMARY KEY,
   Supplier_name VARCHAR(100) NOT NULL);	
   
 INSERT INTO Business_partners_suppliers (Supplier_name)
 VALUES ('GreenTech Supplies'),
 		('CleanWorld Products'),
		('FreshFarm Produce'),
		('AutoParts Co.'),
		('EcoBuild Materials'),
		('Global Logistics'),
		('Oceanic Imports'),
		('Lamb Seafood Co.'),
		('StarTech Solutions'),
		('BlueSky Packaging');
	
SELECT *
FROM Business_partners_suppliers;

DROP Table Store_Manager;
CREATE TABLE Store_Manager (
    Manager_ID SERIAL PRIMARY KEY,
    Manager_name VARCHAR(100) NOT NULL,
	store_id INT NOT NULL,
	Supervisor_ID INT NOT NULL,
	FOREIGN KEY(Supervisor_ID) REFERENCES board_of_director(Board_id),
	FOREIGN KEY(store_id) REFERENCES store(store_id));
	
INSERT INTO Store_Manager (Manager_name, store_id, Supervisor_ID)
VALUES ('Emma Williams', 01, 1 ),
		('William Lee', 02, 2),
		('Ava Martinez', 03, 3);

SELECT *
FROM Store_Manager;


DROP Table Supply_chain_delivery_truck;
CREATE TABLE Supply_chain_delivery_truck (
    Driver_ID SERIAL PRIMARY KEY,
    Store_location INT NOT NULL,
	driver_name VARCHAR(100) NOT NULL,
	Hours INT NOT NULL,
	License_no INT NOT NULL,
	board_payment INT NOT NULL,
	FOREIGN KEY(store_location) REFERENCES store(store_id),
	FOREIGN KEY(board_payment) REFERENCES board_of_director(Board_id));
	
INSERT INTO Supply_chain_delivery_truck(Store_location, Driver_name, Hours, License_no, Board_payment)
VALUES (1, 'Alexander Smith', 30, 2673, 1),
		(2, 'Harold Simmons', 34, 3846, 2),
		(3, 'Marlin Watkins', 40,2584, 3),
		(2, 'Alexis Murphy', 43, 2569, 4),
		 (1, 'Adrian Bell', 28, 2568, 5),
		 (3, 'Joey Evans', 35, 2954, 6),
		 (3, 'Johnny Hughes', 29, 8732, 7),
		 (2, 'Charlie Bryant', 40, 3678, 8),
		 (1, 'Scott Peterson', 21, 2683, 9),
		 (3, 'Martin Sanders', 28, 8537, 10);
		 
SELECT *
FROM Supply_chain_delivery_truck;
	
DROP Table Truck;
CREATE TABLE Truck (
    Truck_ID SERIAL PRIMARY KEY,
    Driver_ID INT NOT NULL,
	Route INT NOT NULL,
	Delivery_date DATE NOT NULL,
	Delivery_status VARCHAR(100) NOT NULL,
	Inventory_load INT NOT NULL,
	Capacity INT NOT NULL,
	FOREIGN KEY(Driver_ID) REFERENCES Supply_chain_delivery_truck(Driver_ID));

INSERT INTO Truck(Driver_ID, Route, Delivery_date, Delivery_status, Inventory_load, Capacity)
VALUES (1, 1, '2024-02-05', 'Deliveried', 500, 500),
	(2, 2, '2024-05-23', 'Deliveried', 335, 380),
	(3, 3, '2024-09-19', 'Shipped', 567, 600),
	(4, 4, '2024-07-24', 'Canceled', 980, 990),
	(5, 5, '2024-10-21', 'Shipped', 235, 300),
	(3, 6, '2024-11-02', 'Pending', 783, 800),
	(1, 7, '2024-04-13', 'Deliveried', 247, 400),
	(4, 8, '2024-06-23', 'Deliveried', 137, 300),
	(1, 9, '2024-02-25', 'Deliveried', 876, 900),
	(5, 10, '2024-01-16', 'Deliveried', 435, 500);
	
SELECT *
FROM Truck;

DROP Table Store_employees;
CREATE TABLE store_employees (
    employ_id SERIAL PRIMARY KEY,
    employ_name VARCHAR(100) NOT NULL,
	store_id INT NOT NULL,
	shift VARCHAR(100) NOT NULL,
	manager_id INT NOT NULL,
	FOREIGN KEY(store_id) REFERENCES store(store_id),
	FOREIGN KEY(manager_id) REFERENCES Store_manager(Manager_ID));
	
INSERT INTO Store_employees(employ_name, store_id, shift, manager_id)
VALUES ('Lavanya Radovana', 1, 'Morning', 1),
	('Judy Wilkins', 2, 'Night', 2),
	('Damian Lewis', 3, 'Afternoon', 3),
	('Nathan Helms', 1, 'Afternoon', 1),
	('Angel Downey', 2, 'Night', 3),
	('Alyssa Post', 3, 'Morning', 2),
	('Abby Gray', 1, 'Morning', 2),
	('Hanna Berry', 2, 'Morning', 1),
	('Quinn Hess', 3, 'Evening', 3),
	('Elias Chambers', 1, 'Morning', 1);

SELECT *
FROM Store_employees;

DROP Table Category;
CREATE TABLE Category (
    Category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL);
	
INSERT INTO Category(Category_name)
VALUES ('Meat'),
		('Dairy'),
		('Produce'),
		('Sweet'),
		('Beverage');
		
SELECT *
FROM Category;

DROP Table Sales_transaction;
CREATE TABLE Sales_transaction (
	Transaction_id SERIAL PRIMARY KEY, 
	Date DATE NOT NULL,
	Store_id SMALLINT NOT NULL,
	Customer_id SMALLINT NOT NULL,
	Sales_collected DECIMAL(10,2) NOT NULL,
	FOREIGN KEY(Store_id) REFERENCES store(store_id));
	
INSERT INTO Sales_transaction (Date, Store_id, Customer_id, Sales_collected)
VALUES ('2024-11-02', 2, 1, 0 ),
		('2024-11-04', 3, 2, 0),
		('2024-11-04', 1, 3, 0),
		('2024-11-05', 1, 4, 0),
		('2024-11-10', 3, 5, 0),
		('2024-11-11', 2, 6, 0),
		('2024-11-15', 1, 7, 0),
		('2024-11-16', 3, 8, 0),
		('2024-11-19', 3, 9, 0),
		('2024-11-22', 2, 10, 0);
		
SELECT *
FROM Sales_transaction;


DROP Table Product_sold_record;
CREATE TABLE Product_sold_record (
    Product_id SMALLINT NOT NULL,
	Transaction_id SMALLINT NOT NULL,
	Store_id SMALLINT NOT NULL,
	Numb_items INT NOT NULL,
	FOREIGN KEY(Product_id) REFERENCES product(product_id),
	FOREIGN KEY(transaction_id) REFERENCES Sales_transaction(transaction_id));
	
INSERT INTO Product_sold_record( Product_id, transaction_id, Store_id, Numb_items)	
VALUES (1, 1, 1, 10),
	(2, 2, 1, 12),
	(3, 3, 1, 15),
	(4, 4, 1, 8),
	(5, 5, 1, 12),
	(1, 1, 2, 8),
	(2, 2, 2, 7),
	(3, 3, 2, 10),
	(4, 4, 2, 11),
	(5, 5, 2, 15),
	(1, 1, 3, 8),
	(2, 2, 3, 15),
	(3, 3, 3, 10),
	(4, 4, 3, 8),
	(5, 5, 3, 12);
	
SELECT *
FROM Product_sold_record;

DROP Table Customer;
CREATE TABLE Customer (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
	customer_zip INT NOT NULL,
	store_id SMALLINT NOT NULL,
	transaction_id SMALLINT NOT NULL,
	FOREIGN KEY(store_id) REFERENCES store(store_id),
	FOREIGN KEY(transaction_id) REFERENCES sales_transaction(transaction_id));
	
INSERT INTO Customer(customer_name, customer_zip, store_id, transaction_id)
VALUES ('David', 97124, 1, 1),
	('Sophia', 98101, 3, 2),
	('Liam', 97008, 2, 3),
	('Noah', 99201, 2, 4),
	('Olivia', 97301, 3, 5),
	('Lucas', 97015, 1, 6),
	('Harper', 97124, 1, 7),
	('Amelia', 98101, 3, 8),
	('Logan', 97008, 2, 9),
	('Charlotte', 97123, 1, 10);
	
SELECT*
FROM Customer;
	
	
SELECT *
FROM vendor;

SELECT *
FROM product;

   

