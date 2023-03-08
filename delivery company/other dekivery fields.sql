CREATE TABLE food_staff (
    food_staff_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    expiration_date DATE NOT NULL
);


CREATE TABLE household_goods (
    household_goods_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    warranty_period INT NOT NULL
);


CREATE TABLE medicine (
    medicine_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    expiration_date DATE NOT NULL,
    prescription_needed BOOLEAN NOT NULL
);


CREATE TABLE liquor (
    liquor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    alcohol_percentage DECIMAL(10,2) NOT NULL
);


CREATE TABLE clothing (
    clothing_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    size VARCHAR(255) NOT NULL,
    color VARCHAR(255) NOT NULL
);


ALTER TABLE products ADD urgency INT;


CREATE FUNCTION calculate_delivery_fee(order_id INT)
RETURNS DECIMAL(10,2)
BEGIN
    DECLARE delivery_fee DECIMAL(10,2);
    SELECT SUM(o.quantity * p.price * (CASE WHEN p.urgency = 1 THEN 1.2 ELSE 1 END)) INTO delivery_fee
    FROM order_items o
    JOIN products p ON o.product_id = p.product_id
    WHERE o.order_id = order_id;
    RETURN delivery_fee;
END;
