CREATE OR ALTER PROCEDURE [Cfg].[LR_Order] AS
BEGIN TRY
	BEGIN TRANSACTION

		DROP TABLE IF EXISTS #tmpOrder

		SELECT DISTINCT
			supst.[OrderId],
			supst.[OrderDate],
			ISNULL(ret.[Returned], 'No') AS [Returned]
		INTO
			#tmpOrder
		FROM
			Stg.Superstore supst
		LEFT JOIN Stg.[Returns] ret ON ret.[Order ID] = supst.OrderID

		INSERT INTO  [Rpr].[Order]([OrderId], [OrderDate])

		SELECT
			[OrderId],
			[OrderDate]
		FROM
			#tmpOrder
		EXCEPT
		SELECT
			[OrderId],
			[OrderDate]
		FROM
			[Rpr].[Order]

		SELECT @@ROWCOUNT AS RowsAffected
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	PRINT ERROR_MESSAGE();
END CATCH




CREATE OR ALTER PROCEDURE [Cfg].[LR_Category] AS
BEGIN TRY
	BEGIN TRANSACTION

		DROP TABLE IF EXISTS #tmpCat

		SELECT DISTINCT
			[Category]
		INTO
			#tmpCat
		FROM
			Stg.Superstore

		INSERT INTO  [Rpr].[Category]([Category])

		SELECT
			[Category]
		FROM
			#tmpCat
		EXCEPT
		SELECT
			[Category]
		FROM
			[Rpr].[Category]

		SELECT @@ROWCOUNT AS RowsAffected
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	PRINT ERROR_MESSAGE();
END CATCH




CREATE OR ALTER PROCEDURE [Cfg].[LR_City] AS
BEGIN TRY
	BEGIN TRANSACTION

		DROP TABLE IF EXISTS #tmpCity

		SELECT DISTINCT
			[City],
			[PostalCode]
		INTO
			#tmpCity
		FROM
			Stg.Superstore

		INSERT INTO  [Rpr].[City]([City], [PostalCode])

		SELECT
			[City],
			[PostalCode]
		FROM
			#tmpCity
		EXCEPT
		SELECT
			[City],
			[PostalCode]
		FROM
			[Rpr].[City]

		SELECT @@ROWCOUNT AS RowsAffected
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	PRINT ERROR_MESSAGE();
END CATCH




CREATE OR ALTER PROCEDURE [Cfg].[LR_Country] AS
BEGIN TRY
	BEGIN TRANSACTION

		DROP TABLE IF EXISTS #tmpCntr

		SELECT DISTINCT
			[CountryOrRegion]
		INTO
			#tmpCntr
		FROM
			Stg.Superstore

		INSERT INTO  [Rpr].[Country]([Country])

		SELECT
			[CountryOrRegion]
		FROM
			#tmpCntr
		EXCEPT
		SELECT
			[Country]
		FROM
			[Rpr].[Country]

		SELECT @@ROWCOUNT AS RowsAffected
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	PRINT ERROR_MESSAGE();
END CATCH




CREATE OR ALTER PROCEDURE [Cfg].[LR_Customer] AS
BEGIN TRY
	BEGIN TRANSACTION

		DROP TABLE IF EXISTS #tmpCust

		SELECT DISTINCT
			[CustomerId],
			[CustomerName]
		INTO
			#tmpCust
		FROM
			Stg.Superstore

		INSERT INTO  [Rpr].[Customer]([CustomerId],[CustomerName])

		SELECT
			[CustomerId],
			[CustomerName]
		FROM
			#tmpCust
		EXCEPT
		SELECT
			[CustomerId],
			[CustomerName]
		FROM
			[Rpr].[Customer]

		SELECT @@ROWCOUNT AS RowsAffected
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	PRINT ERROR_MESSAGE();
END CATCH



CREATE OR ALTER PROCEDURE [Cfg].[LR_Product] AS
BEGIN TRY
	BEGIN TRANSACTION

		DROP TABLE IF EXISTS #tmpProdct

		SELECT DISTINCT
			supst.[ProductID] AS [ProductCode],
			[ProductName]
		INTO
			#tmpProdct
		FROM
			Stg.Superstore supst

		INSERT INTO  [Rpr].[Product]([ProductCode], [ProductName])

		SELECT
			[ProductCode],
			[ProductName]
		FROM
			#tmpProdct
		EXCEPT
		SELECT
			[ProductCode],
			[ProductName]
		FROM
			[Rpr].[Product]

		SELECT @@ROWCOUNT AS RowsAffected
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	PRINT ERROR_MESSAGE();
END CATCH




