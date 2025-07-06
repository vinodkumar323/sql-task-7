CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price INT,
    stock INT
);

INSERT INTO products VALUES
(1, 'Laptop', 'Electronics', 55000, 20),
(2, 'Smartphone', 'Electronics', 30000, 35),
(3, 'Headphones', 'Accessories', 2000, 100),
(4, 'Desk Chair', 'Furniture', 7500, 15),
(5, 'Office Table', 'Furniture', 9500, 10),
(6, 'Water Bottle', 'Accessories', 500, 120),
(7, 'Monitor', 'Electronics', 12000, 18),
(8, 'Keyboard', 'Accessories', 1500, 70),
(9, 'Mouse', 'Accessories', 800, 85),
(10, 'Air Conditioner', 'Electronics', 38000, 12),
(11, 'Pen Drive', 'Accessories', 600, 150),
(12, 'TV', 'Electronics', 45000, 8),
(13, 'Bookshelf', 'Furniture', 3000, 22),
(14, 'Lamp', 'Furniture', 2500, 30),
(15, 'Backpack', 'Accessories', 1500, 50);

select*from products;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    product_id INT,
    customer_name VARCHAR(50),
    quantity INT,
    order_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO orders VALUES
(101, 1, 'Arjun', 2, '2024-11-01'),
(102, 2, 'Meera', 1, '2024-11-02'),
(103, 3, 'Rahul', 4, '2024-11-03'),
(104, 5, 'Anjali', 1, '2024-11-04'),
(105, 4, 'Kiran', 3, '2024-11-05'),
(106, 6, 'Priya', 5, '2024-11-06'),
(107, 9, 'Vikram', 2, '2024-11-07'),
(108, 8, 'Sneha', 1, '2024-11-08'),
(109, 11, 'Rohan', 6, '2024-11-09'),
(110, 10, 'Isha', 1, '2024-11-10'),
(111, 13, 'Sameer', 2, '2024-11-11'),
(112, 14, 'Neha', 3, '2024-11-12'),
(113, 12, 'Manoj', 1, '2024-11-13'),
(114, 7, 'Kavya', 2, '2024-11-14'),
(115, 15, 'Dev', 1, '2024-11-15');

select*from orders;

CREATE VIEW order_summary AS
SELECT 
    o.order_id,
    o.customer_name,
    p.product_name,
    p.category,
    o.quantity,
    p.price,
    (o.quantity * p.price) AS total_cost,
    o.order_date
FROM orders o
JOIN products p ON o.product_id = p.product_id;

SELECT * FROM order_summary;

CREATE VIEW high_value_orders AS
SELECT * FROM order_summary
WHERE total_cost > 10000;

select*from high_value_orders;

CREATE VIEW product_sales AS
SELECT 
    p.product_name,
    SUM(o.quantity) AS total_quantity_sold
FROM products p
JOIN orders o ON p.product_id = o.product_id
GROUP BY p.product_name;

select*from product_sales;

DROP VIEW IF EXISTS high_value_orders;
