# equity-ETL

This yahoo finance equity analysis tool uses two different sources for acquiring data:
pystock-crawler (https://github.com/eliangcs/pystock-crawler) and a custom C# class (included) for the rest.
Data goes through an ETL process using SSIS before insertion into SQL Server. After data is inserted, the data undergoes several more transformations and aggregations. Finally SSRS is used to write reports with findings.

Requirements:

SQL Server 2014 or newer

Visual Studio 2012 or newer


<b>RELEASE 1 (9/26/2016)</b><br>

-SPRINT 1 (9/12/2016)<br>
  Feature 1 : Creation of underlying table structure<br>
  Feature 2 : SSIS Project for ETL of pystock data<br>
  Feature 3 : SSRS Report graphing daily price moves<br>
  SSIS package deployment to SQL Server <br>

  
-SPRINT 2 (9/19/2016)<br>
  Feature 1 : C# Yahoo Finance Data Acquisition for index<br>
  Feature 2 : SSRS Report graphing performance vs index<br>
  Feature 3 : SSRS Report graphing dividend growth<br>
  Feature 4 : SSRS Report showing undervalued or overvalued for individual equity<br>
  
-SPRINT 3 (9/26/2016)<br>
  Feature 1 : SSRS Report graphing earnings growth<br>
  Feature 2 : SSRS Report graphing revenue growth<br>


