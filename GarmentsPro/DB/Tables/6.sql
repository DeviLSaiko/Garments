USE [GarmentsPro]
GO

/****** Object:  Table [dbo].[Status]    Script Date: 14-07-2022 03:08:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](30) NULL
) ON [PRIMARY]
GO

