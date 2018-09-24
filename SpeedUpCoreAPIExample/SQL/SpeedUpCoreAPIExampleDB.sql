USE [master]
GO

CREATE DATABASE [SpeedUpCoreAPIExampleDB] 
GO 
 
USE [SpeedUpCoreAPIExampleDB] 
GO 

CREATE TABLE [dbo].[Products] (
    [ProductId] INT         IDENTITY (1, 1) NOT NULL,
    [SKU]       NCHAR (50)  NOT NULL,
    [Name]      NCHAR (150) NOT NULL,
    CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED ([ProductId] ASC)
);
GO

CREATE TABLE [dbo].[Prices] (
    [PriceId]   INT             IDENTITY (1, 1) NOT NULL,
    [ProductId] INT             NOT NULL,
    [Value]     DECIMAL (18, 2) NOT NULL,
    [Supplier]  NCHAR (50)      NOT NULL,
    CONSTRAINT [PK_Prices] PRIMARY KEY CLUSTERED ([PriceId] ASC)
);
GO

ALTER TABLE [dbo].[Prices]  WITH CHECK ADD  CONSTRAINT [FK_Prices_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Prices] CHECK CONSTRAINT [FK_Prices_Products]
GO

INSERT INTO Products ([SKU], [Name]) VALUES ('aaa', 'Product1');
INSERT INTO Products ([SKU], [Name]) VALUES ('aab', 'Product2');
INSERT INTO Products ([SKU], [Name]) VALUES ('abc', 'Product3');

INSERT INTO Prices ([ProductId], [Value], [Supplier]) VALUES (1, 100, 'Bosch');
INSERT INTO Prices ([ProductId], [Value], [Supplier]) VALUES (1, 125, 'LG');
INSERT INTO Prices ([ProductId], [Value], [Supplier]) VALUES (1, 130, 'Garmin');

INSERT INTO Prices ([ProductId], [Value], [Supplier]) VALUES (2, 140, 'Bosch');
INSERT INTO Prices ([ProductId], [Value], [Supplier]) VALUES (2, 145, 'LG');
INSERT INTO Prices ([ProductId], [Value], [Supplier]) VALUES (2, 150, 'Garmin');

INSERT INTO Prices ([ProductId], [Value], [Supplier]) VALUES (3, 160, 'Bosch');
INSERT INTO Prices ([ProductId], [Value], [Supplier]) VALUES (3, 165, 'LG');
INSERT INTO Prices ([ProductId], [Value], [Supplier]) VALUES (3, 170, 'Garmin');

GO