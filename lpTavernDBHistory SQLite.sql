--- 15-09-2021 19:49:26
--- SQLite
/***** ERROR ******
no such table: guests
 ----- 
SELECT * FROM guests;
*****/

--- 15-09-2021 19:49:41
--- SQLite
/***** ERROR ******
table demo already exists
 ----- 
-- TABLE
CREATE TABLE demo (ID integer primary key, Name varchar(20), Hint text );
CREATE TABLE guests (
  guestID INTEGER PRIMARY KEY,
first_name varchar(100),
  last_name varchar(100),
  contact_info varchar(200)
);
CREATE TABLE inventories (
inventoryID INTEGER PRIMARY KEY,
  itemID INT,
  tavernID INT,
  current_count INT,
  date_updated INT,
  FOREIGN KEY(tavernID) REFERENCES taverns(tavernID),
  FOREIGN KEY(itemID) REFERENCES items(itemID)
);
CREATE TABLE locations (
    locationID INTEGER PRIMARY KEY,
    address varchar(250)
);
CREATE TABLE owners (
    ownerID INTEGER PRIMARY KEY,
  name Varchar(100),
    tavernID INT,
    FOREIGN KEY(tavernID) REFERENCES taverns(tavernID)
);
CREATE TABLE rats (
    ratID INTEGER PRIMARY KEY,
    name varchar(100),
    tavernID INT,
    FOREIGN KEY(tavernID) REFERENCES taverns(tavernID)
);
CREATE TABLE receivables (
  receivableID INTEGER PRIMARY KEY,
  orderID INT,
date_received INT,
FOREIGN KEY(orderID) REFERENCES supplyOrders(orderID)
);
CREATE TABLE roles (
    roleID INTEGER PRIMARY KEY,
  name Varchar(100),
    role_description varchar(250)
);
CREATE TABLE sales (
  saleID INTEGER PRIMARY KEY,
tavernID INT,
  serviceID INT,
  guestID int,
quantity_sold int
  price int,
  date_purchased int, price INTEGER,
  FOREIGN KEY(tavernID) REFERENCES taverns(tavernID),
  FOREIGN KEY(serviceID) REFERENCES services(serviceID),
  FOREIGN KEY(guestID) REFERENCES guests(guestID)
);
CREATE TABLE serviceAvailabilities (
  statusID INTEGER PRIMARY KEY,
  serviceID INT,
    tavernID INT,
  current_status varchar(150),
  FOREIGN KEY(tavernID) REFERENCES taverns(tavernID),
  FOREIGN KEY(serviceID) REFERENCES services(serviceID)
);
CREATE TABLE services (
    serviceID INTEGER PRIMARY KEY,
    service_name varchar(100),
  service_dx varchar(250)
);
CREATE TABLE "supplies" (itemID INTEGER PRIMARY KEY, name varchar(100), price_per_unit INT, unit TEXT);
CREATE TABLE supplyOrders (
  orderID INTEGER PRIMARY KEY,
      tavernID INT,
  itemID INT,
  quantity_ordered INT,
    cost INT,
  order_date INT,
  FOREIGN KEY(tavernID) REFERENCES taverns(tavernID),
  FOREIGN KEY(itemID) REFERENCES items(itemID)

);
CREATE TABLE taverns (
  tavernID INTEGER PRIMARY KEY,
    name varchar(100),
    ownerID INT,
    locationID INT,
    numberOfFloors INT,
    FOREIGN KEY(ownerID) REFERENCES owners(ownerID),
    FOREIGN KEY(locationID) REFERENCES locations(locationID)
);
CREATE TABLE users (
  userID INTEGER PRIMARY KEY,
    name varchar(100),
    tavernID INT,
    roleID INT,
    FOREIGN KEY(tavernID) REFERENCES taverns(tavernID),
    FOREIGN KEY(roleID) REFERENCES roles(roleID)
);
 
-- INDEX
 
-- TRIGGER
 
-- VIEW;
*****/

--- 15-09-2021 19:49:48
--- SQLite
DROP TABLE demo;

