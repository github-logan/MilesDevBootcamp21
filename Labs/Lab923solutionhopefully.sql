--Welcome, OWNER. Your TAVERN located at ADDRESS iz doing well. We sold ANITEM four SOMEDOLLARS.
--We only have ANUMBER units lefft uv ANOTHERITEM.  (iff less than 10, better reorder soon).

SELECT 'Welcome, ' || owners.name || '. Your tavern, the ' || taverns.name 
|| ' located at ' 
|| (SELECT address FROM locations WHERE locations.locationid = taverns.locationid)
|| ' is doing well. We sold ' 
|| (SELECT service_name FROM services
    JOIN sales
    on sales.serviceID = services.serviceid
    WHERE sales.tavernid = taverns.tavernid) 
|| ' for $' 
|| (SELECT price FROM sales WHERE sales.tavernid = taverns.tavernid) 
|| '. We only have ' 
|| (SELECT numberofunits FROM serviceStatuses WHERE serviceStatuses.tavernid = taverns.tavernid) 
|| ' units left of ' 
|| (SELECT service_name FROM services
    join serviceStatuses
    on serviceStatuses.serviceID = services.serviceID
    WHERE serviceStatuses.tavernID = taverns.tavernid)  
|| (SELECT
       CASE WHEN numberofunits < 10
       THEN '. Better Reorder soon!'
       ELSE '.'
       END
FROM serviceStatuses
JOIN services
ON services.serviceID = serviceStatuses.serviceid WHERE serviceStatuses.tavernid = taverns.tavernID) 
AS Email from owners, taverns
WHERE owners.tavernid = taverns.tavernid

----------




