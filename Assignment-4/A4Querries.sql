-- 1. Write a query to return users who have admin roles

SELECT name from users WHERE roleid = 1

-- 2. Write a query to return users who have admin roles and information about their taverns

SELECT users.name, taverns.name, locations.address from users
JOIN taverns ON users.tavernid = taverns.tavernID
JOIN locations ON locations.locationID = taverns.locationid
WHERE roleid = 1

-- 3. Write a query that returns all guests ordered by name (ascending) and their classes and corresponding levels

SELECt last_name, first_name, class_name, current_level FROM guests
JOIN guestLevels on guests.guestid = guestLevels.guestID
JOIN classes on classes.classid = guestLevels.classid
ORDER by last_name ASC


-- 4. Write a query that returns the top 10 sales in terms of sales price and what the services were

SELECT taverns.name AS 'Tavern', services.service_name AS 'Service or Item', sales.price from sales, taverns
JOIN services
on services.serviceid = sales.serviceid
WHERE sales.tavernid = taverns.tavernid
ORDER by price DESC LIMIT 10


-- 5. Write a query that returns guests with 2 or more classes
--Probably needs work b/c it doesn't have any details like names, etc.

select * from guestLevels AS g1
where (select count(*) from guestLevels AS g2
  where g1.guestid = g2.guestid) > 1
order by g1.guestid


-- 6. Write a query that returns guests with 2 or more classes with levels higher than 5
-- Note: Had to use greater than 3 because I didn't have anyone greater than 5

select * from guestLevels AS g1
where (select count(*) from guestLevels AS g2
  where g1.guestid = g2.guestid) > 1 and current_level > 3
order by g1.guestid



-- 7. Write a query that returns guests with ONLY their highest level class

SELECT (SELECT first_name || ' ' || last_name)
AS 'Guest Name', class_name AS 'Highest Class', max(current_level) AS 'Current Level'
from guests, classes, guestLevels
WHERE guestLevels.guestid = guests.guestid AND guestLevels.classID = classes.classID
GROUP BY last_name
ORDER by current_level DESC



-- 8. Write a query that returns guests that stay within a date range. Please remember that guests can stay for more than one night AND not all of the dates they stay have to be in that range (just some of them)

SELECT roomname, taverns.name AS 'Tavern', (SELECT date_arrived || ' thru ' || date_left) AS 'Stay Range',
(SELECT guests.first_name || ' ' || guests.last_name) AS 'Guest Name'
from roomSales, guests, rooms, taverns
WHERE (guests.guestid = roomSales.guestid) AND ((date_arrived BETWEEN '2021-09-01' AND '2021-09-07')
OR (date_left BETWEEN '2021-09-09' AND '2021-09-20')) AND roomSales.roomID = rooms.roomid
AND taverns.tavernid = rooms.tavernID
order by date_arrived
