USE [master]
GO
/****** Object:  Database [CyclincDWH]    Script Date: 2023/07/07 16:11:09 ******/
CREATE DATABASE [CyclincDWH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CyclincDWH', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CyclincDWH.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CyclincDWH_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CyclincDWH_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CyclincDWH] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CyclincDWH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CyclincDWH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CyclincDWH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CyclincDWH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CyclincDWH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CyclincDWH] SET ARITHABORT OFF 
GO
ALTER DATABASE [CyclincDWH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CyclincDWH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CyclincDWH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CyclincDWH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CyclincDWH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CyclincDWH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CyclincDWH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CyclincDWH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CyclincDWH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CyclincDWH] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CyclincDWH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CyclincDWH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CyclincDWH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CyclincDWH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CyclincDWH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CyclincDWH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CyclincDWH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CyclincDWH] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CyclincDWH] SET  MULTI_USER 
GO
ALTER DATABASE [CyclincDWH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CyclincDWH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CyclincDWH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CyclincDWH] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CyclincDWH] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CyclincDWH] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CyclincDWH] SET QUERY_STORE = ON
GO
ALTER DATABASE [CyclincDWH] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CyclincDWH]
GO
/****** Object:  Table [dbo].[DimCustomer]    Script Date: 2023/07/07 16:11:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCustomer](
	[CustomerID] [int] NOT NULL,
	[Title] [nvarchar](8) NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[EmailAddress] [nvarchar](50) NULL,
 CONSTRAINT [PK_DimCustomerf_CustomerKEY] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 2023/07/07 16:11:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate](
	[DateKey] [int] NOT NULL,
	[FullDateAlternateKey] [date] NOT NULL,
	[DayNumberOfWeek] [tinyint] NOT NULL,
	[EnglishDayNameOfWeek] [nvarchar](10) NOT NULL,
	[DayNumberOfMonth] [tinyint] NOT NULL,
	[DayNumberOfYear] [smallint] NOT NULL,
	[WeekNumberOfYear] [tinyint] NOT NULL,
	[EnglishMonthName] [nvarchar](10) NOT NULL,
	[MonthNumberOfYear] [tinyint] NOT NULL,
	[CalendarQuarter] [tinyint] NOT NULL,
	[CalendarYear] [smallint] NOT NULL,
	[CalendarSemester] [tinyint] NOT NULL,
	[FiscalQuarter] [tinyint] NOT NULL,
	[FiscalYear] [smallint] NOT NULL,
	[FiscalSemester] [tinyint] NOT NULL,
 CONSTRAINT [PK_DimDate_DateKey] PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimProduct]    Script Date: 2023/07/07 16:11:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimProduct](
	[ProductID] [int] NOT NULL,
	[ProductAlternateKey] [nvarchar](25) NULL,
	[Name] [nvarchar](50) NOT NULL,
	[StandardCost] [money] NULL,
	[Color] [nvarchar](15) NULL,
	[Size] [nvarchar](50) NULL,
	[SizeRange] [nvarchar](50) NULL,
	[EnglishDescription] [nvarchar](400) NULL,
	[ProductSubcategoryCode] [nvarchar](50) NULL,
	[ProductcategoryCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_DimProduct_ProductKey] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [AK_DimProduct_ProductAlternateKey] UNIQUE NONCLUSTERED 
(
	[ProductAlternateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimReseller]    Script Date: 2023/07/07 16:11:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimReseller](
	[ResellerID] [int] NOT NULL,
	[ResellerAlternateKey] [nvarchar](15) NULL,
	[ResellerName] [nvarchar](50) NOT NULL,
	[NumberEmployees] [int] NULL,
	[YearOpened] [int] NULL,
 CONSTRAINT [PK_DimReseller_ResellerKey] PRIMARY KEY CLUSTERED 
(
	[ResellerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [AK_DimReseller_ResellerAlternateKey] UNIQUE NONCLUSTERED 
(
	[ResellerAlternateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimSalesStaff]    Script Date: 2023/07/07 16:11:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimSalesStaff](
	[SalesStaffID] [int] NOT NULL,
	[EmployeeNationalIDAlternateKey] [nvarchar](15) NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](1) NOT NULL,
	[JobTitle] [nvarchar](50) NOT NULL,
	[EmailAddress] [nvarchar](50) NULL,
 CONSTRAINT [PK_DimSalesStaff_SalesStaffKEY] PRIMARY KEY CLUSTERED 
(
	[SalesStaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [AK_DimSalesStaff_EmployeeNationalIDAlternateKey] UNIQUE NONCLUSTERED 
(
	[EmployeeNationalIDAlternateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimSalesTerritory]    Script Date: 2023/07/07 16:11:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimSalesTerritory](
	[SalesTerritoryID] [int] IDENTITY(1,1) NOT NULL,
	[SalesTerritoryAlternateKey] [int] NULL,
	[SalesTerritoryRegion] [nvarchar](50) NOT NULL,
	[SalesTerritoryCountry] [nvarchar](50) NOT NULL,
	[SalesTerritoryGroup] [nvarchar](50) NULL,
 CONSTRAINT [PK_DimSalesTerritory_SalesTerriotyKEY] PRIMARY KEY CLUSTERED 
(
	[SalesTerritoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [AK_DimSalesTerritory_ResellerAlternateKey] UNIQUE NONCLUSTERED 
(
	[SalesTerritoryAlternateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 2023/07/07 16:11:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[LogDateTime] [datetime] NULL,
	[ErrorMessage] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactInternetSales]    Script Date: 2023/07/07 16:11:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactInternetSales](
	[InternetSalesID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[SalesTerritoryID] [int] NOT NULL,
	[OrderQuantity] [smallint] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[DiscountAmount] [float] NOT NULL,
	[TotalProductCost] [money] NOT NULL,
 CONSTRAINT [PK_FactInternetSales_InternetSalesID] PRIMARY KEY CLUSTERED 
(
	[InternetSalesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactPerformanceBenchmark]    Script Date: 2023/07/07 16:11:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactPerformanceBenchmark](
	[PerformanceBenchmarkID] [int] IDENTITY(1,1) NOT NULL,
	[SalesStaffID] [int] NOT NULL,
	[QuarterlyDate] [date] NULL,
	[SalesTerritoryID] [int] NOT NULL,
	[Target] [money] NOT NULL,
	[SalesQuotaAmount] [money] NOT NULL,
 CONSTRAINT [PK_FactIPerformanceBenchmark] PRIMARY KEY CLUSTERED 
(
	[PerformanceBenchmarkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactReSellerSales]    Script Date: 2023/07/07 16:11:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactReSellerSales](
	[ResellerSalesID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ResellerID] [int] NOT NULL,
	[SalesTerritoryID] [int] NOT NULL,
	[OrderQuantity] [smallint] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[DiscountAmount] [float] NOT NULL,
	[TotalProductCost] [money] NOT NULL,
 CONSTRAINT [PK_FactInternetSales_ResellerSalesID] PRIMARY KEY CLUSTERED 
(
	[ResellerSalesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ErrorLog] ADD  DEFAULT (getdate()) FOR [LogDateTime]
GO
/****** Object:  StoredProcedure [dbo].[LoadDimCustomer]    Script Date: 2023/07/07 16:11:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoadDimCustomer]
AS
BEGIN
    SET NOCOUNT ON;

	--Do a try catch for error handling
    BEGIN TRY
        BEGIN TRANSACTION;

		/*We use merge to combine the data also to make it easy to track
		for when they are no matches so that we can add the new data*/

        MERGE [dbo].[DimCustomer] AS Target
        USING [Staging_AdventureWorks].[dbo].[vwCustomer] AS Source
        ON (Target.[CustomerID] = Source.[CustomerID])
        WHEN NOT MATCHED BY TARGET THEN
            INSERT (
                [CustomerID],
                [Title],
                [FirstName],
                [LastName],
                [EmailAddress]
            )
            VALUES (
                Source.[CustomerID],
                Source.[Title],
                Source.[FirstName],
                Source.[LastName],
                Source.[EmailAddress]
            )
        WHEN MATCHED THEN
            UPDATE SET
                Target.[FirstName] = Source.[FirstName],
                Target.[LastName] = Source.[LastName],
                Target.[Title] = Source.[Title],
                Target.[EmailAddress] = Source.[EmailAddress];

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        -- Log the error message into the ErrorLog table
        INSERT INTO [dbo].[ErrorLog] ([ErrorMessage])
        VALUES (ERROR_MESSAGE());

        -- Rethrow the error for further handling
        THROW;
    END CATCH;

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[LoadDimDate]    Script Date: 2023/07/07 16:11:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LoadDimDate]
AS
BEGIN
	
