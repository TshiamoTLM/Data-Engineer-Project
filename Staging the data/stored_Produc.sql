USE [Staging_AdventureWorks]
GO

/****** Object:  StoredProcedure [dbo].[NeededTables]    Script Date: 2023/07/07 10:45:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[NeededTables]

AS
BEGIN
	--CREATE THE FOLLOWING
--WE GONNA CREATE THE FOLLOWING TABLES BUT DROPING THEM JUST IN CASE THEY ARE THERE

--Person Email Address
Truncate table [Person].[EmailAddress]
;

Truncate Table [Sales].[SalesPersonQuotaHistory]
;
--HumanResources Employee
Truncate Table [HumanResources].[Employee]
;


--Person Table
Truncate table person.person
;



--Production schemas tables

--Product 
truncate table [Production].[Product]
;


--ProductCategory
Truncate table [Production].[ProductCategory]
;


--ProductCostHistory
Truncate table [Production].[ProductCostHistory]
;


--ProductDescription
Truncate table [Production].[ProductDescription]
;



--ProductModel
Truncate table [Production].[ProductModel]
;

--ProductSubCategory
Truncate table [Production].[ProductSubcategory]
;

--UnitMeasure
Truncate table [Production].[UnitMeasure]
;
--Purchasing schema Table

--ShipMethod
Truncate table [Purchasing].[ShipMethod]
;
--Sales schema Tables

--CountryRegionCurrency
Truncate table[Sales].[CountryRegionCurrency]
;


--Sales.Currency
Truncate table [Sales].[Currency]
;
--Sales.Customer
Truncate table[Sales].[Customer]
;
--Sales.SalesOrderDetail
Truncate table [Sales].[SalesOrderDetail]
;

--Sales.SalesOrderHeader
Truncate table [Sales].[SalesOrderHeader]
;

--Sales.SalesPerson
Truncate table [Sales].[SalesPerson]
;


--Sales.SalesTerritory
TRUNCATE TABLE [Sales].[SalesTerritory]
;


--Store
tRUNCATE TABLE [Sales].[Store]
;


END
GO


