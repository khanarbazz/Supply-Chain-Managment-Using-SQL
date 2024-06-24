Create database SCM;
use SCM;

###Creating Tables
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    description TEXT
);

CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100),
    contact_name VARCHAR(100),
    contact_email VARCHAR(100),
    contact_phone VARCHAR(20)
);

CREATE TABLE Inventory (
    product_id INT,
    warehouse_location VARCHAR(50),
    quantity_on_hand INT,
    reorder_level INT,
    PRIMARY KEY (product_id, warehouse_location),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    contact_email VARCHAR(100),
    contact_phone VARCHAR(20),
    address VARCHAR(200)
);

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    quantity_sold INT,
    sale_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    product_id INT,
    supplier_id INT,
    quantity_ordered INT,
    order_date DATE,
    delivery_date DATE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

#################################################          DML  COMMANDS        ##############################

INSERT INTO Products (product_id, product_name, category, price, description) VALUES
(1, 'Laptop', 'Electronics', 1200.00, 'High-performance laptop'),
(2, 'Smartphone', 'Electronics', 800.00, 'Latest model smartphone'),
(3, 'Desk Chair', 'Furniture', 150.00, 'Ergonomic desk chair'),
(4, 'Coffee Machine', 'Appliances', 120.00, 'Automatic coffee machine'),
(5, 'Tablet', 'Electronics', 500.00, '10-inch display tablet'),
(6, 'Monitor', 'Electronics', 300.00, '27-inch 4K monitor'),
(7, 'Keyboard', 'Accessories', 45.00, 'Mechanical keyboard'),
(8, 'Mouse', 'Accessories', 25.00, 'Wireless mouse'),
(9, 'Printer', 'Electronics', 200.00, 'Multifunction printer'),
(10, 'Desk Lamp', 'Furniture', 35.00, 'LED desk lamp');

-- Insert Suppliers
INSERT INTO Suppliers (supplier_id, supplier_name, contact_name, contact_email, contact_phone) VALUES
(1, 'Tech Supplies Inc.', 'Alice Smith', 'alice@techsupplies.com', '123-456-7890'),
(2, 'Office Essentials', 'Bob Johnson', 'bob@officeessentials.com', '234-567-8901'),
(3, 'Furniture Co.', 'Carol White', 'carol@furnitureco.com', '345-678-9012'),
(4, 'Gadget World', 'David Green', 'david@gadgetworld.com', '456-789-0123'),
(5, 'Home Appliances', 'Eva Brown', 'eva@homeappliances.com', '567-890-1234'),
(6, 'Screen Masters', 'Frank Blue', 'frank@screenmasters.com', '678-901-2345'),
(7, 'Accessory Hub', 'Grace Black', 'grace@accessoryhub.com', '789-012-3456'),
(8, 'Print Solutions', 'Hank Grey', 'hank@printsolutions.com', '890-123-4567'),
(9, 'Light & Bright', 'Ivy Yellow', 'ivy@lightandbright.com', '901-234-5678'),
(10, 'Gizmo Galore', 'Jack Red', 'jack@gizmogalore.com', '012-345-6789');

-- Insert Inventory
INSERT INTO Inventory (product_id, warehouse_location, quantity_on_hand, reorder_level) VALUES
(1, 'Warehouse A', 5, 20),
(2, 'Warehouse A', 120, 30),
(3, 'Warehouse B', 2, 10),
(4, 'Warehouse B', 50, 15),
(5, 'Warehouse C', 8, 25),
(6, 'Warehouse C', 90, 20),
(7, 'Warehouse D', 3, 50),
(8, 'Warehouse D', 15, 40),
(9, 'Warehouse E', 100, 20),
(10, 'Warehouse E', 45, 10);

-- Insert Customers
INSERT INTO Customers (customer_id, customer_name, contact_email, contact_phone, address) VALUES
(1, 'John Doe', 'john.doe@example.com', '111-222-3333', '123 Elm Street'),
(2, 'Jane Smith', 'jane.smith@example.com', '222-333-4444', '456 Oak Avenue'),
(3, 'Bob Johnson', 'bob.johnson@example.com', '333-444-5555', '789 Pine Road'),
(4, 'Alice Brown', 'alice.brown@example.com', '444-555-6666', '101 Maple Lane'),
(5, 'Charlie Black', 'charlie.black@example.com', '555-666-7777', '202 Birch Blvd'),
(6, 'David White', 'david.white@example.com', '666-777-8888', '303 Cedar Circle'),
(7, 'Eve Green', 'eve.green@example.com', '777-888-9999', '404 Spruce Street'),
(8, 'Frank Blue', 'frank.blue@example.com', '888-999-0000', '505 Willow Way'),
(9, 'Grace Red', 'grace.red@example.com', '999-000-1111', '606 Ash Court'),
(10, 'Hank Yellow', 'hank.yellow@example.com', '000-111-2222', '707 Poplar Place');