--BY Tshiamo Moloto

	--Declare the dates which the store started operating to the end of the year ended
declare @startdate date = '2005-01-01',
    @enddate date = '2014-12-31'


	--in the event Start date is null
IF @startdate IS NULL
    BEGIN
	--- we have to assign it a new  date from the dimenison date table
        Select Top 1 @startdate = FulldateAlternateKey
        From DimDate 
        Order By DateKey ASC 
    END

	--Create a list table which will be used to store the dates of the Cyclinc Company  
Declare @datelist table (FullDate date)

--Use a Loop to add all the dates to that table

while @startdate <= @enddate

Begin 
    Insert into @datelist (FullDate)
    Select @startdate

    Set @startdate = dateadd(dd,1,@startdate)

end 

--Load the dates into the Date Dimension

 insert into [dbo].[DimDate] 
    (DateKey, 
        FullDateAlternateKey, 
        DayNumberOfWeek, 
        EnglishDayNameOfWeek,       
        DayNumberOfMonth, 
        DayNumberOfYear, 
        WeekNumberOfYear, 
        EnglishMonthName, 
     
        MonthNumberOfYear, 
        CalendarQuarter, 
        CalendarYear, 
        CalendarSemester, 
        FiscalQuarter, 
        FiscalYear, 
        FiscalSemester)


