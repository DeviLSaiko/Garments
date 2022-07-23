 

  select a.OID, OrderID ,ClientName , OrderType , Qty ,ETA_Time  as Deadline, Created_Date, Status, Yarn_Formation from Orders a join Status b on a.OrderID = b.OID 


  select * from Status


