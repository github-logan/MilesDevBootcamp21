CREATE TABLE `availabilityStatuses` (
  `av_StatusID` INTEGER PRIMARY KEY,
  `statusName` varchar(100),
  `status_dx` varchar(200)
);

CREATE TABLE `classes` (
  `classID` INTEGER PRIMARY KEY,
  `class_name` varchar(100),
  `class_dx` varchar(200),
  `numberOfLevels` INT
);

CREATE TABLE `guests` (
  `guestID` INTEGER PRIMARY KEY,
  `first_name` varchar(100),
  `last_name` varchar(100),
  `notes` varchar(200),
  `birthday` TEXT,
  `cakeday` TEXT,
  `guest_statusID` INT
);

CREATE TABLE `guestLevels` (
  `rowID` INTEGER PRIMARY KEY,
  `guestID` INT,
  `classID` INT,
  `current_level` INT
);

CREATE TABLE `guestStatuses` (
  `guest_statusID` INTEGER PRIMARY KEY,
  `guestStatus_name` varchar(100),
  `guestStatus_dx` varchar(200)
);

CREATE TABLE `inventoryItems` (
  `itemID` INTEGER PRIMARY KEY,
  `supplyTypeID` INT,
  `item_name` varchar(100),
  `item_dx` varchar(200),
  `item_unit` varchar(100),
  `cost_per_unit` FLOAT
);

CREATE TABLE `inventoryStatuses` (
  `i_statusID` INTEGER PRIMARY KEY,
  `itemID` INT,
  `tavernID` INT,
  `av_StatusID` INT,
  `currentStock` INT,
  `lastUpdated` TEXT
);

CREATE TABLE `locations` (
  `locationID` INTEGER PRIMARY KEY,
  `address` varchar(250)
);

CREATE TABLE `orders` (
  `orderID` INTEGER PRIMARY KEY,
  `tavernID` INT,
  `itemID` INT,
  `quantity` INT,
  `cost` FLOAT,
  `order_date` TEXT
);

CREATE TABLE `owners` (
  `ownerID` INTEGER PRIMARY KEY,
  `name` Varchar(100),
  `tavernID` INT
);

CREATE TABLE `receivables` (
  `receivableID` INTEGER PRIMARY KEY,
  `orderID` INT,
  `date_received` TEXT
);

CREATE TABLE `roles` (
  `roleID` INTEGER PRIMARY KEY,
  `name` Varchar(100),
  `role_description` varchar(250)
);

CREATE TABLE `sales` (
  `saleID` INTEGER PRIMARY KEY,
  `tavernID` INT,
  `serviceID` INT,
  `quantity_sold` INT,
  `price` FLOAT,
  `date_purchased` TEXT,
  `guestID` INT
);

CREATE TABLE `services` (
  `serviceID` INTEGER PRIMARY KEY,
  `supplyTypeID` INT,
  `service_name` varchar(100),
  `service_dx` varchar(200),
  `service_unit` varchar(100),
  `price_per_unit` FLOAT
);

CREATE TABLE `serviceStatuses` (
  `s_statusID` INTEGER PRIMARY KEY,
  `serviceID` INT,
  `tavernID` INT,
  `av_StatusID` INT,
  `numberOfUnits` INT,
  `lastUpdated` TEXT
);

CREATE TABLE `supplyTypes` (
  `supplyTypeID` INTEGER PRIMARY KEY,
  `type_Name` varchar(100),
  `type_dx` varchar(200),
  `type_example` varchar(150)
);

CREATE TABLE `taverns` (
  `tavernID` INTEGER PRIMARY KEY,
  `name` varchar(100),
  `ownerID` INT,
  `locationID` INT,
  `numberOfFloors` INT
);

CREATE TABLE `users` (
  `userID` INTEGER PRIMARY KEY,
  `name` varchar(100),
  `tavernID` INT,
  `roleID` INT
);

ALTER TABLE `guests` ADD FOREIGN KEY (`guest_statusID`) REFERENCES `guestStatuses` (`guest_statusID`);

ALTER TABLE `guestLevels` ADD FOREIGN KEY (`guestID`) REFERENCES `guests` (`guestID`);

ALTER TABLE `guestLevels` ADD FOREIGN KEY (`classID`) REFERENCES `classes` (`classID`);

ALTER TABLE `inventoryItems` ADD FOREIGN KEY (`supplyTypeID`) REFERENCES `supplyTypes` (`supplyTypeID`);

ALTER TABLE `inventoryStatuses` ADD FOREIGN KEY (`itemID`) REFERENCES `inventoryItems` (`itemID`);

ALTER TABLE `inventoryStatuses` ADD FOREIGN KEY (`tavernID`) REFERENCES `taverns` (`tavernID`);

ALTER TABLE `inventoryStatuses` ADD FOREIGN KEY (`av_StatusID`) REFERENCES `availabilityStatuses` (`av_StatusID`);

ALTER TABLE `orders` ADD FOREIGN KEY (`tavernID`) REFERENCES `taverns` (`tavernID`);

ALTER TABLE `orders` ADD FOREIGN KEY (`itemID`) REFERENCES `inventoryItems` (`itemID`);

ALTER TABLE `owners` ADD FOREIGN KEY (`tavernID`) REFERENCES `taverns` (`tavernID`);

ALTER TABLE `receivables` ADD FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`);

ALTER TABLE `sales` ADD FOREIGN KEY (`tavernID`) REFERENCES `taverns` (`tavernID`);

ALTER TABLE `sales` ADD FOREIGN KEY (`serviceID`) REFERENCES `services` (`serviceID`);

ALTER TABLE `sales` ADD FOREIGN KEY (`guestID`) REFERENCES `guests` (`guestID`);

ALTER TABLE `services` ADD FOREIGN KEY (`supplyTypeID`) REFERENCES `supplyTypes` (`supplyTypeID`);

ALTER TABLE `serviceStatuses` ADD FOREIGN KEY (`serviceID`) REFERENCES `services` (`serviceID`);

ALTER TABLE `serviceStatuses` ADD FOREIGN KEY (`tavernID`) REFERENCES `taverns` (`tavernID`);

ALTER TABLE `serviceStatuses` ADD FOREIGN KEY (`av_StatusID`) REFERENCES `availabilityStatuses` (`av_StatusID`);

ALTER TABLE `taverns` ADD FOREIGN KEY (`ownerID`) REFERENCES `owners` (`ownerID`);

ALTER TABLE `taverns` ADD FOREIGN KEY (`locationID`) REFERENCES `locations` (`locationID`);

ALTER TABLE `users` ADD FOREIGN KEY (`tavernID`) REFERENCES `taverns` (`tavernID`);

ALTER TABLE `users` ADD FOREIGN KEY (`roleID`) REFERENCES `roles` (`roleID`);
