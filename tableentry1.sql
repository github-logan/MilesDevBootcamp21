
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
quantity_sold int,
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

CREATE TABLE "supplies" (
  itemID INTEGER PRIMARY KEY,
  name varchar(100),
  price_per_unit INT,
  unit TEXT
);

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

--table data entries --

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

INSERT INTO supplyOrders(tavernID, itemID, quantity_ordered, cost, order_date)
VALUES
(1, 1, 10, 35, 05.21),
(2, 1, 20, 70, 03.20),
(2, 4, 50, 1000, 04.21),
(3, 4, 10, 200, 05.21),
(5, 6, 5, 25, 03.20);

INSERT into receivables(orderID, date_received)
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


INSERT INTO supplies(name, unit, price_per_unit)
VALUES ('beer', 'stein', 3.50),
('good beer', 'stein', 4.50),
('cheap beer', 'stein', 2.50),
('sandwich', 'plate', 20),
('stew', 'bowl', 15),
('cake', 'slice', 5);

INSERT into locations(address)
VALUES ('123 Smith St'), ('45 Brown Rd'), ('6b Cove Ln'), ('89 Birch Way'), ('32 Fjords Dr');


INSERT into rats(name, tavernID)
VALUES ('Snippy', 1),
('Snappy', 2), ('Snoppy', 3), ('Snuppy', 4),
('Cliff', 4), ('Stubert', 2);


INSERT into users(name, tavernID, roleID)
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

INSERT INTO roles(name, role_description)
VALUES ('owner', 'runs the joint'),
('sweeper', 'sweeps up'),
('barkeeper', 'pours drinks'),
('helper', 'does odds and ends'),
('assistant helper', 'does dirty jobs'),
('bouncer', 'gets rid of people');

INSERT INTO owners(name, tavernID)
VALUES ('Hank', 1),
('John', 2),
('Kaley', 3),
('Rose', 4),
('Tyler', 5);

INSERT INTO taverns(name, ownerID, locationID, numberOffloors)
VALUES ('Mended Drum', 1, 1, 4), ('Repaired Bongos', 2, 2, 3), ('Restored Gong', 3, 3, 1), ('Improved Piano', 4, 4, 3),
('Overturned Bucket', 5, 5, 1);
