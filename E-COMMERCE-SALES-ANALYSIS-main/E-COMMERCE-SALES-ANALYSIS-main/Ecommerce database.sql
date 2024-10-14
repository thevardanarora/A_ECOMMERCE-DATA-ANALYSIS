CREATE DATABASE ecommerce_data;

USE ecommerce_data;

-- Create Customer Table
CREATE TABLE `customer` (
    `customer_id` varchar(10) NOT NULL,
    `name` varchar(100) NOT NULL,
    `city` varchar(65) NOT NULL,
    `email` varchar(45) NOT NULL,
    `phone_no` varchar(15) NOT NULL,
    `address` varchar(100) NOT NULL,
    `pin_code` int NOT NULL,
    PRIMARY KEY (`customer_id`)
);

-- Create Product Table
CREATE TABLE `product` (
    `product_id` varchar(10) NOT NULL,
    `product_name` varchar(100) NOT NULL,
    `category` varchar(65) NOT NULL,
    `sub_category` varchar(45) NOT NULL,
    `original_price` double NOT NULL,
    `selling_price` double NOT NULL,
    `stock` int NOT NULL,
    PRIMARY KEY (`product_id`)
);

-- Create Order Details Table
CREATE TABLE `order_details` (
    `order_id` int NOT NULL AUTO_INCREMENT,
    `customer_id` varchar(10) NOT NULL,
    `product_id` varchar(10) NOT NULL,
    `quantity` double NOT NULL,
    `total_price` double NOT NULL,
    `payment_mode` varchar(60) NOT NULL,
    `order_date` datetime DEFAULT NULL,
    `order_status` varchar(20) NOT NULL,
    PRIMARY KEY (`order_id`),
    KEY `customer_id` (`customer_id`),
    KEY `product_id` (`product_id`),
    CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`customer_id`)
        REFERENCES `customer` (`customer_id`),
    CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`)
        REFERENCES `product` (`product_id`)
);

INSERT INTO `customer` (`customer_id`, `name`, `city`, `email`, `phone_no`, `address`, `pin_code`) VALUES
('C001', 'Alice Johnson', 'New York', 'alice@example.com', '1234567890', '123 Elm Street', 10001),
('C002', 'Bob Smith', 'Los Angeles', 'bob@example.com', '2345678901', '456 Maple Avenue', 90001),
('C003', 'Charlie Brown', 'Chicago', 'charlie@example.com', '3456789012', '789 Oak Lane', 60601),
('C004', 'Daisy Miller', 'Houston', 'daisy@example.com', '4567890123', '101 Pine Road', 77001),
('C005', 'Eve Davis', 'Phoenix', 'eve@example.com', '5678901234', '202 Cedar Boulevard', 85001);

INSERT INTO `customer` (`customer_id`, `name`, `city`, `email`, `phone_no`, `address`, `pin_code`) VALUES
('C006', 'Ruchi', 'New York', 'ruchi@example.com', '5678901254', '203 Cedap Boulevarm', 89001);


INSERT INTO `product` (`product_id`, `product_name`, `category`, `sub_category`, `original_price`, `selling_price`, `stock`) VALUES
('P001', 'Laptop', 'Electronics', 'Computers', 1200.00, 1000.00, 50),
('P002', 'Smartphone', 'Electronics', 'Mobile', 800.00, 700.00, 100),
('P003', 'Coffee Maker', 'Home Appliances', 'Kitchen', 150.00, 120.00, 30),
('P004', 'Bluetooth Headphones', 'Electronics', 'Audio', 200.00, 150.00, 40),
('P005', 'Washing Machine', 'Home Appliances', 'Laundry', 600.00, 550.00, 20);


INSERT INTO `order_details` (`customer_id`, `product_id`, `quantity`, `total_price`, `payment_mode`, `order_date`, `order_status`) VALUES
('C001', 'P001', 1, 1000.00, 'Credit Card', '2024-10-01 10:00:00', 'Shipped'),
('C002', 'P002', 2, 1400.00, 'PayPal', '2024-10-02 11:30:00', 'Processing'),
('C003', 'P003', 1, 120.00, 'Debit Card', '2024-10-03 09:45:00', 'Delivered'),
('C004', 'P004', 3, 450.00, 'Cash', '2024-10-04 15:20:00', 'Pending'),
('C005', 'P005', 1, 550.00, 'Credit Card', '2024-10-05 12:00:00', 'Shipped');