--- 15-09-2021 19:50:01
--- SQLite
-- TABLE
CREATE TABLE demo (ID integer primary key, Name varchar(20), Hint text );
CREATE TABLE guests (
  guestID INTEGER PRIMARY KEY,
first_name varchar(100),
  last_name varchar(100),
  contact_info varchar(200)
);
CREATE TABLE inventories (
inventoryID INTEGER PRIMARY KEY,
  itemID INT,
  tavernID INT,
  current_count INT,
  date_updated INT,
  FOREIGN KEY(tavernID) REFERENCES taverns(tavernID),
  FOREIGN KEY(itemID) REFERENCES items(itemID)
);
CREATE TABLE locations (
    locationID INTEGER PRIMARY KEY,
    address varchar(250)
);
CREATE TABLE owners (
    ownerID INTEGER PRIMARY KEY,
  name Varchar(100),
    tavernID INT,
    FOREIGN KEY(tavernID) REFERENCES taverns(tavernID)
);
CREATE TABLE rats (
    ratID INTEGER PRIMARY KEY,
    name varchar(100),
    tavernID INT,
    FOREIGN KEY(tavernID) REFERENCES taverns(tavernID)
);
CREATE TABLE receivables (
  receivableID INTEGER PRIMARY KEY,
  orderID INT,
date_received INT,
FOREIGN KEY(orderID) REFERENCES supplyOrders(orderID)
);
CREATE TABLE roles (
    roleID INTEGER PRIMARY KEY,
  name Varchar(100),
    role_description varchar(250)
);
CREATE TABLE sales (
  saleID INTEGER PRIMARY KEY,
tavernID INT,
  serviceID INT,
  guestID int,
quantity_sold int
  price int,
  date_purchased int, price INTEGER,
  FOREIGN KEY(tavernID) REFERENCES taverns(tavernID),
  FOREIGN KEY(serviceID) REFERENCES services(serviceID),
  FOREIGN KEY(guestID) REFERENCES guests(guestID)
);
CREATE TABLE serviceAvailabilities (
  statusID INTEGER PRIMARY KEY,
  serviceID INT,
    tavernID INT,
  current_status varchar(150),
  FOREIGN KEY(tavernID) REFERENCES taverns(tavernID),
  FOREIGN KEY(serviceID) REFERENCES services(serviceID)
);
CREATE TABLE services (
    serviceID INTEGER PRIMARY KEY,
    service_name varchar(100),
  service_dx varchar(250)
);
CREATE TABLE "supplies" (itemID INTEGER PRIMARY KEY, name varchar(100), price_per_unit INT, unit TEXT);
CREATE TABLE supplyOrders (
  orderID INTEGER PRIMARY KEY,
      tavernID INT,
  itemID INT,
  quantity_ordered INT,
    cost INT,
  order_date INT,
  FOREIGN KEY(tavernID) REFERENCES taverns(tavernID),
  FOREIGN KEY(itemID) REFERENCES items(itemID)

);
CREATE TABLE taverns (
  tavernID INTEGER PRIMARY KEY,
    name varchar(100),
    ownerID INT,
    locationID INT,
    numberOfFloors INT,
    FOREIGN KEY(ownerID) REFERENCES owners(ownerID),
    FOREIGN KEY(locationID) REFERENCES locations(locationID)
);
CREATE TABLE users (
  userID INTEGER PRIMARY KEY,
    name varchar(100),
    tavernID INT,
    roleID INT,
    FOREIGN KEY(tavernID) REFERENCES taverns(tavernID),
    FOREIGN KEY(roleID) REFERENCES roles(roleID)
);
 
-- INDEX
 
-- TRIGGER
 
-- VIEW;

--- 15-09-2021 19:50:05
--- SQLite
SELECT * FROM inventories;

--- 15-09-2021 19:50:12
--- SQLite
SELECT * FROM guests;

--- 15-09-2021 19:50:15
--- SQLite
SELECT * FROM inventories;

--- 15-09-2021 19:50:43
--- SQLite
CREATE TABLE 'SQLite3' (c1 INTEGER,c2 TEXT,c3 TEXT,c4 TEXT);
INSERT INTO 'SQLite3' (c1, c2, c3, c4) VALUES ('1', 'john', 'smith', 'none');
INSERT INTO 'SQLite3' (c1, c2, c3, c4) VALUES ('2', 'mark', 'brown', '555-555-5525');
INSERT INTO 'SQLite3' (c1, c2, c3, c4) VALUES ('3', 'joe', 'black', 'jblack@yahoo.com');
INSERT INTO 'SQLite3' (c1, c2, c3, c4) VALUES ('4', 'chris', 'cooper', 'none');
INSERT INTO 'SQLite3' (c1, c2, c3, c4) VALUES ('5', 'rachel', 'leigh', '555-555-7552');

