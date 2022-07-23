create proc InsertOrder 
  
 
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

  exec  InsertOrder   'E.A.V.Rengachary & Sons' ,'Shorts', 240 ,'2' ,'6' 