select convert(int,convert(varchar,dl.FullDate,112)) as DateKey,
    dl.FullDate,
    datepart(dw,dl.FullDate) as DayNumberOfWeek,
    datename(weekday,dl.FullDate) as EnglishDayNameOfWeek,
    
    
    datepart(d,dl.FullDate) as DayNumberOfMonth,
    datepart(dy,dl.FullDate) as DayNumberOfYear,
    datepart(wk, dl.FUllDate) as WeekNumberOfYear,
    datename(MONTH,dl.FullDate) as EnglishMonthName,
   
   
    Month(dl.FullDate) as MonthNumberOfYear,
    datepart(qq, dl.FullDate) as CalendarQuarter,
    year(dl.FullDate) as CalendarYear,
    case datepart(qq, dl.FullDate)
        when 1 then 1
        when 2 then 1
        when 3 then 2
        when 4 then 2
    end as CalendarSemester,
    case datepart(qq, dl.FullDate)
        when 1 then 3
        when 2 then 4
        when 3 then 1
        when 4 then 2
    end as FiscalQuarter,
    case datepart(qq, dl.FullDate)
        when 1 then year(dl.FullDate)
        when 2 then year(dl.FullDate)
        when 3 then year(dl.FullDate) + 1
        when 4 then year(dl.FullDate) + 1
    end as FiscalYear,
    case datepart(qq, dl.FullDate)
        when 1 then 2
        when 2 then 2
        when 3 then 1
        when 4 then 1
    end as FiscalSemester

from @datelist dl left join 
    [dbo].[DimDate] dd 
        on dl.FullDate = dd.FullDateAlternateKey
Where dd.FullDateAlternateKey is null 




	
END
GO
/****** Object:  StoredProcedure [dbo].[LoadDimProduct]    Script Date: 2023/07/07 16:11:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tshiamo Moloto>
-- Description:	<Load Product Dimension>
-- =============================================
CREATE PROCEDURE [dbo].[LoadDimProduct]
	
AS
BEGIN
	  SET NOCOUNT ON;
	  --Do a try catch for error handling

    BEGIN TRY
        BEGIN TRANSACTION;

			/*We use merge to combine the data also to make it easy to track
		for when they are no matches so that we can add the new data*/


    MERGE [dbo].[DimProduct] AS Target
    USING [Staging_AdventureWorks].[dbo].[vwProduct] AS Source
    ON (Target.[ProductAlternateKey] = Source.[ProductNumber])
    WHEN NOT MATCHED BY TARGET THEN
        INSERT (
		[ProductID],
		[ProductAlternateKey],
		[Name],
         [StandardCost],
           [Color],
		[Size],
		[SizeRange],
		[EnglishDescription],
		[ProductSubcategoryCode],
		[ProductcategoryCode]
        )
        VALUES (
		Source.[ProductID],
Source.[ProductNumber],
           Source.[Name],
         Source.[StandardCost],
           Source.[Color],
		Source.[Size],
		Source.[SizeRange],
		Source.[EnglishDescription],
		Source.[ProductSubcategoryCode],
		Source.[ProductCategory]        
        )
    WHEN MATCHED THEN
        UPDATE SET
		Target.[Name]= Source.[Name],
        Target.[StandardCost]= Source.[StandardCost],
           Target.[Color]= Source.[Color],
		Target.[Size]= Source.[Size],
		Target.[SizeRange]= Source.[SizeRange],
		Target.[EnglishDescription]= Source.[EnglishDescription],
		Target.[ProductSubcategoryCode]= Source.[ProductSubcategoryCode],
		Target. [ProductcategoryCode]=Source.[ProductCategory];
		
		
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        -- Log the error message into the ErrorLog table
        INSERT INTO [dbo].[ErrorLog] ([ErrorMessage])
        VALUES (ERROR_MESSAGE());

        -- Rethrow the error for further handling
        THROW;
    END CATCH;

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[LoadDimReseller]    Script Date: 2023/07/07 16:11:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tshiamo Moloto
-- Description:	Load the Reseller Dimension Table
-- =============================================
CREATE PROCEDURE [dbo].[LoadDimReseller]	
AS
BEGIN
	  SET NOCOUNT ON;
	  --Do a try catch for error handling

    BEGIN TRY
        BEGIN TRANSACTION;

			/*We use merge to combine the data also to make it easy to track
		for when they are no matches so that we can add the new data*/


    MERGE [dbo].[DimReseller] AS Target
    USING [Staging_AdventureWorks].[dbo].[vwReseller] AS Source
    ON (Target.[ResellerAlternateKey]= Source.[StoreID])
    WHEN NOT MATCHED BY TARGET THEN
        INSERT (
		ResellerID,
		[ResellerAlternateKey],
		[ResellerName],
           [NumberEmployees],
[YearOpened]
        )
        VALUES (
		Source.StoreID,
            Source.[StoreID],
			Source.[ResellerName],
			 Source.[NumberEmployees],
            Source.[YearOpened]
        )
    WHEN MATCHED THEN
        UPDATE SET
		Target.[ResellerName] = Source.[ResellerName],
            Target.[NumberEmployees]=Source.[NumberEmployees],
			Target.[YearOpened]=Source.[NumberEmployees];
			
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        -- Log the error message into the ErrorLog table
        INSERT INTO [dbo].[ErrorLog] ([ErrorMessage])
        VALUES (ERROR_MESSAGE());

        -- Rethrow the error for further handling
        THROW;
    END CATCH;
            

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[LoadDimSalesStaff]    Script Date: 2023/07/07 16:11:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LoadDimSalesStaff]
	
