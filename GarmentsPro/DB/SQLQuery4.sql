/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [SID]
      ,[OID]
      ,[Yarn_Formation]
      ,[Fabric_Formation]
      ,[Wet_Processing]
      ,[Fabrication]
      ,[Finished_Goods]
  FROM [GarmentsPro].[dbo].[Status]

Insert into (OrderID,ClientName,OrderType,Qty,ETA_Time,Status) values ( ( 'ORDid-' + (select replace(convert(varchar, getdate(), 101), '/', '') + replace(convert(varchar,getdate(), 108), ':', '')  ) )  ,@CN,@OType,@Qty,@ETA,@Stat)", MyCon);

drop table orders



  insert into status  (Yarn_Formation ,OID )  VALUES  (  'ORDid-' + (select replace(convert(varchar, getdate(), 101), '/', '') + replace(convert(varchar,getdate(), 108), ':', '')  )  , 'DSF' );