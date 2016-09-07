# equity-ETL

This yahoo finance equity analysis tool uses two different sources for acquiring data:
pystock-crawler (https://github.com/eliangcs/pystock-crawler) and a custom C# class (included) for the rest.
Data goes through an ETL process using SSIS before insertion into SQL Server. After data is inserted, the data undergoes several more transformations and aggregations. Finally SSRS is used to write reports with findings.

Requirements:
SQL Server 2014 or newer
Visual Stuidio 2012 or newer


RELEASE 1 (9/26/2016)
-SPRINT 1 (9/12/2016)
  Feature 1 : Creation of underlying table structure
  Feature 2 : SSIS Project for ETL of pystock data
  Feature 3 : SSRS Report graphing daily price moves
  SSIS package deployment to SQL Server 
-SPRINT 2 (9/19/2016)
  Feature 1 : C# Yahoo Finance Data Acquisition for index
  Feature 2 : SSRS Report graphing performance vs index
  Feature 3 : SSRS Report graphing dividend growth
  Feature 4 : SSRS Report showing undervalued or overvalued for individual equity
-SPRINT 3 (9/26/2016)
  Feature 1 : SSRS Report graphing earnings growth
  Feature 2 : SSRS Report graphing revenue growth


