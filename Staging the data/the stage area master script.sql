USE [master]
GO
/****** Object:  Database [Staging_AdventureWorks]    Script Date: 2023/07/07 16:09:39 ******/
CREATE DATABASE [Staging_AdventureWorks]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Staging_AdventureWorks', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Staging_AdventureWorks.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Staging_AdventureWorks_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Staging_AdventureWorks_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Staging_AdventureWorks] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Staging_AdventureWorks].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Staging_AdventureWorks] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Staging_AdventureWorks] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Staging_AdventureWorks] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Staging_AdventureWorks] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Staging_AdventureWorks] SET ARITHABORT OFF 
GO
ALTER DATABASE [Staging_AdventureWorks] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Staging_AdventureWorks] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Staging_AdventureWorks] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Staging_AdventureWorks] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Staging_AdventureWorks] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Staging_AdventureWorks] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Staging_AdventureWorks] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Staging_AdventureWorks] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Staging_AdventureWorks] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Staging_AdventureWorks] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Staging_AdventureWorks] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Staging_AdventureWorks] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Staging_AdventureWorks] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Staging_AdventureWorks] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Staging_AdventureWorks] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Staging_AdventureWorks] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Staging_AdventureWorks] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Staging_AdventureWorks] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Staging_AdventureWorks] SET  MULTI_USER 
GO
ALTER DATABASE [Staging_AdventureWorks] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Staging_AdventureWorks] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Staging_AdventureWorks] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Staging_AdventureWorks] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Staging_AdventureWorks] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Staging_AdventureWorks] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Staging_AdventureWorks] SET QUERY_STORE = ON
GO
ALTER DATABASE [Staging_AdventureWorks] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Staging_AdventureWorks]
GO
/****** Object:  Schema [HumanResources]    Script Date: 2023/07/07 16:09:39 ******/
CREATE SCHEMA [HumanResources]
GO
/****** Object:  Schema [Person]    Script Date: 2023/07/07 16:09:39 ******/
CREATE SCHEMA [Person]
GO
/****** Object:  Schema [Production]    Script Date: 2023/07/07 16:09:39 ******/
CREATE SCHEMA [Production]
GO
/****** Object:  Schema [Purchasing]    Script Date: 2023/07/07 16:09:39 ******/
CREATE SCHEMA [Purchasing]
GO
/****** Object:  Schema [Sales]    Script Date: 2023/07/07 16:09:39 ******/
CREATE SCHEMA [Sales]
GO
/****** Object:  Table [Person].[Person]    Script Date: 2023/07/07 16:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  Table [Sales].[SalesPerson]    Script Date: 2023/07/07 16:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  Table [Person].[EmailAddress]    Script Date: 2023/07/07 16:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  Table [HumanResources].[Employee]    Script Date: 2023/07/07 16:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  View [dbo].[VwSalesStaff]    Script Date: 2023/07/07 16:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE View [dbo].[VwSalesStaff] as
SELECT pp.BusinessEntityID,
hr.NationalIDNumber,
		pp.FirstName, 
		pp.LastName,
        hr.Gender, hr.JobTitle,
        pes.EmailAddress

  FROM  [Sales].[SalesPerson] AS sp
  JOIN [Person].[Person]AS pp
  ON  sp.BusinessEntityID = pp.BusinessEntityID
  JOIN  [HumanResources].[Employee] AS hr
  ON sp.BusinessEntityID = hr.BusinessEntityID
  JOIN [Person].[EmailAddress] AS pes
  ON sp.BusinessEntityID = pes.BusinessEntityID
GO
/****** Object:  Table [Sales].[Customer]    Script Date: 2023/07/07 16:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[Customer](
	[CustomerID] [int] NOT NULL,
	[PersonID] [int] NULL,
	[StoreID] [int] NULL,
	[TerritoryID] [int] NULL,
	[AccountNumber] [varchar](10) NOT NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwCustomer]    Script Date: 2023/07/07 16:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[vwCustomer]
as

  select c.CustomerID,
         p.[Title],
	p.[FirstName],
	p.[LastName],
	pes.EmailAddress

         from [Sales].[Customer] c
  join [Person].[Person] p
  on c.PersonID = p.BusinessEntityID
   JOIN [Person].[EmailAddress] AS pes
  ON p.BusinessEntityID = pes.BusinessEntityID
GO
/****** Object:  Table [Production].[Product]    Script Date: 2023/07/07 16:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  Table [Sales].[SalesOrderDetail]    Script Date: 2023/07/07 16:09:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  Table [Sales].[SalesOrderHeader]    Script Date: 2023/07/07 16:09:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  View [dbo].[vwResellerSalesFact]    Script Date: 2023/07/07 16:09:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vwResellerSalesFact]
as
select h.[SalesOrderID],
 row_number() over(partition by h.[SalesOrderID] order by h.modifieddate) as saleLineNumber,
p.ProductID,
cast(h.[OrderDate] as date) [OrderDate] ,
cast(h.[DueDate] as Date) [DueDate],
cast(h.[ShipDate] as date) [ShipDate],
 cast(c.[StoreID] as nvarchar(15)) ResellerID,
h.[TerritoryID],
[OrderQty],
[UnitPrice],
[UnitPriceDiscount],
[LineTotal] AS TotalProductCost

 from [Sales].[SalesOrderHeader] h
left join [Sales].[SalesOrderDetail]  o
on h.SalesOrderID = o.SalesOrderID

left join [Production].[Product] p 
on o.[ProductID] = p.ProductID

left join [Sales].[Customer] c
on h.[CustomerID] = c.[CustomerID]

where OnlineOrderFlag=0; -- This is to filter  ResellerSales
GO
/****** Object:  Table [Sales].[Store]    Script Date: 2023/07/07 16:09:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[Store](
	[BusinessEntityID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[SalesPersonID] [int] NULL,
	[Demographics] [xml] NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwReseller]    Script Date: 2023/07/07 16:09:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[vwReseller]
as
SELECT distinct 
       [StoreID]
	   ,s.Name [ResellerName]
      ,null [YearOpened]
      ,0 [NumberEmployees]
	  ,null [BusinessType]
	 
    
  FROM [Sales].[Customer] c
  left join  [Sales].[Store] s
  on c.StoreId = s.BusinessEntityId

  where PersonID
is null
GO
/****** Object:  View [dbo].[vwFactInternetSales]    Script Date: 2023/07/07 16:09:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vwFactInternetSales]
as
select h.[SalesOrderID],
 row_number() over(partition by h.[SalesOrderID] order by h.modifieddate) as saleLineNumber,
p.ProductID,
cast(h.[OrderDate] as date) [OrderDate] ,
cast(h.[DueDate] as Date) [DueDate],
cast(h.[ShipDate] as date) [ShipDate],
[CustomerID],
[TerritoryID],
[OrderQty],
[UnitPrice],
[UnitPriceDiscount],
[LineTotal]

 from [Sales].[SalesOrderHeader] h
left join [Sales].[SalesOrderDetail]  o
on h.SalesOrderID = o.SalesOrderID

left join [Production].[Product] p 
on o.[ProductID] = p.ProductID
where OnlineOrderFlag =1 -- This is to filer Internet Sales
GO
/****** Object:  Table [Production].[ProductCategory]    Script Date: 2023/07/07 16:09:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[ProductCategory](
	[ProductCategoryID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Production].[ProductSubcategory]    Script Date: 2023/07/07 16:09:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[ProductSubcategory](
	[ProductSubcategoryID] [int] NOT NULL,
	[ProductCategoryID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwProduct]    Script Date: 2023/07/07 16:09:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 --Product Dimension View 
  Create View [dbo].[vwProduct]
as

select  
p.ProductID,
p.[ProductNumber],
        p.[Name],
		p.[StandardCost],
p.[Color],
p.[Size],
null SizeRange,
p.[Name] [EnglishDescription],
sc.[Name]  as [ProductSubcategoryCode],
c.[Name]   as  [ProductCategory]

 from [Production].[Product] p

left join [Production].[ProductSubcategory] sc
on p.ProductSubcategoryID = sc.ProductSubcategoryID

left join [Production].[ProductCategory] c
on sc.ProductCategoryID = c.ProductCategoryID
GO
/****** Object:  View [dbo].[vwFactSellerSales]    Script Date: 2023/07/07 16:09:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create View [dbo].[vwFactSellerSales] as
select h.[SalesOrderID],
 row_number() over(partition by h.[SalesOrderID] order by h.modifieddate) as saleLineNumber,
p.ProductNumber,
cast(h.[OrderDate] as date) [OrderDate] ,
cast(h.[DueDate] as Date) [DueDate],
cast(h.[ShipDate] as date) [ShipDate],
 cast(c.[StoreID] as nvarchar(15)) ResellerID,
h.[TerritoryID],
e.NationalIDNumber,
N'USD' Currency,  
null [RevisionNumber],
[OrderQty],
[UnitPrice],
[UnitPriceDiscount],
[LineTotal],
0 [TaxAmt]

 from [Sales].[SalesOrderHeader] h
left join   [Sales].[SalesOrderDetail] o
on h.SalesOrderID = o.SalesOrderID

left join [Production].[Product] p 
on o.[ProductID] = p.ProductID

left join  [Sales].[Customer] c
on h.[CustomerID] = c.[CustomerID]

left join [HumanResources].[Employee] e
on e.[BusinessEntityID] = h.SalesPersonID
where OnlineOrderFlag=0 -- This is to filter  ResellerSales
GO
/****** Object:  Table [Sales].[SalesPersonQuotaHistory]    Script Date: 2023/07/07 16:09:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  View [dbo].[vwFactPerformanceBenchmark]    Script Date: 2023/07/07 16:09:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[vwFactPerformanceBenchmark] as 
  SELECT sp.BusinessEntityID, 
        sp.TerritoryID,
        CAST(sph.QuotaDate AS date) as Quarterly,
        sp.SalesQuota as 'Target', 
        sph.SalesQuota as SalesQuotaAmount

  FROM [Sales].[SalesPerson] as sp
  JOIN [Sales].[SalesPersonQuotaHistory] as sph
  ON sp.BusinessEntityID =sph.BusinessEntityID
  WHERE sp.SalesQuota IS NOT NULL
  ;
GO
/****** Object:  Table [dbo].[LogError]    Script Date: 2023/07/07 16:09:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogError](
	[ErrorLogID] [int] IDENTITY(1,1) NOT NULL,
	[Package] [varchar](255) NOT NULL,
	[ErrorMessage] [varchar](255) NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ErrorLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogEvent]    Script Date: 2023/07/07 16:09:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogEvent](
	[EventKey] [int] IDENTITY(1,1) NOT NULL,
	[EventNm] [varchar](50) NOT NULL,
	[EventDesc] [varchar](250) NOT NULL,
	[EventStatusNm] [varchar](20) NOT NULL,
	[StartTs] [datetime] NOT NULL,
	[EndTs] [datetime] NULL,
 CONSTRAINT [PK_logEvent] PRIMARY KEY CLUSTERED 
(
	[EventKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Production].[ProductCostHistory]    Script Date: 2023/07/07 16:09:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[ProductCostHistory](
	[ProductID] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[StandardCost] [money] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Production].[ProductDescription]    Script Date: 2023/07/07 16:09:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[ProductDescription](
	[ProductDescriptionID] [int] NOT NULL,
	[Description] [nvarchar](400) NOT NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Production].[ProductModel]    Script Date: 2023/07/07 16:09:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[ProductModel](
	[ProductModelID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CatalogDescription] [xml] NULL,
	[Instructions] [xml] NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Production].[ProductModelProductDescriptionCulture]    Script Date: 2023/07/07 16:09:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[ProductModelProductDescriptionCulture](
	[ProductModelID] [int] NOT NULL,
	[ProductDescriptionID] [int] NOT NULL,
	[CultureID] [nchar](6) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductModelProductDescriptionCulture_ProductModelID_ProductDescriptionID_CultureID] PRIMARY KEY CLUSTERED 
(
	[ProductModelID] ASC,
	[ProductDescriptionID] ASC,
	[CultureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Production].[ProductReview]    Script Date: 2023/07/07 16:09:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[ProductReview](
	[ProductReviewID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ReviewerName] [nvarchar](55) NOT NULL,
	[ReviewDate] [datetime] NOT NULL,
	[EmailAddress] [nvarchar](50) NOT NULL,
	[Rating] [int] NOT NULL,
	[Comments] [nvarchar](3850) NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductReview_ProductReviewID] PRIMARY KEY CLUSTERED 
(
	[ProductReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Production].[UnitMeasure]    Script Date: 2023/07/07 16:09:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[UnitMeasure](
	[UnitMeasureCode] [nchar](3) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Purchasing].[ShipMethod]    Script Date: 2023/07/07 16:09:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Purchasing].[ShipMethod](
	[ShipMethodID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ShipBase] [money] NOT NULL,
	[ShipRate] [money] NOT NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Sales].[CountryRegionCurrency]    Script Date: 2023/07/07 16:09:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[CountryRegionCurrency](
	[CountryRegionCode] [nvarchar](3) NOT NULL,
	[CurrencyCode] [nchar](3) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Sales].[Currency]    Script Date: 2023/07/07 16:09:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[Currency](
	[CurrencyCode] [nchar](3) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Sales].[SalesTerritory]    Script Date: 2023/07/07 16:09:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  StoredProcedure [dbo].[NeededTables]    Script Date: 2023/07/07 16:09:40 ******/
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
USE [master]
GO
ALTER DATABASE [Staging_AdventureWorks] SET  READ_WRITE 
GO