--- 15-09-2021 19:50:47
--- SQLite
SELECT * FROM inventories;

--- 15-09-2021 19:51:06
--- SQLite
SELECT * FROM receivables;

--- 15-09-2021 19:51:52
--- SQLite
CREATE TABLE 'Schemaguests' (c1 INTEGER,c2 TEXT,c3 TEXT,c4 TEXT);
INSERT INTO 'Schemaguests' (c1, c2, c3, c4) VALUES ('1', 'john', 'smith', 'none');
INSERT INTO 'Schemaguests' (c1, c2, c3, c4) VALUES ('2', 'mark', 'brown', '555-555-5525');
INSERT INTO 'Schemaguests' (c1, c2, c3, c4) VALUES ('3', 'joe', 'black', 'jblack@yahoo.com');
INSERT INTO 'Schemaguests' (c1, c2, c3, c4) VALUES ('4', 'chris', 'cooper', 'none');
INSERT INTO 'Schemaguests' (c1, c2, c3, c4) VALUES ('5', 'rachel', 'leigh', '555-555-7552');

--- 15-09-2021 19:51:56
--- SQLite
SELECT * FROM Schemaguests;

--- 15-09-2021 19:52:06
--- SQLite
DROP TABLE Schemaguests;

--- 15-09-2021 19:53:47
--- SQLite

INSERT INTO sales(tavernID, serviceID, guestID, quantity_sold, price, date_purchased)
VALUES
(1, 1, 1, 10, 100, 02.21), (2, 1, 2, 5, 50, 03.21), (3, 3, 3, 10, 50, 02.21), (3, 2, 4, 50, 700, 08.21),
(4, 5, 5, 1, 5, 09.21);

INSERT INTO guests(first_name, last_name, contact_info)
VALUES
('john', 'smith', 'none'),
('mark', 'brown', '555-555-5525'),
('joe', 'black', 'jblack@yahoo.com'),
('chris', 'cooper', 'none'),
('rachel', 'leigh', '555-555-7552');

--- 15-09-2021 19:54:52
--- SQLite
INSERT INTO supplyOrders(tavernID, itemID, quantity_ordered, cost, order_date)
VALUES
(1, 1, 10, 35, 05.21),
(2, 1, 20, 70, 03.20),
(2, 4, 50, 1000, 04.21),
(3, 4, 10, 200, 05.21),
(5, 6, 5, 25, 03.20);

INSERT into receivables(orderid, date_received)
VALUES
(1, 06.21), (2, 04.20), (3, 05.21), (4, 06.21), (5, 5.20);

INSERT INTO services(service_name, service_dx)
VALUES ('drinks', 'the providing of beverages'),
('food', 'the providing of eatables'),
('room', 'a bed to sleep on'),
('dessert', 'eatables of minimal nutritional value'),
('game', 'cards and such for playing');

INSERT INTO serviceAvailabilities(serviceID, tavernID, current_status)
VALUES (1, 1, 'available'), (2, 1, 'limited'), (3, 2, 'none'), 
(4, 3, 'limited'), (5, 2, 'cards only');

--- 15-09-2021 19:56:50
--- SQLite
/***** ERROR ******
table supplies has no column named tavernID
 ----- 
INSERT into inventories(itemid, tavernid, current_count, date_updated)
VALUES (1, 1, 500, 02.21), (2, 2, 94, 02.21), (3, 3, 500, 12.20),
(4, 1, 10, 02.21), (5, 2, 650, 12.20);

INSERT INTO supplies(name, unit, price_per_unit, tavernID)
VALUES ('beer', 'stein', 3.50, 1),
('good beer', 'stein', 4.50, 2),
('cheap beer', 'stein', 2.50, 3),
('sandwich', 'plate', 20, 1),
('stew', 'bowl', 15, 2),
('cake', 'slice', 5, 5);

INSERT into locations(address)
VALUES ('123 Smith St'), ('45 Brown Rd'), ('6b Cove Ln'), ('89 Birch Way'), ('32 Fjords Dr');


INSERT into rats(name, tavernid)
VALUES ('Snippy', 1), 
('Snappy', 2), ('Snoppy', 3), ('Snuppy', 4), 
('Cliff', 4), ('Stubert', 2);


INSERT into users(name, tavernid, roleid)
VALUES ('Hank', 1, 1),
('John', 2, 1),
('Kaley', 3, 1),
('Rose', 4, 1),
('Tyler', 5, 1),
('Hanna', 1, 2),
('Joe', 2, 3),
('Kyle', 3, 4),
('Rosalyn', 4, 4),
('Timber', 5, 6);



INSERT into roles(name, role_description)
VALUES ('owner', 'runs the joint'),
('sweeper', 'sweeps up'),
('barkeeper', 'pours drinks'),
('helper', 'does odds and ends'),
('assistant helper', 'does dirty jobs'),
('bouncer', 'gets rid of people');

INSERT INTO owners(name, tavernid)
VALUES ('Hank', 1),
('John', 2),
('Kaley', 3),
('Rose', 4),
('Tyler', 5);
*****/

