--The schemas needed for the staging area
/****** Object:  Schema [HumanResources]    Script Date: 2023/06/29 11:32:44 ******/
CREATE SCHEMA [HumanResources]
GO
/****** Object:  Schema [Person]    Script Date: 2023/06/29 11:32:44 ******/
CREATE SCHEMA [Person]
GO
/****** Object:  Schema [Production]    Script Date: 2023/06/29 11:32:44 ******/
CREATE SCHEMA [Production]
GO
/****** Object:  Schema [Purchasing]    Script Date: 2023/06/29 11:32:44 ******/
CREATE SCHEMA [Purchasing]
GO
/****** Object:  Schema [Sales]    Script Date: 2023/06/29 11:32:44 ******/
CREATE SCHEMA [Sales]
GO

---Tables needed for the staging area
USE [Staging_AdventureWorks]
GO
/******  [dbo].[NeededTables]    Script Date: 2023/07/07 10:24:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


	--CREATE THE FOLLOWING
--WE GONNA CREATE THE FOLLOWING TABLES BUT DROPING THEM JUST IN CASE THEY ARE THERE

--Person Email Address
drop table IF EXISTS [Person].EmailAddress
;
CREATE TABLE [Person].[EmailAddress](
	[BusinessEntityID] [int] NOT NULL,
	[EmailAddressID] [int] IDENTITY(1,1) NOT NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_EmailAddress_BusinessEntityID_EmailAddressID] PRIMARY KEY CLUSTERED 
(
	[BusinessEntityID] ASC,
	[EmailAddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
;

drop table if Exists[Sales].SalesPersonQuotaHistory
;
CREATE TABLE [Sales].[SalesPersonQuotaHistory](
	[BusinessEntityID] [int] NOT NULL,
	[QuotaDate] [datetime] NOT NULL,
	[SalesQuota] [money] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SalesPersonQuotaHistory_BusinessEntityID_QuotaDate] PRIMARY KEY CLUSTERED 
(
	[BusinessEntityID] ASC,
	[QuotaDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
;


--HumanResources Employee
drop table if EXISTS HumanResources.Employee
;


CREATE TABLE [HumanResources].[Employee](
	[BusinessEntityID] [int] NOT NULL,
	[NationalIDNumber] [nvarchar](15) NOT NULL,
	[LoginID] [nvarchar](256) NOT NULL,
	[OrganizationNode] [hierarchyid] NULL,
	[OrganizationLevel]  AS ([OrganizationNode].[GetLevel]()),
	[JobTitle] [nvarchar](50) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[MaritalStatus] [nchar](1) NOT NULL,
	[Gender] [nchar](1) NOT NULL,
	[HireDate] [date] NOT NULL,
	[SalariedFlag] [nvarchar](1) NOT NULL,
	[VacationHours] [smallint] NOT NULL,
	[SickLeaveHours] [smallint] NOT NULL,
	[CurrentFlag] [nvarchar](1) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Employee_BusinessEntityID] PRIMARY KEY CLUSTERED 
(
	[BusinessEntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

;


--1. Person Table
drop table IF EXISTS [Person].[Person]
;

CREATE TABLE [Person].[Person](
	[BusinessEntityID] [int] NOT NULL,
	[PersonType] [nchar](2) NOT NULL,
	[NameStyle] [bit] NOT NULL,
	[Title] [nvarchar](8) NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Suffix] [nvarchar](10) NULL,
	[EmailPromotion] [int] NOT NULL,
	[AdditionalContactInfo] [xml] NULL,
	[Demographics] [xml] NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;



--Production schemas tables

--Product 
drop table IF EXISTS [Production].[Product]
;

CREATE TABLE [Production].[Product](
	[ProductID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ProductNumber] [nvarchar](25) NOT NULL,
	[MakeFlag] [bit] NOT NULL,
	[FinishedGoodsFlag] [bit] NOT NULL,
	[Color] [nvarchar](15) NULL,
	[SafetyStockLevel] [smallint] NOT NULL,
	[ReorderPoint] [smallint] NOT NULL,
	[StandardCost] [money] NOT NULL,
	[ListPrice] [money] NOT NULL,
	[Size] [nvarchar](5) NULL,
	[SizeUnitMeasureCode] [nchar](3) NULL,
	[WeightUnitMeasureCode] [nchar](3) NULL,
	[Weight] [decimal](8, 2) NULL,
	[DaysToManufacture] [int] NOT NULL,
	[ProductLine] [nchar](2) NULL,
	[Class] [nchar](2) NULL,
	[Style] [nchar](2) NULL,
	[ProductSubcategoryID] [int] NULL,
	[ProductModelID] [int] NULL,
	[SellStartDate] [datetime] NOT NULL,
	[SellEndDate] [datetime] NULL,
	[DiscontinuedDate] [datetime] NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY]
;

--ProductCategory
drop table IF EXISTS [Production].[ProductCategory]
;

CREATE TABLE [Production].[ProductCategory](
	[ProductCategoryID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY]
;

--ProductCostHistory
drop table IF EXISTS [Production].[ProductCostHistory];


CREATE TABLE [Production].[ProductCostHistory](
	[ProductID] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[StandardCost] [money] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY]
;
--ProductDescription
drop table IF EXISTS [Production].[ProductDescription]
;

CREATE TABLE [Production].[ProductDescription](
	[ProductDescriptionID] [int] NOT NULL,
	[Description] [nvarchar](400) NOT NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY]
;

--ProductModel
drop table IF EXISTS [Production].[ProductModel]
;

CREATE TABLE [Production].[ProductModel](
	[ProductModelID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CatalogDescription] [xml] NULL,
	[Instructions] [xml] NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;
--ProductSubCategory
drop table IF EXISTS [Production].[ProductSubcategory]
;

CREATE TABLE  [Production].[ProductSubcategory](
	[ProductSubcategoryID] [int] NOT NULL,
	[ProductCategoryID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY]
;
--UnitMeasure
drop table IF EXISTS [Production].[UnitMeasure]
;
CREATE TABLE [Production].[UnitMeasure](
	[UnitMeasureCode] [nchar](3) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY]
;

--Purchasing schema Table

--ShipMethod
drop table IF EXISTS [Purchasing].[ShipMethod]
;
CREATE TABLE [Purchasing].[ShipMethod](
	[ShipMethodID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ShipBase] [money] NOT NULL,
	[ShipRate] [money] NOT NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY]
;



--Sales schema Tables

--CountryRegionCurrency
drop table IF EXISTS [Sales].[CountryRegionCurrency]
;

CREATE TABLE [Sales].[CountryRegionCurrency](
	[CountryRegionCode] [nvarchar](3) NOT NULL,
	[CurrencyCode] [nchar](3) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY]
;

--Sales.Currency
drop table IF EXISTS [Sales].[Currency]
;

CREATE TABLE [Sales].[Currency](
	[CurrencyCode] [nchar](3) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY]
;

--Sales.Customer
drop table IF EXISTS [Sales].[Customer]
;

CREATE TABLE [Sales].[Customer](
	[CustomerID] [int] NOT NULL,
	[PersonID] [int] NULL,
	[StoreID] [int] NULL,
	[TerritoryID] [int] NULL,
	[AccountNumber] [varchar](10) NOT NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY]
;

--Sales.SalesOrderDetail
drop table IF EXISTS [Sales].[SalesOrderDetail]
;

CREATE TABLE [Sales].[SalesOrderDetail](
	[SalesOrderID] [int] NOT NULL,
	[SalesOrderDetailID] [int] NOT NULL,
	[CarrierTrackingNumber] [nvarchar](25) NULL,
	[OrderQty] [smallint] NOT NULL,
	[ProductID] [int] NOT NULL,
	[SpecialOfferID] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[UnitPriceDiscount] [money] NOT NULL,
	[LineTotal] [numeric](38, 6) NOT NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY]
;

--Sales.SalesOrderHeader
drop table IF EXISTS [Sales].[SalesOrderHeader]
;


CREATE TABLE [Sales].[SalesOrderHeader](
	[SalesOrderID] [int] NOT NULL,
	[RevisionNumber] [tinyint] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[DueDate] [datetime] NOT NULL,
	[ShipDate] [datetime] NULL,
	[Status] [tinyint] NOT NULL,
	[OnlineOrderFlag] [bit] NOT NULL,
	[SalesOrderNumber] [nvarchar](25) NOT NULL,
	[PurchaseOrderNumber] [nvarchar](25) NULL,
	[AccountNumber] [nvarchar](15) NULL,
	[CustomerID] [int] NOT NULL,
	[SalesPersonID] [int] NULL,
	[TerritoryID] [int] NULL,
	[BillToAddressID] [int] NOT NULL,
	[ShipToAddressID] [int] NOT NULL,
	[ShipMethodID] [int] NOT NULL,
	[CreditCardID] [int] NULL,
	[CreditCardApprovalCode] [varchar](15) NULL,
	[CurrencyRateID] [int] NULL,
	[SubTotal] [money] NOT NULL,
	[TaxAmt] [money] NOT NULL,
	[Freight] [money] NOT NULL,
	[TotalDue] [money] NOT NULL,
	[Comment] [nvarchar](128) NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY]
;

--Sales.SalesPerson
drop table IF EXISTS  [Sales].[SalesPerson]
;


CREATE TABLE [Sales].[SalesPerson](
	[BusinessEntityID] [int] NOT NULL,
	[TerritoryID] [int] NULL,
	[SalesQuota] [money] NULL,
	[Bonus] [money] NOT NULL,
	[CommissionPct] [smallmoney] NOT NULL,
	[SalesYTD] [money] NOT NULL,
	[SalesLastYear] [money] NOT NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY]
;

--Sales.SalesTerritory
drop table IF EXISTS [Sales].[SalesTerritory]
;

CREATE TABLE [Sales].[SalesTerritory](
	[TerritoryID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CountryRegionCode] [nvarchar](3) NOT NULL,
	[Group] [nvarchar](50) NOT NULL,
	[SalesYTD] [money] NOT NULL,
	[SalesLastYear] [money] NOT NULL,
	[CostYTD] [money] NOT NULL,
	[CostLastYear] [money] NOT NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY]
;

--Store
drop table IF EXISTS [Sales].[Store]
;

CREATE TABLE [Sales].[Store](
	[BusinessEntityID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[SalesPersonID] [int] NULL,
	[Demographics] [xml] NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;