AS
BEGIN
	  SET NOCOUNT ON;
	  --Do a try catch for error handling

    BEGIN TRY
        BEGIN TRANSACTION;

			/*We use merge to combine the data also to make it easy to track
		for when they are no matches so that we can add the new data*/

    MERGE [dbo].[DimSalesStaff] AS Target
    USING [Staging_AdventureWorks].[dbo].[VwSalesStaff] AS Source
    ON (Target.[EmployeeNationalIDAlternateKey]= Source.[NationalIDNumber])
    WHEN NOT MATCHED BY TARGET THEN
        INSERT (
		SalesStaffID,
		[EmployeeNationalIDAlternateKey],
           [FirstName],
            [LastName],
            [Gender],
            [JobTitle],
			[EmailAddress]
        )
        VALUES (
		Source.[BusinessEntityID],
            Source.[NationalIDNumber],
			 Source.[FirstName],
            Source.[LastName],
            Source.[Gender],
            Source.[JobTitle],
			Source.[EmailAddress]
           
        )
    WHEN MATCHED THEN
        UPDATE SET
		Target.[FirstName]= Source.[FirstName],
            Target.[LastName]=Source.[LastName],
            Target.[Gender]=Source.[Gender],
            Target.[JobTitle]=Source.[JobTitle],
			Target.[EmailAddress]=Source.[EmailAddress];
     	
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        -- Log the error message into the ErrorLog table
        INSERT INTO [dbo].[ErrorLog] ([ErrorMessage])
        VALUES (ERROR_MESSAGE());

        -- Rethrow the error for further handling
        THROW;
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[LoadDimSalesTerritory]    Script Date: 2023/07/07 16:11:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoadDimSalesTerritory]
AS
BEGIN
--BY Tshiamo Moloto
     SET NOCOUNT ON;
	  --Do a try catch for error handling

    BEGIN TRY
        BEGIN TRANSACTION;

			/*We use merge to combine the data also to make it easy to track
		for when they are no matches so that we can add the new data*/



    MERGE [dbo].[DimSalesTerritory] AS Target
    USING [Staging_AdventureWorks].[Sales].[SalesTerritory] AS Source
    ON (Target.[SalesTerritoryAlternateKey] = Source.[TerritoryID])
    WHEN NOT MATCHED BY TARGET THEN
        INSERT (
            [SalesTerritoryAlternateKey],
            [SalesTerritoryRegion],
            [SalesTerritoryCountry],
            [SalesTerritoryGroup]
        )
        VALUES (
            Source.[TerritoryID],
            Source.[Name],
            Source.[CountryRegionCode],
            Source.[Group]
        )
    WHEN MATCHED THEN
        UPDATE SET
            Target.[SalesTerritoryRegion] = Source.[Name],
            Target.[SalesTerritoryCountry] = Source.[CountryRegionCode],
            Target.[SalesTerritoryGroup] = Source.[Group];

   	
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        -- Log the error message into the ErrorLog table
        INSERT INTO [dbo].[ErrorLog] ([ErrorMessage])
        VALUES (ERROR_MESSAGE());

        -- Rethrow the error for further handling
        THROW;
    END CATCH;
END
GO
USE [master]
GO
ALTER DATABASE [CyclincDWH] SET  READ_WRITE 
GO
