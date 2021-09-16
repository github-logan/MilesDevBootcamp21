-- TABLE
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
 
-- VIEW
 
