-- Write a query to return users who have admin roles

SELECT name from users WHERE roleid = 1

-- Write a query to return users who have admin roles and information about their taverns

SELECT users.name, taverns.name, locations.address from users
JOIN taverns ON users.tavernid = taverns.tavernID
JOIN locations ON locations.locationID = taverns.locationid
WHERE roleid = 1

-- Write a query that returns all guests ordered by name (ascending) and their classes and corresponding levels

SELECt last_name, first_name, class_name, current_level FROM guests
JOIN guestLevels on guests.guestid = guestLevels.guestID
JOIN classes on classes.classid = guestLevels.classid
ORDER by last_name ASC


-- Write a query that returns the top 10 sales in terms of sales price and what the services were

SELECT taverns.name AS 'Tavern', services.service_name AS 'Service or Item', sales.price from sales, taverns
JOIN services
on services.serviceid = sales.serviceid
WHERE sales.tavernid = taverns.tavernid
ORDER by price DESC LIMIT 10


-- Write a query that returns guests with 2 or more classes

select * from guestLevels AS g1
where (select count(*) from guestLevels AS g2
  where g1.guestid = g2.guestid) > 1
order by g1.guestid

--Needs work b/c doesn't have any details like names, etc.


-- Write a query that returns guests with 2 or more classes with levels higher than 5
-- Had to use greater than 3 because I didn't have anyone greater than 5

select * from guestLevels AS g1
where (select count(*) from guestLevels AS g2
  where g1.guestid = g2.guestid) > 1 and current_level > 3
order by g1.guestid



-- Write a query that returns guests with ONLY their highest level class


-- Write a query that returns guests that stay within a date range. Please remember that guests can stay for more than one night AND not all of the dates they stay have to be in that range (just some of them)
