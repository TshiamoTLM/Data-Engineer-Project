USE [CyclincDWH]
GO
/****** Object:  StoredProcedure [dbo].[LoadDimCustomer]    Script Date: 2023/07/07 15:44:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[LoadDimCustomer]
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