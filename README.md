# equity-ETL
Download Yahoo Finance API data into a SQL Server Database and run customizable reports in SSRS.<br>
<p align="center">
  <img src="http://jcurtiswebb.com/blog/wp-content/uploads/2016/09/3M_Report.jpg" alt="MMM report">
</p>

This yahoo finance equity analysis tool uses two different sources for acquiring data:
pystock-crawler (https://github.com/eliangcs/pystock-crawler) and a custom C# class (included) for the rest.
Data goes through an ETL process using SSIS before insertion into SQL Server. After data is inserted, the data undergoes several more transformations and aggregations. Finally SSRS is used to write reports with findings.

<b>Requirements:</b>

* SQL Server 2014 or newer (SQL Server Data Tools // Management Tools - Complete // Client Tools - SDK)
* Visual Studio 2012 or newer

<b>Initial Setup and Data Import:</b><br>
1. Download equityAnalyzer, equityDataETL, and equityETLrpt onto local computer where SSMS and Visual studio have access<br>
2. Open the project equityAnalyzer using SSMS with dbcreator permission<br>
3. Run Database_Initialization.sql and Table_Initialization.sql<br>
4. Download pystock-data http://data.pystock.com/<br>
5. Create  in C:\pystock-data-gh-pages and extract all data here into subfolders (to prevent naming conflict).<br>
  Note: If afformentioned directory cannot be created, see <b>Changing the Searched File Directory</b><br>
6. Open the project equityDataETL in Visual Studio.<br>
7. Deploy the solution to SQL Server Integration Services Catalog<br>
8. From SSISDB run the packages in the following order: pystock-load, yahooDataLoad, divGrowthUpdate, betaUpdate, Valuation<br>

<b>Changing the Searched File Directory</b><br>
The default directory for the two data extractions is the C: drive, here's how it can be changed:<br>
To change the path for all pystock data, open the pystock-load package and change the path in all 3 for each file enumerator
<p align="center">
  <img src="http://jcurtiswebb.com/blog/wp-content/uploads/2016/09/file_path_pystock.jpg" alt="Pystock-enumerator">
</p>
To change the path for the C# scraper, open the yahooDataLoad package and change the directory in create directory, clear directory, and get yahoo finance data tasks
<p align="center">
  <img src="http://jcurtiswebb.com/blog/wp-content/uploads/2016/09/stock_crawler.jpg" alt="C#_Crawler_Directory">
</p>