INSERT INTO Orders (order_id, product_id, supplier_id, quantity_ordered, order_date, delivery_date) VALUES
(1, 1, 1, 50, '2024-01-01', '2024-01-05'),
(2, 2, 2, 75, '2024-01-02', '2024-01-06'),
(3, 3, 3, 30, '2024-01-03', '2024-01-07'),
(4, 4, 4, 40, '2024-01-04', '2024-01-08'),
(5, 5, 5, 60, '2024-01-05', '2024-01-09'),
(6, 6, 6, 45, '2024-01-06', '2024-01-10'),
(7, 7, 7, 90, '2024-01-07', '2024-01-11'),
(8, 8, 8, 70, '2024-01-08', '2024-01-12'),
(9, 9, 9, 35, '2024-01-09', '2024-01-13'),
(10, 10, 10, 100, '2024-01-10', '2024-01-14');


INSERT INTO Sales (sale_id, product_id, customer_id, quantity_sold, sale_date, total_amount) VALUES
(1, 1, 1, 1, '2024-01-01', 1200.00),
(2, 2, 2, 1, '2024-01-02', 800.00),
(3, 3, 3, 2, '2024-01-03', 300.00),
(4, 4, 4, 1, '2024-01-04', 120.00),
(5, 5, 5, 1, '2024-01-05', 500.00),
(6, 6, 6, 1, '2024-01-06', 300.00),
(7, 7, 7, 1, '2024-01-07', 45.00),
(8, 8, 8, 2, '2024-01-08', 50.00),
(9, 9, 9, 1, '2024-01-09', 200.00),
(10, 10, 10, 3, '2024-01-10', 105.00),
(11, 1, 2, 2, '2024-01-11', 2400.00),
(12, 2, 3, 1, '2024-01-12', 800.00),
(13, 3, 4, 3, '2024-01-13', 450.00),
(14, 4, 5, 2, '2024-01-14', 240.00),
(15, 5, 6, 1, '2024-01-15', 500.00),
(16, 6, 7, 2, '2024-01-16', 600.00),
(17, 7, 8, 3, '2024-01-17', 135.00),
(18, 8, 9, 2, '2024-01-18', 50.00),
(19, 9, 10, 1, '2024-01-19', 200.00),
(20, 10, 1, 4, '2024-01-20', 140.00),
(21, 1, 2, 1, '2024-01-21', 1200.00),
(22, 2, 3, 2, '2024-01-22', 1600.00),
(23, 3, 4, 1, '2024-01-23', 150.00),
(24, 4, 5, 3, '2024-01-24', 360.00),
(25, 5, 6, 2, '2024-01-25', 1000.00),
(26, 6, 7, 1, '2024-01-26', 300.00),
(27, 7, 8, 2, '2024-01-27', 90.00),
(28, 8, 9, 3, '2024-01-28', 75.00),
(29, 9, 10, 2, '2024-01-29', 400.00),
(30, 10, 1, 1, '2024-01-30', 35.00),
(31, 1, 2, 3, '2024-01-31', 3600.00),
(32, 2, 3, 2, '2024-02-01', 1600.00),
(33, 3, 4, 1, '2024-02-02', 150.00),
(34, 4, 5, 3, '2024-02-03', 360.00),
(35, 5, 6, 1, '2024-02-04', 500.00),
(36, 6, 7, 2, '2024-02-05', 600.00),
(37, 7, 8, 1, '2024-02-06', 45.00),
(38, 8, 9, 3, '2024-02-07', 75.00),
(39, 9, 10, 2, '2024-02-08', 400.00),
(40, 10, 1, 1, '2024-02-09', 35.00),
(41, 1, 2, 1, '2024-02-10', 1200.00),
(42, 2, 3, 2, '2024-02-11', 1600.00),
(43, 3, 4, 1, '2024-02-12', 150.00),
(44, 4, 5, 2, '2024-02-13', 240.00),
(45, 5, 6, 1, '2024-02-14', 500.00),
(46, 6, 7, 2, '2024-02-15', 600.00),
(47, 7, 8, 3, '2024-02-16', 135.00),
(48, 8, 9, 2, '2024-02-17', 50.00),
(49, 9, 10, 1, '2024-02-18', 200.00),
(50, 10, 1, 3, '2024-02-19', 105.00),
(51, 1, 2, 2, '2024-02-20', 2400.00),
(52, 2, 3, 1, '2024-02-21', 800.00),
(53, 3, 4, 3, '2024-02-22', 450.00),
(54, 4, 5, 2, '2024-02-23', 240.00),
(55, 5, 6, 1, '2024-02-24', 500.00),
(56, 6, 7, 2, '2024-02-25', 600.00),
(57, 7, 8, 3, '2024-02-26', 135.00),
(58, 8, 9, 2, '2024-02-27', 50.00),
(59, 9, 10, 1, '2024-02-28', 200.00),
(60, 10, 1, 4, '2024-02-29', 140.00),
(61, 1, 2, 1, '2024-03-01', 1200.00),
(62, 2, 3, 2, '2024-03-02', 1600.00),
(63, 3, 4, 1, '2024-03-03', 150.00),
(64, 4, 5, 3, '2024-03-04', 360.00),
(65, 5, 6, 2, '2024-03-05', 1000.00),
(66, 6, 7, 1, '2024-03-06', 300.00),
(67, 7, 8, 2, '2024-03-07', 90.00),
(68, 8, 9, 3, '2024-03-08', 75.00),
(69, 9, 10, 2, '2024-03-09', 400.00),
(70, 10, 1, 1, '2024-03-10', 35.00),
(71, 1, 2, 3, '2024-03-11', 3600.00),
(72, 2, 3, 2, '2024-03-12', 1600.00),
(73, 3, 4, 1, '2024-03-13', 150.00),
(74, 4, 5, 3, '2024-03-14', 360.00),
(75, 5, 6, 1, '2024-03-15', 500.00),
(76, 6, 7, 2, '2024-03-16', 600.00),
(77, 7, 8, 1, '2024-03-17', 45.00),
(78, 8, 9, 3, '2024-03-18',47.00);



