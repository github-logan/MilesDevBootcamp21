-- 1. Write a query to return a “report” of all users and their roles

select taverns.name AS 'Tavern Name', locations.address, users.name AS 'User Name', roles.name AS 'Role' , roles.role_description AS 'Description'
from users
inner join roles on users.roleID = roles.roleID
inner join taverns on users.tavernID = taverns.tavernID
inner join locations on locations.locationID = taverns.locationID
order by taverns.name ASC

-- 2. Write a query to return all classes and the count of guests that hold those classes

select classes.class_name AS 'Class', count(distinct guestlevels.guestID) AS 'Number of Guests'  from guestlevels, classes
where guestLevels.classID = classes.classID
group by classes.class_name
go


-- 3. Write a query that returns all guests ordered by name (ascending) and their classes and corresponding levels. Add a column that labels them beginner (lvl 1-5), intermediate (5-10) and expert (10+) for their classes (Don’t alter the table for this)

SELECT CONCAT(first_name, ' ', last_name) AS 'Guest Name', class_name AS 'Class Name', current_level AS 'Current Level',
CASE
	WHEN current_level between 1 AND 5 THEN 'beginner'
    WHEN current_level between 6 AND 10 Then 'intermediate'
	WHEN current_level > 10 THEN 'expert'
	END AS Ranking
FROM guests
JOIN guestLevels on guests.guestid = guestLevels.guestID
JOIN classes on classes.classid = guestLevels.classid
ORDER by last_name ASC


-- 4. Write a function that takes a level and returns a “grouping” from question 3 (e.g. 1-5, 5-10, 10+, etc)

create function classLevelGrouping(
@current_level INT
)

returns TABLE
as return
(SELECT @current_level AS 'Current Level',
CASE
	WHEN @current_level between 1 AND 5 THEN 'beginner'
    WHEN @current_level between 6 AND 10 Then 'intermediate'
	WHEN @current_level > 10 THEN 'expert'
	END AS Ranking)
go

select * from classLevelGrouping(2);


-- 5. Write a function that returns a report of all open rooms (not used) on a particular day (input) and which tavern they belong to


create function roomSelection10(
@selectedDate text
)

returns TABLE
as return
(SELECT @selectedDate AS 'Selected Date'
, rooms.roomName AS 'Room Name'
, taverns.name AS 'Tavern'
, rooms.totalBeds AS 'Number of Beds'
, rooms.price_per_night AS 'Price per Night'
from roomAvailabilities
join rooms
on rooms.roomID = roomAvailabilities.roomID
join taverns
on rooms.tavernID = taverns.tavernID
WHERE(@selectedDate LIKE roomAvailabilities.lastUpdated) AND (roomAvailabilities.currentStatus = 1)
	)
go

select * from roomSelection10('2021-08-30');

-- would be better if it said 'nothing available' instead of displaying empty table when no rooms are open


-- 6. Modify the same function from 5 to instead return a report of prices in a range (min and max prices) - Return Rooms and their taverns based on price inputs

create function roomsWithPriceList3(
@minPrice decimal(18,2), @maxPrice decimal(18,2))

returns TABLE
as return
(SELECT CONCAT(@minPrice, ' to ', @maxPrice) AS 'Price Range'
, rooms.roomName AS 'Room Name'
, taverns.name AS 'Tavern'
, rooms.totalBeds AS 'Number of Beds'
, rooms.price_per_night AS 'Price per Night'
from roomAvailabilities
join rooms
on rooms.roomID = roomAvailabilities.roomID
join taverns
on rooms.tavernID = taverns.tavernID
WHERE(price_per_night between @minPrice AND @maxPrice) AND (roomAvailabilities.currentStatus = 1)
	)

  -- or you can drop the "AND (roomAvailabilities.currentStatus = 1)" to see everything regardless of Availability

  -- or you can use this to see whether or not a room is available:

  create function roomsWithPriceList6(
  @minPrice decimal(18,2), @maxPrice decimal(18,2))

  returns TABLE
  as return
  (SELECT CONCAT(@minPrice, ' to ', @maxPrice) AS 'Price Range'
  , rooms.roomName AS 'Room Name'
  , taverns.name AS 'Tavern'
  , rooms.totalBeds AS 'Number of Beds'
  , rooms.price_per_night AS 'Price per Night'
  , availabilityStatuses.statusName AS 'Availability Status'
  from roomAvailabilities
  join rooms
  on rooms.roomID = roomAvailabilities.roomID
  join taverns
  on rooms.tavernID = taverns.tavernID
  join availabilityStatuses
  on roomAvailabilities.currentStatus = availabilityStatuses.av_StatusID
  WHERE price_per_night between @minPrice AND @maxPrice
  	)
  go

  select * from roomsWithPriceList6(30, 500);


-- 7. Write a command that uses the result from 6 to Create a Room in another tavern that undercuts (is less than) the cheapest room by a penny - thereby making the new room the cheapest one

CREATE PROCEDURE letsUnderCutIt

AS

declare @priceToBeat decimal(18,2);
set @priceToBeat = (select min([Price per Night]) from roomsWithPriceList6(30, 500)) - .01

declare @randomTavern INT;
set @randomTavern = (select taverns.tavernID
from taverns
join rooms
on rooms.tavernID = taverns.tavernID
where rooms.price_per_night = (select min([Price per Night]) from roomsWithPriceList6(30, 500)))

declare @underCutter INT;
set @underCutter = CASE @randomTavern when 5 then (SELECT FLOOR(RAND()*(5-2+1)+1)) else @randomTavern +1 end

INSERT INTO rooms(tavernID, roomName, room_dx, amenities, totalBeds, maxGuests, price_per_night)
VALUES (@underCutter, 'Lux', 'nicer', 'good view', '1', '2', @priceToBeat)

go

EXEC letsUnderCutIt

--I don't know how to make it so the roomsWithPriceList6() function doesn't have the params hardcoded in though, and obviously the room details
-- are hardcoded in, but I really didn't know how to randomize that, and in a production situation, the randomization wouldn't be realistic
-- anyways b/c rooms wouldn't randomly get built, but I wanted some way to prevent a tavern from undercutting itself 
