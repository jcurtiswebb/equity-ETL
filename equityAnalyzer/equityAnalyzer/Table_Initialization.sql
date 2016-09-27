USE YahooFinData;
GO


CREATE TABLE dbo.dimSymbol 
(
	symID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	symbol varchar(12) NOT NULL,
	name varchar(64) NULL
)

CREATE TABLE dbo.dimYear
(
	yearID TINYINT PRIMARY KEY NOT NULL,
	[year] INT NOT NULL
)

CREATE TABLE dbo.dimDate
(
	dateID INT PRIMARY KEY NOT NULL,
	[date] DATE NOT NULL,
	yearID TINYINT FOREIGN KEY REFERENCES dbo.dimYear(yearID) NOT NULL,
	[quarter] AS DATEPART(QUARTER, [date]) PERSISTED
)



CREATE TABLE dbo.factPrice
(
	symID INT FOREIGN KEY REFERENCES dbo.dimSymbol(symID) NOT NULL,
	dateID INT FOREIGN KEY REFERENCES dbo.dimDate(dateID) NOT NULL,
	closePrice DECIMAL(9,2) NOT NULL,
	volume BIGINT NOT NULL,
	adjClosePrice MONEY NOT NULL,
	dayGain DECIMAL(9,5) NULL,
	CONSTRAINT pk_price PRIMARY KEY (symID,dateID) WITH (IGNORE_DUP_KEY = ON)
)


DECLARE @startdate AS DATE = '12-31-1999'
DECLARE @totalyears AS INT = 20;
DECLARE @enddate AS DATE = DATEADD(YY, @totalyears, @startdate)
DECLARE @totaldays AS INT = DATEDIFF(d, @startdate, @enddate)


INSERT INTO YahooFinData.dbo.dimYear (yearID, [year])
SELECT TOP (@totalyears) ROW_NUMBER() OVER(ORDER BY sc1.id), (YEAR(@startdate) + ROW_NUMBER() OVER(ORDER BY sc1.id) )
FROM master.dbo.syscolumns sc1 , master.dbo.syscolumns sc2



INSERT INTO YahooFinData.dbo.dimDate (dateID, [date], yearID)
SELECT TOP (@totaldays) ROW_NUMBER() OVER(ORDER BY sc1.id), (CAST(DATEADD(d, ROW_NUMBER() OVER(ORDER BY sc1.id), @startdate) AS DATE)),1
FROM master.dbo.syscolumns sc1 , master.dbo.syscolumns sc2;
GO

UPDATE dimDate
SET yearID = (SELECT yearID FROM YahooFinData.dbo.dimYear AS N1 WHERE N1.[year] = YEAR(dimDate.[date]));
GO

CREATE TABLE dbo.factReport
(
	symID INT FOREIGN KEY REFERENCES dbo.dimSymbol(symID) NOT NULL,
	yearID TINYINT FOREIGN KEY REFERENCES dbo.dimYear(yearID) NOT NULL,
	amend BIT NOT NULL,
	repType BIT NOT NULL,
	[quarter] VARCHAR(2) NOT NULL,
	revenues BIGINT null,	
	opIncome BIGINT null,	
	netIncome	BIGINT null,
	epsBasic DECIMAL(9,2) null,	
	epsDiluted	DECIMAL(9,2) null,
	dividend DECIMAL(9,2) null,
	assets	BIGINT null,
	curAssets BIGINT null,	
	curLiab BIGINT null,	
	cash BIGINT null,	
	equity	BIGINT null,
	cashFlowOp BIGINT null,	
	cashFlowInv BIGINT null,	
	cashFlowFin BIGINT null,
	divGrowth DECIMAL(9,4) null,
	valuation DECIMAL(9,2) null,
	beta DECIMAL(9,4) null,
	CONSTRAINT pk_report PRIMARY KEY (symID, yearID, amend, reptype, [quarter]) WITH (IGNORE_DUP_KEY = ON)
)






