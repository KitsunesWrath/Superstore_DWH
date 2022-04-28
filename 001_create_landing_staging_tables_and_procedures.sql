/* Landing table */

CREATE TABLE [Lnd].[Superstore] (
	[Row ID] nvarchar(255),
	[Order ID] nvarchar(255),
	[Order Date] nvarchar(255), 
	[Ship Date] nvarchar(255),
	[Ship Mode] nvarchar(255),
	[Customer ID] nvarchar(255),
	[Customer Name] nvarchar(255),
	[Segment] nvarchar(255),
	[Country/Region] nvarchar(255),
	[City] nvarchar(255),
	[State] nvarchar(255),
	[Postal Code] nvarchar(255),
	[Region] nvarchar(255),
	[Product ID] nvarchar(255),
	[Category] nvarchar(255),
	[Sub-Category] nvarchar(255),
	[Product Name] nvarchar(255),
	[Sales] nvarchar(255),
	[Quantity] nvarchar(255),
	[Discount] nvarchar(255),
	[Profit] nvarchar(255)
)




/* Staging table */

CREATE TABLE [Stg].[Superstore] (
	[OrderID]  nvarchar(25),
	[OrderDate] date, 
	[ShipDate] date,
	[ShipMode] nvarchar(25),
	[CustomerID] nvarchar(15),
	[CustomerName] nvarchar(50),
	[Segment] nvarchar(15),
	[CountryOrRegion] nvarchar(50),
	[City] nvarchar(50),
	[State] nvarchar(50),
	[PostalCode] nvarchar(10),
	[Region] nvarchar(10),
	[ProductID] nvarchar(100),
	[Category] nvarchar(50),
	[Subcategory] nvarchar(50),
	[ProductName] nvarchar(MAX),
	[Sales] decimal(10,4),
	[Quantity] int,
	[Discount] decimal(5,2),
	[Profit] decimal(10,4)
)




/* Check table */

CREATE TABLE [Lnd].[Superstore] (
	[Row ID] nvarchar(255),
	[Order ID] nvarchar(255),
	[Order Date] nvarchar(255), 
	[Ship Date] nvarchar(255),
	[Ship Mode] nvarchar(255),
	[Customer ID] nvarchar(255),
	[Customer Name] nvarchar(255),
	[Segment] nvarchar(255),
	[Country/Region] nvarchar(255),
	[City] nvarchar(255),
	[State] nvarchar(255),
	[Postal Code] nvarchar(255),
	[Region] nvarchar(255),
	[Product ID] nvarchar(255),
	[Category] nvarchar(255),
	[Sub-Category] nvarchar(255),
	[Product Name] nvarchar(255),
	[Sales] nvarchar(255),
	[Quantity] nvarchar(255),
	[Discount] nvarchar(255),
	[Profit] nvarchar(255)
)




/* Check table */
-- DROP TABLE IF EXISTS [Lnd].[Superstore_Check]
CREATE TABLE [Lnd].[Superstore_Check] (
	[Row ID] nvarchar(255),
	[Order ID] nvarchar(255),
	[Order Date] nvarchar(255), 
	[Ship Date] nvarchar(255),
	[Ship Mode] nvarchar(255),
	[Customer ID] nvarchar(255),
	[Customer Name] nvarchar(255),
	[Segment] nvarchar(255),
	[Country/Region] nvarchar(255),
	[City] nvarchar(255),
	[State] nvarchar(255),
	[Postal Code] nvarchar(255),
	[Region] nvarchar(255),
	[Product ID] nvarchar(255),
	[Category] nvarchar(255),
	[Sub-Category] nvarchar(255),
	[Product Name] nvarchar(255),
	[Sales] nvarchar(255),
	[Quantity] nvarchar(255),
	[Discount] nvarchar(255),
	[Profit] nvarchar(255),
	ErrorMessage nvarchar(MAX)
)




/* Landing to staging procedure */
GO
CREATE OR ALTER PROCEDURE [Cfg].[LS_Superstore] 
	@AffectedRows INT = NULL OUTPUT,
	@ErrorIndicator INT = NULL OUTPUT,
	@ErrorMessage NVARCHAR(4000) = NULL OUTPUT
