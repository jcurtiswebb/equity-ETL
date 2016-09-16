INSERT INTO dbo.factPrice (symID, dateID, closePrice, volume, adjClosePrice)
SELECT DISTINCT symID, dateID, closePrice, volume, adjClosePrice FROM stg.factPrice 
EXCEPT
SELECT DISTINCT symID, dateID, closePrice, volume, adjClosePrice FROM dbo.factPrice 


INSERT INTO dbo.factPrice (symID, dateID, closePrice, volume, adjClosePrice)
SELECT DISTINCT symID, dateID, closePrice, volume, adjClosePrice FROM stg.factPrice 


SELECT * FROM stg.factPrice
WHERE symID = 5 AND dateID = 5568