CREATE OR ALTER PROCEDURE [Cfg].[LR_People] AS
BEGIN TRY
	BEGIN TRANSACTION

		DROP TABLE IF EXISTS #tmpPeople

		SELECT DISTINCT
			ppl.[Person]
		INTO
			#tmpPeople
		FROM
			Stg.People ppl

		INSERT INTO  [Rpr].[People]([Person])

		SELECT
			[Person]
		FROM
			#tmpPeople
		EXCEPT
		SELECT
			[Person]
		FROM
			[Rpr].[People]

		SELECT @@ROWCOUNT AS RowsAffected
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	PRINT ERROR_MESSAGE();
END CATCH



CREATE OR ALTER PROCEDURE [Cfg].[LR_Segment] AS
BEGIN TRY
	BEGIN TRANSACTION

		DROP TABLE IF EXISTS #tmpSeg

		SELECT DISTINCT
			[Segment]
		INTO
			#tmpSeg
		FROM
			Stg.Superstore 

		INSERT INTO  [Rpr].[Segment]([Segment])

		SELECT
			[Segment]
		FROM
			#tmpSeg
		EXCEPT
		SELECT
			[Segment]
		FROM
			[Rpr].[Segment]

		SELECT @@ROWCOUNT AS RowsAffected
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	PRINT ERROR_MESSAGE();
END CATCH




CREATE OR ALTER PROCEDURE [Cfg].[LR_Ship] AS
BEGIN TRY
	BEGIN TRANSACTION

		DROP TABLE IF EXISTS #tmpShip

		SELECT DISTINCT
			[ShipDate],
			[ShipMode]
		INTO
			#tmpShip
		FROM
			Stg.Superstore 

		INSERT INTO  [Rpr].[Ship]([ShipDate], [ShipMode])

		SELECT
			[ShipDate],
			[ShipMode]
		FROM
			#tmpShip
		EXCEPT
		SELECT
			[ShipDate],
			[ShipMode]
		FROM
			[Rpr].[Ship]

		SELECT @@ROWCOUNT AS RowsAffected
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	PRINT ERROR_MESSAGE();
END CATCH




CREATE OR ALTER PROCEDURE [Cfg].[LR_State] AS
BEGIN TRY
	BEGIN TRANSACTION

		DROP TABLE IF EXISTS #tmpStat

		SELECT DISTINCT
			[State]
		INTO
			#tmpStat
		FROM
			Stg.Superstore 

		INSERT INTO  [Rpr].[State]([State])

		SELECT
			[State]
		FROM
			#tmpStat
		EXCEPT
		SELECT
			[State]
		FROM
			[Rpr].[State]

		SELECT @@ROWCOUNT AS RowsAffected
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	PRINT ERROR_MESSAGE();
END CATCH




CREATE OR ALTER PROCEDURE [Cfg].[LR_Subcategory] AS
BEGIN TRY
	BEGIN TRANSACTION

		DROP TABLE IF EXISTS #tmpSubcat

		SELECT DISTINCT
			[Subcategory]
		INTO
			#tmpSubcat
		FROM
			Stg.Superstore 

		INSERT INTO  [Rpr].[Subcategory]([Subcategory])

		SELECT
			[Subcategory]
		FROM
			#tmpSubcat
		EXCEPT
		SELECT
			[Subcategory]
		FROM
			[Rpr].[Subcategory]

		SELECT @@ROWCOUNT AS RowsAffected
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	PRINT ERROR_MESSAGE();
END CATCH




CREATE OR ALTER PROCEDURE [Cfg].[LR_Region] AS
BEGIN TRY
	BEGIN TRANSACTION

		DROP TABLE IF EXISTS #tmpRegion

		SELECT DISTINCT
			ppl.[Region],
			peopl.[PersonId]
		INTO
			#tmpRegion
		FROM
			Stg.People ppl
		JOIN Rpr.People peopl ON peopl.Person = ppl.Person

		INSERT INTO  [Rpr].[Region]([Region], [PersonId])

		SELECT
			[Region],
			[PersonId]
		FROM
			#tmpRegion
		EXCEPT
		SELECT
			[Region],
			[PersonId]
		FROM
			[Rpr].[Region]

		SELECT @@ROWCOUNT AS RowsAffected
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	PRINT ERROR_MESSAGE();
END CATCH




