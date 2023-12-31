USE [CyclincDWH]
GO
/****** Object:  StoredProcedure [dbo].[LoadDimReseller]    Script Date: 2023/07/07 15:59:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tshiamo Moloto
-- Description:	Load the Reseller Dimension Table
-- =============================================
ALTER PROCEDURE [dbo].[LoadDimReseller]	
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
