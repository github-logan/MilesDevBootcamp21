SELECT ('Welcome ' 
        || (Select name from owners WHERE owners.ownerID = taverns.ownerID) 
        || ' to your tavern the ' 
        || name 
        || '! You are located at the ' 
        || locationID 
        || (CASE locationID WHEN 1 THEN 'st' 
            WHEN 2 THEN 'nd'
            WHEN 3 THEN 'rd' 
            ELSE 'th' END) 
        || ' Location! We look forward to your hard work tomorrow on: ' 
        || (SELECT DATE('now', '+1 day')) 
        || '!') 
        AS Email FROM taverns