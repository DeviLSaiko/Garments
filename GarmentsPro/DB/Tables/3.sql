USE [GarmentsPro]
GO

/****** Object:  Table [dbo].[OrderHistory]    Script Date: 14-07-2022 03:07:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[OrderHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [varchar](30) NULL,
	[Current_Department] [int] NULL,
	[Status] [int] NULL,
	[Remarks] [varchar](100) NULL,
	[Created_Date] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[OrderHistory] ADD  DEFAULT (getdate()) FOR [Created_Date]
GO

