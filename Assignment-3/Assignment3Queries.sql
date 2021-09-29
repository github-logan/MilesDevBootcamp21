-- #2 Write a query that returns guests with a birthday before 2000.

SELECT * FROM guests
WHERE birthday < '2000-01-01';

-- or:

SELECT * FROM guests
WHERE birthday NOT LIKE '20%';
-- but this way wouldn't work for anyone born in the 22nd century or beyond


-- #3 Write a query to return rooms that cost more than 100 gold a night

SELECT * FROM rooms
where price_per_night > 100;


-- #4 Write a query that returns UNIQUE guest names.

SELECT DISTINCT first_name, last_name FROM guests;


-- #5 Write a query that returns all guests ordered by name (ascending) Use ASC or DESC after your ORDER BY [col]

SELECT * FROM guests
ORDER by last_name ASC;


-- #6 Write a query that returns the top 10 highest price sales

SELECT TOP 10 price FROM sales
order by price ASC;


-- #7 Write a query to return all the values stored in all Lookup Tables - Lookup tables are the tables we reference typically with just an ID and a name. This should be a dynamic combining of all of the tables

SELECT ownerid AS ID, name AS Name, 'Owner' AS Type FROM owners
UNION
SELECT tavernid, name, 'Tavern' FROM taverns
UNION
SELECT locationid, address, 'Location' FROM locations
UNION
SELECT roleid, name, 'Role' FROM roles
UNION
SELECT av_statusid, statusname, 'Availability Status' FROM availabilityStatuses
UNION
SELECT classid, class_name, 'Class' FROM classes
UNION
SELECT guestid, last_name, 'Guest' FROM guests
UNION
SELECT supplytypeid, type_name, 'Supply Type' FROM supplyTypes
order by Type ASC


-- #8 Write a query that returns Guest Classes with Levels and Generate a new column with a label for their level grouping (lvl 1-10, 10-20, etc)

SELECT last_name, first_name, class_name, current_level,
CASE
	WHEN current_level < 2 THEN 'novice'
    WHEN current_level < 4 Then 'apprentice'
	WHEN current_level > 4 THEN 'master'
    Else 'journeyman'
	END AS Ranking
FROM guests
JOIN guestLevels on guests.guestid = guestLevels.guestID
JOIN classes on classes.classid = guestLevels.classid
ORDER by last_name ASC
