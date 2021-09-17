CREATE TABLE classes (classID INTEGER PRIMARY KEY, class_name varchar(100), class_dx varchar(200), numberOfLevels INT);


CREATE TABLE guestLevels (
  rowID INTEGER PRIMARY KEY,
  guestID INT,
  classID INT,
  current_level INT,
  FOREIGN KEY(guestID) REFERENCES guests(guestID),
  FOREIGN KEY(classID) REFERENCES classes(classID)
);


CREATE TABLE guestStatuses (
  guest_statusID INTEGER PRIMARY KEY,
guestStatus_name varchar(100),
  guestStatus_dx varchar(200)
);


CREATE TABLE guests (
  guestID INTEGER PRIMARY KEY,
first_name varchar(100),
  last_name varchar(100),
  notes varchar(200),
  birthday TEXT,
  cakeday TEXT,
  guest_statusID INT,
  FOREIGN KEY(guest_statusID) REFERENCES guestStatuses(guest_statusID)
);

CREATE TABLE inventories (
inventoryID INTEGER PRIMARY KEY,
  supplyID INT,
  tavernID INT,
  current_count INT,
  date_updated TEXT,
  FOREIGN KEY(tavernID) REFERENCES taverns(tavernID),
  FOREIGN KEY(supplyID) REFERENCES supplies(supplyID)
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
date_received text,
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
  date_purchased TEXT,
  FOREIGN KEY(tavernID) REFERENCES taverns(tavernID),
  FOREIGN KEY(serviceID) REFERENCES services(serviceID),
  FOREIGN KEY(guestID) REFERENCES guests(guestID)
);

CREATE TABLE serviceAvailabilities (
  availabilityID INTEGER PRIMARY KEY,
  serviceID INT,
    tavernID INT,
  serviceStatusID INT,
  FOREIGN KEY(tavernID) REFERENCES taverns(tavernID),
  FOREIGN KEY(serviceID) REFERENCES services(serviceID),
  FOREIGN KEY(serviceStatusID) REFERENCES serviceStatus(serviceStatusID)
);

CREATE TABLE serviceStatuses (
  serviceStatusID INTEGER PRIMARY KEY,
  statusName varchar(100),
  status_dx varchar(200)
);

CREATE TABLE services (
    serviceID INTEGER PRIMARY KEY,
    service_name varchar(100),
  service_dx varchar(250)
);

CREATE TABLE supplies (
  supplyID INTEGER PRIMARY KEY,
  name varchar(100),
  price_per_unit INT,
  unit TEXT
);

