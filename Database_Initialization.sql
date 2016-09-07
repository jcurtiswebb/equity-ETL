USE master;
GO
IF DB_ID(N'YahooFinData') IS NOT NULL
	DROP DATABASE YahooFinData;
GO

CREATE DATABASE YahooFinData;
GO

ALTER DATABASE YahooFinData
	SET RECOVERY SIMPLE;
GO

USE YahooFinData;
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'prd')
BEGIN
    EXEC( 'CREATE SCHEMA prd' );
END


