USE [GarmentsPro]
GO

/****** Object:  StoredProcedure [dbo].[InsertOrder]    Script Date: 14-07-2022 03:08:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[InsertOrder] 
  
 
 @ClientName   Varchar (50),
 @OrderType   Varchar (50) ,
 @Qty   Int ,
 @ETA_Time   Varchar (30) ,
 @Status   Varchar (50),
 @Created_Date Smalldatetime =null

  as
  begin
   declare @OrderID  as varchar (30)
   
   select  @OrderID = 'ORD' + (select replace(convert(varchar, getdate(), 103), '/', '') + replace(convert(varchar,getdate(), 108),':','')) 
   
   print @OrderID 
   set  @Created_Date=ISNULL( @Created_Date,GETDATE())

  Insert into Orders (OrderID, ClientName,OrderType,Qty,ETA_Time,Status,Created_Date) 
  values (@OrderID, @ClientName,@OrderType , @Qty,  @ETA_Time,  @Status ,(GETDATE())) 
  END 
GO

