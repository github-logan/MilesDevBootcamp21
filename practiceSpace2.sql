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




CREATE TABLE roles (
    roleID INTEGER PRIMARY KEY,
  name Varchar(100),
    role_description varchar(250)
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



CREATE TABLE availabilityStatuses (
  av_StatusID INTEGER PRIMARY KEY,
  statusName varchar(100),
  status_dx varchar(200)
);

CREATE TABLE serviceTypes (
  serviceTypeID INTEGER PRIMARY KEY,
  type_Name varchar(100),
  type_dx varchar(200)
);

CREATE TABLE services (
  serviceID INTEGER PRIMARY KEY,
  serviceTypeID INT,
  service_name varchar(100),
  service_dx varchar(200),
  service_unit varchar(100),
  price_per_unit FLOAT,
  FOREIGN KEY (serviceTypeID) REFERENCES serviceTypes(serviceTypeID)
);


CREATE TABLE serviceStatuses (
  s_statusID INTEGER PRIMARY KEY,
  serviceID INT,
  tavernID INT,
  av_StatusID INT,
  numberOfUnits INT,
  lastUpdated TEXT,
  FOREIGN KEY (serviceID) REFERENCES services(serviceID),
  FOREIGN KEY (tavernID) REFERENCES taverns(tavernID),
  FOREIGN KEY (av_StatusID) REFERENCES availabilityStatuses(av_StatusID)
);

CREATE TABLE sales (
  saleID INTEGER PRIMARY KEY,
  tavernID INT,
  serviceID INT,
  quantity_sold INT,
  price FLOAT,
  date_purchased TEXT,
  guestID INT,
  FOREIGN KEY (serviceID) REFERENCES services(serviceID),
  FOREIGN KEY (guestID) REFERENCES guests(guestID),
  FOREIGN KEY (tavernID) REFERENCES taverns(tavernID)
);


CREATE TABLE inventoryTypes (
  inventoryTypeID INTEGER PRIMARY KEY,
  type_Name varchar(100),
  type_dx varchar(200)
);

CREATE TABLE inventoryItems (
  itemID INTEGER PRIMARY KEY,
  inventoryTypeID INT,
  item_name varchar(100),
  item_dx varchar(200),
  item_unit varchar(100),
  cost_per_unit FLOAT,
  FOREIGN KEY (inventoryTypeID) REFERENCES inventoryTypes(inventoryTypeID)
);

CREATE TABLE inventoryStatuses (
  i_statusID INTEGER PRIMARY KEY,
  itemID INT,
  tavernID INT,
  av_StatusID INT,
  currentStock INT,
  lastUpdated TEXT,
  FOREIGN KEY (itemID) REFERENCES inventoryItems(itemID),
  FOREIGN KEY (tavernID) REFERENCES taverns(tavernID),
  FOREIGN KEY (av_StatusID) REFERENCES availabilityStatuses(av_StatusID)
);

CREATE TABLE orders (
  orderID INTEGER PRIMARY KEY,
  tavernID INT,
  itemID INT,
  quantity INT,
  cost FLOAT,
  order_date TEXT,
  FOREIGN KEY (itemID) REFERENCES inventoryItems(itemID),
  FOREIGN KEY (tavernID) REFERENCES taverns(tavernID)
);

CREATE TABLE receivables (
  receivableID INTEGER PRIMARY KEY,
  orderID INT,
  date_received TEXT,
  FOREIGN KEY (orderID) REFERENCES orders(orderID)
);


INSERT INTO availabilityStatuses(statusName, status_dx)
VALUES ('available', 'ready to use'), ('limited', 'here again gone tomorrow'),
('low', 'reorder soon'), ('out of stock', 'reorder now'), ('discontinued', 'gone forever'),
('unavailable', 'try back later');

INSERT INTO inventoryItems(inventoryTypeID, item_name, item_dx, item_unit, cost_per_unit)
VALUES (1, 'mugs', 'for serving beverages', 'one case of 12',  10.00),
(2, 'napkins', 'to prevent sticky fingers', 'one box of 100', 5.75),
(3, 'mop', 'for cleaning up messes', 'one mop', 5.00),
 (4, 'paper towels', 'for cleaning ugly messes', 'one roll', .50),
 (5, 'chair', 'for sitting in and throwing', 'one chair', 20.75)
 (6, 'good beer', 'for good customers', 'one gallon', 4.50),
 (6, 'bad beer', 'for bad tippers', 'one keg', 1.75);


INSERT INTO inventoryStatuses(itemID, tavernID, av_StatusID, currentStock, lastUpdated)
VALUES (1, 1, 1, 20, '2021-09-15'), (2, 1, 3, 2, '2021-09-15'), (3, 3, 4, 0, '2021-08-05'),
(4, 4, 3, 5, '2021-08-05'), (5, 1, 5, 50, '2021-03-15');


INSERT INTO inventoryTypes(type_Name, type_dx)
VALUES ('reusable service supply', 'things that should last awhile'), ('nonresuable service supply', 'drink umbrellas etc'),
('reusable cleaning supply', 'things that should stick around'), ('nonresuable cleaning supply', 'soap and stuff'),
('general service supply', 'furniture and whatnot'), ('consumable service supply', 'bulk food and beverages');

INSERT INTO orders(tavernID, itemID, quantity, cost, order_date)
VALUES (1, 2, 5, 28.75, '2021-07-17'), (3, 3, 3, 15.00, '2021-09-02'), (3, 5, 10, 207.50, '2021-08-15'),
(4, 1, 2, 20.00, '2021-03-17'), (4, 3, 2, 10.00, '2021-09-02');

INSERT INTO receivables(orderID, date_received)
VALUES (1, '2021-08-15'), (2, '2021-09-05'), (3, '2021-08-22'), (4, '2021-04-15'),
(5, '2021-09-15');


INSERT INTO sales(tavernID, serviceID, quantity_sold, price, date_purchased, guestID)
VALUES (1, 1, 32, 14.40, '2021-08-15', 1), (2, 2, 60, 18.00, '2021-08-15', 2),
(3, 6, 3, 3.75, '2021-08-15', 2), (3, 7, 1, 45.00, '2021-03-18', 3),
(4, 4, 1, 50.00, '2021-07-17', 5), (5, 2, 75, 22.50, '2021-08-15', 1);

INSERT INTO services(serviceTypeID, service_name, service_dx, service_unit, price_per_unit)
VALUES (1, 'good beer', 'fresh and foamy', 'ounce', .45),
(1, 'bad beer', 'dishwater and gasoline', 'ounce', .30), (2, 'single room', 'for the discrete', 'one room per night', 175.00),
(2, 'closet', 'for the thrifty traveler', 'one closet per night', 50.00), (3, 'storage trunk', 'for weapons and gold', 'one trunk per day', 25.00),
(4, 'poker deck', 'bent and marked', 'one deck for two hours', 1.25),
(5, 'cloak mending', 'hem stitching and hole sewing', 'one cloak', 45.00);


INSERT INTO serviceStatuses(serviceID, tavernID, av_StatusID, numberOfUnits, lastUpdated)
VALUES (1, 1, 1, 2500, '2021-09-13'), (2, 1, 5, 0, '2021-09-13'), (3, 1, 2, 3, '2021-08-15'),
(4, 4, 6, 0, '2021-08-15'), (4, 5, 1, 5, '2021-04-28');

INSERT INTO serviceTypes(type_Name, type_dx)
VALUES ('consumables', 'food and beverages'), ('sleeping accommodations', 'single rooms shared spaces and closets'),
('gear renting', 'wagons trunks etc'), ('games', 'cards darts etc'), ('gear repair', 'weapon sharpening etc');








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





INSERT into locations(address)
VALUES ('123 Smith St'), ('45 Brown Rd'), ('6b Cove Ln'), ('89 Birch Way'), ('32 Fjords Dr');

INSERT INTO owners(name, tavernID)
VALUES ('Hank', 1),
('John', 2),
('Kaley', 3),
('Rose', 4),
('Tyler', 5);





INSERT INTO roles(name, role_description)
VALUES ('owner', 'runs the joint'),
('sweeper', 'sweeps up'),
('barkeeper', 'pours drinks'),
('helper', 'does odds and ends'),
('assistant helper', 'does dirty jobs'),
('bouncer', 'gets rid of people');





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