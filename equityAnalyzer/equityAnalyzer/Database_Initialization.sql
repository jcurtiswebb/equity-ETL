Use master
GO
sp_configure 'show advanced options', 1
GO
RECONFIGURE WITH OVERRIDE
GO 
sp_configure 'contained database authentication', 1
GO
RECONFIGURE WITH OVERRIDE
GO 
sp_configure 'show advanced options', 0 
GO
RECONFIGURE WITH OVERRIDE 
GO

IF DB_ID(N'YahooFinData') IS NOT NULL
	DROP DATABASE YahooFinData;
GO

CREATE DATABASE YahooFinData
	CONTAINMENT = PARTIAL;
GO

ALTER DATABASE YahooFinData
	SET RECOVERY SIMPLE;
GO

USE YahooFinData;
GO

CREATE User ETLoperator WITH PASSWORD = 'operator';
GO

EXEC sp_addrolemember 'db_datawriter', 'ETLoperator';
GO

EXEC sp_addrolemember 'db_datareader', 'ETLoperator';
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'stg')
BEGIN
    EXEC( 'CREATE SCHEMA stg' );
END