CREATE TABLE supplyOrders (
  orderID INTEGER PRIMARY KEY,
      tavernID INT,
  supplyID INT,
  quantity_ordered INT,
    cost INT,
  order_date text,
  FOREIGN KEY(tavernID) REFERENCES taverns(tavernID),
  FOREIGN KEY(supplyID) REFERENCES supplies(supplyID)
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


INSERT into classes(class_name, class_dx, numberOfLevels)
VALUES ('magician', 'guesses your card', 10), ('clown', 'juggles objects', 5),
('archer', 'mobilizes very large darts', 17), ('henchman', 'does dirty work', 30),
('philosopher', 'says simple things longwindedly', 3);


INSERT INTO guests(first_name, last_name, notes, birthday, cakeday, guest_statusID)
VALUES
('john', 'smith', 'none', '1800-02-15', '1995-02-28', 1),
('mark', 'brown', 'sings too loud', '1850-02-15', '1987-02-28', 2),
('joe', 'black', 'keep away from fire', '1800-02-15', '1995-02-28', 2),
('chris', 'cooper', 'none', '1850-02-15', '1987-02-28', 4),
('rachel', 'leigh', 'tips well', '1906-02-15', '2012-02-28', 5);


INSERT INTO guestLevels(guestID, classID, current_level)
VALUES (1, 2, 1), (1, 1, 4), (2, 1, 2), (3, 4, 5), (4, 1, 1);

INSERT INTO guestStatuses(guestStatus_name, guestStatus_dx)
VALUES
('sick', 'will need a bucket soon'), ('fine', 'could use another drink though'),
('hangry', 'hurry up with the food'), ('raging', 'keep sharp objects away'), ('placid', 'could use some free popcorn');


INSERT INTO inventories(supplyID, tavernID, current_count, date_updated)
VALUES (1, 1, 5, "2021-02-15"), (1, 2, 6, "2021-03-15"), (2, 2, 5, "2021-04-08"), (3, 4, 30, "2021-02-15"), (5, 5, 92, "2021-06-04");


INSERT into locations(address)
VALUES ('123 Smith St'), ('45 Brown Rd'), ('6b Cove Ln'), ('89 Birch Way'), ('32 Fjords Dr');

INSERT INTO owners(name, tavernID)
VALUES ('Hank', 1),
('John', 2),
('Kaley', 3),
('Rose', 4),
('Tyler', 5);


INSERT into rats(name, tavernID)
VALUES ('Snippy', 1),
('Snappy', 2), ('Snoppy', 3), ('Snuppy', 4),
('Cliff', 4), ('Stubert', 2);


INSERT into receivables(orderID, date_received)
VALUES
(1, "2021-09-01"), (2, "2021-09-01"), (3, "2021-04-23"), (4, "2021-04-23"), (5, "2021-08-13");


INSERT INTO roles(name, role_description)
VALUES ('owner', 'runs the joint'),
('sweeper', 'sweeps up'),
('barkeeper', 'pours drinks'),
('helper', 'does odds and ends'),
('assistant helper', 'does dirty jobs'),
('bouncer', 'gets rid of people');


INSERT INTO sales(tavernID, serviceID, guestID, quantity_sold, price, date_purchased)
VALUES
(1, 1, 1, 10, 100, "2021-02-23"), (2, 1, 2, 5, 50, "2021-03-15"), (3, 3, 3, 10, 50, "2021-02-23"), (3, 2, 4, 50, 700, "2021-08-13"),
(4, 5, 5, 1, 5, "2021-09-01");


INSERT INTO services(service_name, service_dx)
VALUES ('drinks', 'the providing of beverages'),
('food', 'the providing of eatables'),
('room', 'a bed to sleep on'),
('dessert', 'eatables of minimal nutritional value'),
('game', 'cards and such for playing');


INSERT INTO serviceAvailabilities(serviceID, tavernID, serviceStatusID)
VALUES (1, 1, 1), (2, 1, 2), (3, 2, 3),
(4, 3, 4), (5, 2, 5);

INSERT INTO serviceStatuses(statusName, status_dx)
VALUES ('available', 'get it while it is hot'), ('running low', 'hurry before it is gone'),
('limited', 'now you see it, now you do not'), ('out of stock', 'try again later'),
('discontinued', 'no longer offered');


INSERT INTO supplies(name, unit, price_per_unit)
VALUES ('beer', 'stein', 3.50),
('good beer', 'stein', 4.50),
('cheap beer', 'stein', 2.50),
('sandwich', 'plate', 20),
('stew', 'bowl', 15),
('cake', 'slice', 5);


INSERT INTO supplyOrders(tavernID, supplyID, quantity_ordered, cost, order_date)
VALUES
(1, 1, 10, 35, "2021-02-23"),
(2, 1, 20, 70, "2021-03-15"),
(2, 4, 50, 1000, "2021-02-23"),
(3, 4, 10, 200, "2021-03-15"),
(5, 6, 5, 25, "2021-06-01");


INSERT INTO taverns(name, ownerID, locationID, numberOffloors)
VALUES ('Mended Drum', 1, 1, 4), ('Repaired Bongos', 2, 2, 3), ('Restored Gong', 3, 3, 1), ('Improved Piano', 4, 4, 3),
('Overturned Bucket', 5, 5, 1);


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
