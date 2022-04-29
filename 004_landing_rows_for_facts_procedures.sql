CREATE OR ALTER PROCEDURE [Cfg].[LF_Superstore] AS
BEGIN TRY
	BEGIN TRANSACTION
		DROP TABLE IF EXISTS #tmpSup
		SELECT
			ord.OrderId AS OrderId,
			shp.ShipId AS ShipId,
			cust.CustomerId AS CustomerId,
			seg.SegmentId AS SegmentId,
			countr.CountryId AS CountryId,
			cit.CityId AS CityId,
			st.StateId AS StateId,
			reg.RegionId AS RegionId,
			prod.ProductId AS ProductId,
			cat.CategoryId AS CategoryId,
			subcat.SubcategoryId AS SubcategoryId,
			stg.[Sales],
			stg.[Quantity],
			stg.[Discount],
			stg.[Profit]
		INTO 
			#tmpSup
		FROM
			[Stg].Superstore stg
		JOIN
			[Rpr].[Order] ord
			ON stg.OrderID = ord.OrderId
		JOIN [Rpr].[Ship] shp
			ON stg.ShipDate = shp.ShipDate AND stg.ShipMode = shp.ShipMode
		JOIN [Rpr].Customer cust
			ON stg.CustomerName = cust.CustomerName
		JOIN [Rpr].Segment seg 
			ON stg.Segment = seg.Segment
		JOIN [Rpr].Country countr
			ON stg.CountryOrRegion = countr.Country
		JOIN [Rpr].City cit
			ON stg.City = cit.City AND stg.PostalCode = cit.PostalCode
		JOIN [Rpr].[State] st
			ON stg.[State] = st.[State]
		JOIN [Rpr].Region reg
			ON stg.Region = reg.Region
		JOIN Rpr.Product prod
			ON stg.ProductName = prod.ProductName AND stg.ProductID = prod.ProductCode
		JOIN Rpr.Category cat	
			ON stg.Category = cat.Category
		JOIN Rpr.Subcategory subcat
			ON stg.Subcategory = subcat.Subcategory
		
		TRUNCATE TABLE [Rpr].[FactSuperstore]

		INSERT INTO [Rpr].[FactSuperstore]
           ([OrderId]
           ,[ShipId]
           ,[CustomerId]
           ,[SegmentId]
           ,[CountryId]
           ,[CityId]
           ,[StateId]
           ,[RegionId]
           ,[ProductId]
           ,[CategoryId]
           ,[SubcategoryId]
           ,[Sales]
           ,[Quantity]
           ,[Discount]
           ,[Profit])
		SELECT
			[OrderId]
           ,[ShipId]
           ,[CustomerId]
           ,[SegmentId]
           ,[CountryId]
           ,[CityId]
           ,[StateId]
           ,[RegionId]
           ,[ProductId]
           ,[CategoryId]
           ,[SubcategoryId]
           ,[Sales]
           ,[Quantity]
           ,[Discount]
           ,[Profit]
		FROM
			#tmpSup

		SELECT @@ROWCOUNT AS RowsAffected
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	PRINT ERROR_MESSAGE();
END CATCH
GO