--- 15-09-2021 19:57:22
--- SQLite
INSERT INTO supplies(name, unit, price_per_unit)
VALUES ('beer', 'stein', 3.50),
('good beer', 'stein', 4.50),
('cheap beer', 'stein', 2.50),
('sandwich', 'plate', 20),
('stew', 'bowl', 15),
('cake', 'slice', 5);

INSERT into locations(address)
VALUES ('123 Smith St'), ('45 Brown Rd'), ('6b Cove Ln'), ('89 Birch Way'), ('32 Fjords Dr');


INSERT into rats(name, tavernid)
VALUES ('Snippy', 1), 
('Snappy', 2), ('Snoppy', 3), ('Snuppy', 4), 
('Cliff', 4), ('Stubert', 2);


INSERT into users(name, tavernid, roleid)
VALUES ('Hank', 1, 1),
('John', 2, 1),
('Kaley', 3, 1),
('Rose', 4, 1),
('Tyler', 5, 1),
('Hanna', 1, 2),
('Joe', 2, 3),
('Kyle', 3, 4),
('Rosalyn', 4, 4),
('Timber', 5, 6);



INSERT into roles(name, role_description)
VALUES ('owner', 'runs the joint'),
('sweeper', 'sweeps up'),
('barkeeper', 'pours drinks'),
('helper', 'does odds and ends'),
('assistant helper', 'does dirty jobs'),
('bouncer', 'gets rid of people');

INSERT INTO owners(name, tavernid)
VALUES ('Hank', 1),
('John', 2),
('Kaley', 3),
('Rose', 4),
('Tyler', 5);

--- 15-09-2021 19:57:30
--- SQLite
DROP TABLE demo;

--- 15-09-2021 19:57:32
--- SQLite
SELECT * FROM guests;

--- 15-09-2021 19:57:36
--- SQLite
SELECT * FROM inventories;

--- 15-09-2021 19:57:40
--- SQLite
SELECT * FROM locations;

--- 15-09-2021 19:57:44
--- SQLite
SELECT * FROM owners;

--- 15-09-2021 19:57:47
--- SQLite
SELECT * FROM rats;

--- 15-09-2021 19:57:51
--- SQLite
SELECT * FROM receivables;

--- 15-09-2021 19:57:54
--- SQLite
SELECT * FROM roles;

--- 15-09-2021 19:57:57
--- SQLite
SELECT * FROM sales;

--- 15-09-2021 19:58:00
--- SQLite
SELECT * FROM sales;

--- 15-09-2021 19:58:03
--- SQLite
SELECT * FROM serviceAvailabilities;

--- 15-09-2021 19:58:07
--- SQLite
SELECT * FROM services;

--- 15-09-2021 19:58:10
--- SQLite
SELECT * FROM SQLite3;

--- 15-09-2021 19:58:16
--- SQLite
DROP TABLE SQLite3;

--- 15-09-2021 19:58:19
--- SQLite
SELECT * FROM supplies;

--- 15-09-2021 19:58:24
--- SQLite
SELECT * FROM supplyOrders;

--- 15-09-2021 19:58:27
--- SQLite
SELECT * FROM taverns;

--- 15-09-2021 19:58:30
--- SQLite
SELECT * FROM users;

--- 15-09-2021 19:59:11
--- SQLite
INSERT INTO taverns(name, ownerid, locationid, numberoffloors)
VALUES ('Mended Drum', 1, 1, 4), ('Repaired Bongos', 2, 2, 3), ('Restored Gong', 3, 3, 1), ('Improved Piano', 4, 4, 3), 
('Overturned Bucket', 5, 5, 1);

--- 15-09-2021 19:59:14
--- SQLite
SELECT * FROM taverns;

