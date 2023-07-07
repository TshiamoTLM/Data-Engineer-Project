--The Views of how the DATA would be Sturctured in the data warehouse

--Customer View dim

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
;
--Product View of the dim
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
;

--Sales Staff View of the Dim
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
 ;

 --Reseller which is the stores View dIM
 
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
;

--The Reseller Sales FACT VIEW
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
null [RevisionNumber],
[OrderQty],
[UnitPrice],
[UnitPriceDiscount],
[LineTotal]

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
;

--The internet sales Fact View

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
;

--The Performance Benchmark Fact View

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

