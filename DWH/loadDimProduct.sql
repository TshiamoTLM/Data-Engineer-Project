USE [CyclincDWH]
GO
/****** Object:  StoredProcedure [dbo].[LoadDimProduct]    Script Date: 2023/07/07 15:56:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tshiamo Moloto>
-- Description:	<Load Product Dimension>
-- =============================================
ALTER PROCEDURE [dbo].[LoadDimProduct]
	
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