AS
	BEGIN
		BEGIN TRY 
			TRUNCATE TABLE [Lnd].[Superstore_Check]
			INSERT INTO [Lnd].[Superstore_Check]
           ([Row ID]
           ,[Order ID]
           ,[Order Date]
           ,[Ship Date]
           ,[Ship Mode]
           ,[Customer ID]
           ,[Customer Name]
           ,[Segment]
           ,[Country/Region]
           ,[City]
           ,[State]
           ,[Postal Code]
           ,[Region]
           ,[Product ID]
           ,[Category]
           ,[Sub-Category]
           ,[Product Name]
           ,[Sales]
           ,[Quantity]
           ,[Discount]
           ,[Profit]
           ,[ErrorMessage])
		   SELECT 
		   [Row ID]
		  ,[Order ID]
		  ,[Order Date]
		  ,[Ship Date]
		  ,[Ship Mode]
		  ,[Customer ID]
		  ,[Customer Name]
		  ,[Segment]
		  ,[Country/Region]
		  ,[City]
		  ,[State]
		  ,[Postal Code]
		  ,[Region]
		  ,[Product ID]
		  ,[Category]
		  ,[Sub-Category]
		  ,[Product Name]
		  ,[Sales]
		  ,[Quantity]
		  ,[Discount]
		  ,[Profit]
		  ,[ErrorMessage]
		  FROM  ( 
		  SELECT 
		   [Row ID]
		  ,[Order ID]
		  ,[Order Date]
		  ,[Ship Date]
		  ,[Ship Mode]
		  ,[Customer ID]
		  ,[Customer Name]
		  ,[Segment]
		  ,[Country/Region]
		  ,[City]
		  ,[State]
		  ,[Postal Code]
		  ,[Region]
		  ,[Product ID]
		  ,[Category]
		  ,[Sub-Category]
		  ,[Product Name]
		  ,[Sales]
		  ,[Quantity]
		  ,[Discount]
		  ,[Profit],
		  CASE 
			WHEN TRY_CONVERT(nvarchar(25), ISNULL([Order ID], '-')) IS NULL THEN 'Cannot convert Order ID to nvarchar(25)'
			ELSE ''
		  END+
		  CASE  
			WHEN TRY_CONVERT(date, [Order Date], 105) IS NULL THEN 'Cannot convert Order Date to date'
			ELSE ''
		  END+   
		  CASE 
			WHEN TRY_CONVERT(date, [Ship Date], 105) IS NULL THEN 'Cannot convert Order Date to date'
			ELSE ''
		  END+
		  CASE 
			WHEN TRY_CONVERT(nvarchar(25), ISNULL([Ship Mode], '-')) IS NULL THEN 'Cannot convert Ship Mode to nvarchar(25)'
			ELSE ''
		  END+
		  CASE 
			WHEN TRY_CONVERT(nvarchar(15), ISNULL([Customer ID], '-')) IS NULL THEN 'Cannot convert Customer ID to nvarchar(15)'
			ELSE ''
		  END+
		  CASE 
			WHEN TRY_CONVERT(nvarchar(50), ISNULL([Customer Name], '-')) IS NULL THEN 'Cannot convert Customer Name to nvarchar(50)'
			ELSE ''
		  END+
		  CASE 
			WHEN TRY_CONVERT(nvarchar(15), ISNULL([Segment], '-')) IS NULL THEN 'Cannot convert Segment to nvarchar(15)'
			ELSE ''
		  END+
		  CASE 
			WHEN TRY_CONVERT(nvarchar(50), ISNULL([Country/Region], '-')) IS NULL THEN 'Cannot convert Country/Region to nvarchar(50)'
			ELSE ''
		  END+
		  CASE 
			WHEN TRY_CONVERT(nvarchar(50), ISNULL([City], '-')) IS NULL THEN 'Cannot convert City to nvarchar(50)'
			ELSE ''
		  END+
		  CASE 
			WHEN TRY_CONVERT(nvarchar(50), ISNULL([State], '-')) IS NULL THEN 'Cannot convert State to nvarchar(50)'
			ELSE ''
		  END+
		  CASE 
			WHEN TRY_CONVERT(nvarchar(10), ISNULL([Postal Code], '-')) IS NULL THEN 'Cannot convert Postal Code to nvarchar(10)'
			ELSE ''
		  END+
		  CASE 
			WHEN TRY_CONVERT(nvarchar(10), ISNULL([Region], '-')) IS NULL THEN 'Cannot convert Region to nvarchar(10)'
			ELSE ''
		  END+
		  CASE 
			WHEN TRY_CONVERT(nvarchar(100), ISNULL([Product ID], '-')) IS NULL THEN 'Cannot convert Postal Code to nvarchar(100)'
			ELSE ''
		  END+
		  CASE 
			WHEN TRY_CONVERT(nvarchar(10), ISNULL([Category], '-')) IS NULL THEN 'Cannot convert Category to nvarchar(10)'
			ELSE ''
		  END+
		  CASE 
			WHEN TRY_CONVERT(nvarchar(50), ISNULL([Sub-Category], '-')) IS NULL THEN 'Cannot convert Sub-Category to nvarchar(50)'
			ELSE ''
		  END+
		  CASE 
			WHEN TRY_CONVERT(nvarchar(50), ISNULL([Product Name], '-')) IS NULL THEN 'Cannot convert Product Name to nvarchar(50)'
			ELSE ''
		  END+
		  CASE 
			WHEN TRY_CONVERT(decimal(10,4), CASE WHEN [Sales] IS NULL THEN '0' ELSE 
			REPLACE([Sales],',','.') END) IS NULL THEN 'Cannot convert Sales to decimal(10,4)'
			ELSE ''
		  END+
		  CASE 
			WHEN TRY_CONVERT(int, ISNULL([Quantity], '0')) IS NULL THEN 'Cannot convert Quantity to int'
			ELSE ''
		  END+  
		  CASE 
			WHEN TRY_CONVERT(decimal(5,2), CASE WHEN [Discount] IS NULL THEN '0'
			ELSE REPLACE([Discount],',','.') END) IS NULL THEN 'Cannot convert Discount to decimal(5,2)'
			ELSE ''
		  END+ 
		  CASE 
			WHEN TRY_CONVERT(decimal(10,4), CASE WHEN [Profit] IS NULL THEN '0'
			ELSE REPLACE([Profit],',','.') END) IS NULL THEN 'Cannot convert Profit to decimal(10,4)'
			ELSE ''
		  END [ErrorMessage]
		  FROM [Lnd].[Superstore]
		  ) q 
		  WHERE q.ErrorMessage <> '';

		  SET @AffectedRows = @@ROWCOUNT;

		  IF @AffectedRows = 0
		  BEGIN
			BEGIN TRANSACTION 
			TRUNCATE TABLE [Stg].[Superstore]
			INSERT INTO [Stg].[Superstore]
		    ([OrderID]
           ,[OrderDate]
           ,[ShipDate]
           ,[ShipMode]
           ,[CustomerID]
           ,[CustomerName]
           ,[Segment]
           ,[CountryOrRegion]
           ,[City]
           ,[State]
           ,[PostalCode]
           ,[Region]
           ,[ProductID]
           ,[Category]
           ,[Subcategory]
           ,[ProductName]
           ,[Sales]
           ,[Quantity]
           ,[Discount]
           ,[Profit])
		   SELECT DISTINCT 
		   [Order ID]
		  ,CONVERT(DATE,[Order Date], 105)
		  ,CONVERT(DATE, [Ship Date], 105)
		  ,[Ship Mode]
		  ,[Customer ID]
		  ,[Customer Name]
		  ,[Segment]
		  ,[Country/Region]
		  ,[City]
		  ,[State]
		  ,[Postal Code]
		  ,[Region]
		  ,[Product ID]
		  ,[Category]
		  ,[Sub-category]
		  ,[Product Name]
		  ,CONVERT(	decimal(10,4), CASE WHEN [Sales] IS NULL THEN '0'
		  ELSE REPLACE([Sales], ',', '.') END)
		  ,[Quantity]
		  ,CONVERT(	decimal(5,2), CASE WHEN [Discount] IS NULL THEN '0'
		  ELSE REPLACE([Discount], ',', '.') END)
		  ,CONVERT(	decimal(10,4), CASE WHEN [Profit] IS NULL THEN '0'
		  ELSE REPLACE([Profit], ',', '.') END)
  FROM [Lnd].[Superstore]

  SET @AffectedRows = @@ROWCOUNT
  SET @ErrorIndicator = 0;
  SET @ErrorMessage = '';
  END
  ELSE
  BEGIN
	SET @ErrorIndicator=1;
	SET @ErrorMessage='Conversion errors occured';
	SET @AffectedRows=NULL;

	RAISERROR('Conversion errors occured', 16, 1);

	END;

	COMMIT TRANSACTION;

	SELECT 
		@ErrorIndicator AS ErrorIndicator,
		@ErrorMessage AS ErrorMessage,
		@AffectedRows AS AffectedRows

	END TRY
	BEGIN CATCH

		SET @ErrorIndicator=1;

		IF XACT_STATE() <> 0
			ROLLBACK TRANSACTION;

		SET @ErrorMessage=CONCAT('Error occured for procedure: ',
		OBJECT_SCHEMA_NAME(@@procid) + '.' + OBJECT_NAME(@@procid),
		' System Error: ', ERROR_NUMBER(), ': ', ERROR_MESSAGE(), 'Error in code line #', ERROR_LINE());

		SELECT 
		 NULL AffectedRows,
		 @ErrorIndicator ErrorIndicator,
		 @ErrorMessage ErrorMessage;

		 THROW;
	END CATCH
END 
