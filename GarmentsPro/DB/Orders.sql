  select *  from Orders
   select *  from Orderstatus
 



DECLARE @tmp DATETIME
SET @tmp = GETDATE()

EXEC DisplayDate @tmp;

drop table orders

CREATE TABLE  Orders (
	 OID   Int  IDENTITY(1,1)  NOT NULL,
	 OrderID   Varchar (30) not null,
	 ClientName   Varchar (50) NULL,
	 OrderType   Varchar (50) NULL,
	 Qty   Int  NULL,
	 ETA_Time   Varchar (30) NULL,
	 Status   Varchar (50) NULL,
	 Created_Date   Smalldatetime  DEFAULT (getdate())
)

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





 drop table  orders
 TRUNCATE Table Orders

 
 /**Convert long Date to Plain string **/
  
  SELECT( 'ORD' + (select replace(convert(varchar, getdate(), 101), '/', '') + replace(convert(varchar,getdate(), 108), ':', '')  )) AS orderID
  
  select replace(convert(varchar, getdate(), 101), '/', '') + replace(convert(varchar,getdate(), 108), ':', '')


  select  OrderID,ClientName,OrderType,Qty,ETA_Time,Created_Date , Yarn_Formation ,  Fabric_Formation , Wet_Processing , Fabrication , Finished_Goods from Orders a right join OrderStatus b on OrderID=b.OID

  --Yarn_Formation]
  --Fabric_Formation]
  --Wet_Processing]
  --Fabrication]
  --Finished_Goods]

  
select * from OrderStatus
Select * from Status

truncate table Status
truncate table OrderStatus

  --for inserting into 2 tables
INSERT INTO  OrderStatus (OID,Yarn_Formation) OUTPUT  inserted.OID, inserted.Yarn_Formation

INTO Status (OID,Yarn_Formation) VALUES(1,'IN Progress'), (2, 'dsgs')
GO

--For updating two tables
 
BEGIN TRANSACTION; 
UPDATE OrderStatus SET OrderStatus.Yarn_Formation ='1'   FROM OrderStatus T1,  Status T2 WHERE T1.OID = T2.OID and T1.OID = 'ORD07102022121446';
UPDATE Status SET Status.Yarn_Formation ='1'  FROM OrderStatus T1, Status T2 WHERE T1.OID = T2.OID and T1.OID = 'ORD07102022121446';
COMMIT; 


select   a.OID, OrderID ,ClientName , OrderType , Qty ,ETA_Time  as Deadline, Created_Date, Status,
b.Fabric_Formation from Orders a join OrderStatus b on a.OrderID = b.OID where b.Yarn_Formation = 'Completed'


select * from Orders      
select * from Status

select * from OrderStatus

select   a.OID, OrderID ,ClientName , OrderType , Qty ,ETA_Time  as Deadline, Created_Date, Status,
b.Fabric_Formation from Orders a join OrderStatus b on a.OrderID = b.OID where b.Yarn_Formation = 'Completed' 

  select *  from Orders
   select *  from Orderstatus
   select * from OrderHistory


Select b.OrderID , ClientName , OrderType , Qty ,Eta_Time , b.Status  from Orders a join OrderStatus  b on a.OrderID =b.OrderID 

--Yarn Formation LoadGrid

Select a.OrderID , ClientName , OrderType , Qty ,Eta_Time as Deadline , b.Status as Status  , b.Current_Department from Orders a join
OrderStatus  b on a.OrderID =b.OrderID   where b.Status!='4' and b.Status!='5'

--Fabric Formation

Select a.OrderID , ClientName , OrderType , Qty ,Eta_Time as Deadline , b.Status as Status  , b.Current_Department from Orders a join
OrderStatus b on a.OrderID =b.OrderID join OrderHistory c on a.OrderID =c.OrderID  where b.Status='4' and b.Current_Department='2'




 Select a.OrderID , ClientName , OrderType , Qty ,Eta_Time as Deadline , b.Status as Status  ,
 b.Current_Department from Orders a join OrderStatus b on a.OrderID = b.OrderID  
 where b.Status != '4' and b.Status != '5' and b.Current_Department = '1' 


  Select  * from OrderHistory  where OrderID='ORD14072022115605' and Current_Department=1
    Select  * from OrderHistory  where OrderID='ORD14072022115605' and Current_Department=2
	  Select  * from OrderHistory  where OrderID='ORD14072022115605' and Current_Department=3


	  create proc InsertOrderHistory
@ID  varchar (30),
@CD  int ,
@St int,
@Re varchar(100) 
as 
begin
insert into OrderHistory (OrderID ,Current_Department , Status , Remarks ) values (@ID , @CD,@St , @Re)
end
go
 




 create proc UpdateOrderStatus

 @ID  varchar (30),
@CD  int ,
@St int

as
begin
Update OrderStatus set Current_Department=@CD , Status=@St  where OrderID=@ID
end
go

  select a.ID ,OrderID, c.DepName, b.Status ,Remarks , Created_Date from OrderHistory a join 
  Status b on a.Status=b.ID  join  Departments c on c.DepID=a.Current_Department  where OrderID='ORD20072022113951' order by a.ID  DESC

select OrderID,Current_Department, Status  from OrderStatus a join C where OrderID=@ID


truncate Table orderHistory
truncate Table orderstatus
truncate Table orders


select * from Orders
Select * from OrderStatus
select * from OrderHistory


SELECT count(*) FROM  OrderHistory WHERE Current_Department='1' and Status='4' and Created_Date >= DATEADD (day, -30, GETDATE())


select count (*) from   OrderStatus WHERE  Current_Department='1' AND Status='1'
select count (*) from   OrderStatus WHERE  Current_Department='1' AND Status='2'
select count (*) from   OrderStatus WHERE  Current_Department='1' AND Status='3'
select count (*) from   OrderStatus WHERE   Current_Department='1'AND Status='4'
 
																	 
  

 


	DECLARE   @cnt INT = 1;
WHILE @cnt < 6
BEGIN
   	DECLARE @cntd INT = 1;
WHILE @cntd < 5
BEGIN
   select  count(Status) AS Total from    OrderStatus WHERE  Current_Department=@cnt AND Status=@cntd  
   SET @cntd = @cntd + 1;
END;
   SET @cnt = @cnt + 1;
END;

INSERT INTO dASHBOARD ( )

PRINT   



select * from Orders
Select * from OrderStatus
select * from OrderHistory

SELECT Count(CASE WHEN Status='1'  and Current_Department='2' THEN 2 ELSE 3 END) AS  Table1 , Count(CASE WHEN Status IS NOT NULL THEN 1 ELSE 0 END) AS B ,
	 Count(CASE WHEN Status IS NOT NULL THEN 1 ELSE 0 END) AS C
FROM OrderStatus  


SELECT COUNT(Status),Status FROM OrderStatus GROUP BY  Status

Select * from OrderStatus










 

