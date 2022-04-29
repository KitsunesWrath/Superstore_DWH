--DROP TABLE IF EXISTS [Rpr].[Order]
CREATE TABLE [Rpr].[Order]
( 
	OrderId NVARCHAR(25),
	OrderDate DATE NOT NULL,
	Returned nvarchar(5) DEFAULT 'No',
	CONSTRAINT [PK_Order_OrderId] PRIMARY KEY CLUSTERED 
	(
		[OrderId] ASC
	)
)




--DROP TABLE IF EXISTS [Rpr].[Ship]
CREATE TABLE [Rpr].[Ship]
(
	ShipId INT IDENTITY(1,1),
	ShipDate DATE NOT NULL,
	ShipMode nvarchar(25)
	CONSTRAINT [PK_Ship_ShipId] PRIMARY KEY CLUSTERED 
	(
		[ShipId] ASC
	)
)





--DROP TABLE IF EXISTS [Rpr].[Customer]
CREATE TABLE [Rpr].[Customer]
(
	CustomerId nvarchar(15),
	CustomerName nvarchar(50) NOT NULL
	CONSTRAINT [PK_Customer_CustomerId] PRIMARY KEY CLUSTERED 
	(
		[CustomerId] ASC
	)
)





--DROP TABLE IF EXISTS [Rpr].[Segment]
CREATE TABLE [Rpr].[Segment]
(
	SegmentId INT IDENTITY(1,1),
	Segment nvarchar(15)
	CONSTRAINT [PK_Segment_SegmentId] PRIMARY KEY CLUSTERED 
	(
		[SegmentId] ASC
	)
)




--DROP TABLE IF EXISTS [Rpr].[Country]
CREATE TABLE [Rpr].[Country]
(
	CountryId INT IDENTITY(1,1),
	Country nvarchar(50)
	CONSTRAINT [PK_Country_CountryId] PRIMARY KEY CLUSTERED 
	(
		[CountryId] ASC
	)
)





--DROP TABLE IF EXISTS [Rpr].[City]
CREATE TABLE [Rpr].[City]
(
	CityId INT IDENTITY(1,1),
	City nvarchar(50),
	PostalCode nvarchar(10),
	CONSTRAINT [PK_City_CityId] PRIMARY KEY CLUSTERED 
	(
		[CityId] ASC
	)
)




--DROP TABLE IF EXISTS [Rpr].[State]
CREATE TABLE [Rpr].[State]
(
	StateId INT IDENTITY(1,1),
	State nvarchar(50),
	CONSTRAINT [PK_State_StateId] PRIMARY KEY CLUSTERED 
	(
		[StateId] ASC
	)
)





--DROP TABLE IF EXISTS [Rpr].[Region]
CREATE TABLE [Rpr].[Region]
(
	RegionId INT IDENTITY(1,1),
	PersonId INT FOREIGN KEY REFERENCES [Rpr].[People](PersonId),
	Region nvarchar(10),
	CONSTRAINT [PK_Region_RegionId] PRIMARY KEY CLUSTERED 
	(
		[RegionId] ASC
	)
)




--DROP TABLE IF EXISTS [Rpr].[Product]
CREATE TABLE [Rpr].[Product]
(
	ProductId INT IDENTITY(1,1),
	ProductCode NVARCHAR(100),
	ProductName NVARCHAR(MAX),
	CONSTRAINT [PK_Product_ProductId] PRIMARY KEY CLUSTERED 
	(
		[ProductId] ASC
	)
)




--DROP TABLE IF EXISTS [Rpr].[Category]
CREATE TABLE [Rpr].[Category]
(
	CategoryId INT IDENTITY(1,1),
	Category nvarchar(50),
	CONSTRAINT [PK_Category_CategoryId] PRIMARY KEY CLUSTERED 
	(
		[CategoryId] ASC
	)
)




--DROP TABLE IF EXISTS [Rpr].[Subcategory]
CREATE TABLE [Rpr].[Subcategory]
(
	SubcategoryId INT IDENTITY(1,1),
	Subcategory nvarchar(50),
	CONSTRAINT [PK_Subcategory_SubcategoryId] PRIMARY KEY CLUSTERED 
	(
		[SubcategoryId] ASC
	)
)




--DROP TABLE IF EXISTS [Rpr].[People]
CREATE TABLE [Rpr].[People]
(	
	PersonId INT IDENTITY(1,1),
	Person nvarchar(50),
	CONSTRAINT [PK_People_PersonId] PRIMARY KEY CLUSTERED 
	(
		[PersonId] ASC
	)
)




-- DROP TABLE IF EXISTS [Rpr].[FactSuperstore]
CREATE TABLE [Rpr].[FactSuperstore]
(
	[Id] INT IDENTITY(1,1),
	[OrderId] nvarchar(25) FOREIGN KEY REFERENCES [Rpr].[Order](OrderId),
	[ShipId] INT FOREIGN KEY REFERENCES [Rpr].[Ship](ShipId),
	[CustomerId] nvarchar(15) FOREIGN KEY REFERENCES [Rpr].[Customer](CustomerId),
	[SegmentId] INT FOREIGN KEY REFERENCES [Rpr].[Segment](SegmentId),
	[CountryId] INT FOREIGN KEY REFERENCES [Rpr].[Country](CountryId),
	[CityId] INT FOREIGN KEY REFERENCES [Rpr].[City](CityId),
	[StateId] INT FOREIGN KEY REFERENCES [Rpr].[State](StateId),
	[RegionId] INT FOREIGN KEY REFERENCES [Rpr].[Region](RegionId),
	[ProductId] INT FOREIGN KEY REFERENCES [Rpr].[Product](ProductId),
	[CategoryId] INT FOREIGN KEY REFERENCES [Rpr].[Category](CategoryId),
	[SubcategoryId] INT FOREIGN KEY REFERENCES [Rpr].[Subcategory](SubcategoryId),
	[Sales] decimal(10,4),
	[Quantity] INT,
	[Discount] decimal(5,2),
	[Profit] decimal(10,4)
	CONSTRAINT [PK_FactSuperstore_Id] PRIMARY KEY CLUSTERED 
	(
		[Id] ASC
	)
)
GO

