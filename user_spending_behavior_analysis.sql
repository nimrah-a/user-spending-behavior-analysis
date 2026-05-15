-- Reset tables (safe to run multiple times)
DROP TABLE IF EXISTS Purchases;
DROP TABLE IF EXISTS Users;

-- Create Users table
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(50)
);

-- Create Purchases table
CREATE TABLE Purchases (
    purchase_id INT PRIMARY KEY,
    user_id INT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    amount DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Insert Users
INSERT INTO Users VALUES (1, 'Alex');
INSERT INTO Users VALUES (2, 'Ana');
INSERT INTO Users VALUES (3, 'Hamza');
INSERT INTO Users VALUES (4, 'Sarah');
INSERT INTO Users VALUES (5, 'Nadia');

-- Insert Purchases
INSERT INTO Purchases VALUES (101, 1, 'MacBook', 'Electronics', 1299.99);
INSERT INTO Purchases VALUES (102, 1, 'MacBook Case', 'Electronics', 49.99);

INSERT INTO Purchases VALUES (103, 2, 'Running Shoes', 'Fitness', 75.00);
INSERT INTO Purchases VALUES (104, 2, 'Water Bottle', 'Fitness', 15.50);
INSERT INTO Purchases VALUES (111, 2, 'iPad with Apple Pencil', 'Electronics', 899.99);

INSERT INTO Purchases VALUES (105, 3, 'Backpack', 'School', 45.00);
INSERT INTO Purchases VALUES (106, 3, 'Notebook', 'School', 8.99);

INSERT INTO Purchases VALUES (107, 4, 'Desk Lamp', 'Home', 22.75);
INSERT INTO Purchases VALUES (108, 4, 'Beats Headphones', 'Electronics', 199.99);

INSERT INTO Purchases VALUES (109, 5, 'Planner', 'Productivity', 12.99);
INSERT INTO Purchases VALUES (110, 5, 'Journal', 'Self-Care', 9.99);

-- 1. View all user purchases
SELECT u.user_name, p.product_name, p.category, p.amount
FROM Users u
JOIN Purchases p ON u.user_id = p.user_id;

-- 2. Total spent per user
SELECT u.user_name, SUM(p.amount) AS total_spent
FROM Users u
JOIN Purchases p ON u.user_id = p.user_id
GROUP BY u.user_name
ORDER BY total_spent DESC;

-- 3. Highest spending user
SELECT u.user_name, SUM(p.amount) AS total_spent
FROM Users u
JOIN Purchases p ON u.user_id = p.user_id
GROUP BY u.user_name
ORDER BY total_spent DESC
LIMIT 1;

-- 4. Most popular category
SELECT category, COUNT(*) AS total_purchases
FROM Purchases
GROUP BY category
ORDER BY total_purchases DESC;

-- 5. Average spending per user
SELECT u.user_name, AVG(p.amount) AS avg_spent
FROM Users u
JOIN Purchases p ON u.user_id = p.user_id
GROUP BY u.user_name;
