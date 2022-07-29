USE [GarmentsPro]
GO

/****** Object:  Table [dbo].[Orders]    Script Date: 14-07-2022 03:07:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Orders](
	[OID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [varchar](30) NOT NULL,
	[ClientName] [varchar](50) NULL,
	[OrderType] [varchar](50) NULL,
	[Qty] [int] NULL,
	[ETA_Time] [varchar](30) NULL,
	[Status] [int] NULL,
	[Created_Date] [smalldatetime] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [Created_Date]
GO

