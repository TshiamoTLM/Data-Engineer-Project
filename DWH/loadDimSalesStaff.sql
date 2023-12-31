USE [CyclincDWH]
GO
/****** Object:  StoredProcedure [dbo].[LoadDimSalesStaff]    Script Date: 2023/07/07 16:00:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[LoadDimSalesStaff]
	
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
