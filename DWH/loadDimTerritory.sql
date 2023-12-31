USE [CyclincDWH]
GO
/****** Object:  StoredProcedure [dbo].[LoadDimSalesTerritory]    Script Date: 2023/07/07 16:01:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[LoadDimSalesTerritory]
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
