USE [GarmentsPro]
GO

/****** Object:  Table [dbo].[Orders]    Script Date: 07-07-2022 09:56:11 AM ******/
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
	[ETA_Time] [smalldatetime] NULL,
	[Status] [varchar](50) NULL,
	[Created_Date] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [Created_Date]
GO


insert into students (name= 