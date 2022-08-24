DROP DATABASE IF EXISTS pos;
CREATE DATABASE IF NOT EXISTS pos;
SHOW DATABASES ;
USE pos;

DROP TABLE IF EXISTS customer;
CREATE TABLE IF NOT EXISTS customer(
    custId VARCHAR(6),
    custTitle VARCHAR(5),
    custName VARCHAR(30) ,
    custAddress VARCHAR(30),
    city VARCHAR(20),
    province VARCHAR(20),
    postalCode VARCHAR(9),
    CONSTRAINT PRIMARY KEY (custId)
    );

DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders(
    orderId VARCHAR(6),
    custId VARCHAR(6),
    orderDate DATE,
    orderTime TIME,
    total DECIMAL(8,2),
    CONSTRAINT PRIMARY KEY (orderId),
    CONSTRAINT FOREIGN KEY (custId) REFERENCES customer (custId) ON DELETE CASCADE ON UPDATE CASCADE
    );

DROP TABLE IF EXISTS item;
CREATE TABLE IF NOT EXISTS item(
    itemCode VARCHAR(6),
    description VARCHAR(50),
    packSize VARCHAR(20),
    unitPrice DECIMAL(6,2),
    qtyOnHand INT(5),
    CONSTRAINT PRIMARY KEY (itemCode)
    );
DROP TABLE IF EXISTS order_details;
CREATE TABLE IF NOT EXISTS order_details(
    orderId VARCHAR(6),
    itemCode VARCHAR(6),
    orderQty INT(11),
    discount DECIMAL(6,2),
    CONSTRAINT PRIMARY KEY (orderId, itemCode),
    CONSTRAINT FOREIGN KEY (itemCode) REFERENCES item (itemCode) ON DELETE CASCADE ON UPDATE CASCADE ,
    CONSTRAINT FOREIGN KEY (orderId) REFERENCES orders (orderId) ON DELETE CASCADE ON UPDATE CASCADE
    );

DROP TABLE IF EXISTS login;
CREATE TABLE IF NOT EXISTS login(
    user_name VARCHAR(25) NOT NULL,
    password VARCHAR (25) NOT NULL,
    CONSTRAINT PRIMARY KEY (user_name)
    );