select * from sales;
select * from inventory;
select * from customers;
select * from suppliers;
select * from orders;

###################################      SUPPLY CHAIN MANAGMENT              ######################################

##Q)Run SQL Quiery to analyse inventory inorder see stocks below safe level


select * 
from
(select product_name as Product_Name,
	   quantity_on_hand as Quantity_on_Hand,
       reorder_level as Reorder_or_safe_Level,
       (quantity_on_hand - reorder_level) as  Below_Safety_Level
from inventory as i
inner join products as p
on i.product_id=p.product_id) as I
where Reorder_or_safe_Level>quantity_on_hand;


##Q)Reorder Recommendation:Find out product which need reordering immediately


select * 
from
(select product_name as Product_Name,
	   quantity_on_hand as Quantity_on_Hand,
       reorder_level as Reorder_or_safe_Level,
       (quantity_on_hand - reorder_level) as  Below_Safety_Level
from inventory as i
inner join products as p
on i.product_id=p.product_id) as I
where reorder_or_safe_level>=Quantity_on_hand
order by Below_safety_level ASC;


##QTop N Analysis:Perform Top N Analysis and find top 5 product 


select *
from
	(select 
           product_name as Product_Name,
		   sum(s.quantity_sold) as Total_Quantity,
           row_number() over (order by sum(s.quantity_sold) desc) as num
	from sales as s
	inner join products as p
	on s.product_id=p.product_id
    GROUP BY 
        p.product_name
	)t
where num<=5;


##Q)Top N analysis : Perform Top N Analysis and find top 5 product categories 


select *
from
	(select 
           Category as Product_Category,
		   sum(s.quantity_sold) as Total_Quantity,
           row_number() over (order by sum(s.quantity_sold) desc) as num
	from sales as s
	inner join products as p
	on s.product_id=p.product_id
    GROUP BY 
        Product_Category
	)t
where num<=5;


##Q)Bottom N Analysis: Perform Bottom N Analysis and find last 5 product 


select *
from
	(select 
           product_name as Product_Name,
		   sum(s.quantity_sold) as Total_Quantity,
           row_number() over (order by sum(s.quantity_sold) asc) as num
	from sales as s
	inner join products as p
	on s.product_id=p.product_id
    GROUP BY 
        p.product_name
	)t
where num<=5;


##Q)Update sales and inventory table as order is made from customer_id 7 and inventory used is Warehouse A


insert into sales values(88, 7, 7, 8, '2024-01-17', 550.99);

update inventory
set quantity_on_hand=quantity_on_hand-8
where warehouse_location='Warehouse_A' and product_id=7;




