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


Write a query that returns the top 10 sales in terms of sales price and what the services were
Write a query that returns guests with 2 or more classes
Write a query that returns guests with 2 or more classes with levels higher than 5
Write a query that returns guests with ONLY their highest level class
Write a query that returns guests that stay within a date range. Please remember that guests can stay for more than one night AND not all of the dates they stay have to be in that range (just some of them)
