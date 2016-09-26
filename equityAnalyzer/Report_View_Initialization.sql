USE YahooFinData;
GO

CREATE VIEW dbo.changeReport
AS
SELECT symID, 
yearID, 
revenues,
repType,
amend,
LAG(revenues) OVER(PARTITION BY symID ORDER BY yearID) prevRevenues, 
netIncome, 
LAG(netIncome) OVER(PARTITION BY symID ORDER BY yearID) prevNetIncome, 
epsDiluted,
LAG(epsDiluted) OVER(PARTITION BY symID ORDER BY yearID) prevEpsDiluted
FROM dbo.factReport;
