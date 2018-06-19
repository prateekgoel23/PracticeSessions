USE [Work]
GO

/****** Object: Table [dbo].[SuperMarket] Script Date: 6/19/2018 2:29:13 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE [dbo].[SuperMarket];


GO
CREATE TABLE [dbo].[SuperMarket] (
    [FacilityName]      VARCHAR (50) NOT NULL,
    [StreeetNo]         VARCHAR (50) NOT NULL,
    [StreetName_Suffix] VARCHAR (50) NOT NULL,
    [StreetDirection]   VARCHAR (50) NULL,
    [UnitNumber]        VARCHAR (50) NULL,
    [Municipality]      VARCHAR (50) NULL,
    [Telephone]         VARCHAR (50) NULL,
    [Fax]               VARCHAR (50) NULL,
    [LONGITUDE]         VARCHAR (50) NULL,
    [LATITUDE]          VARCHAR (50) NULL
);


