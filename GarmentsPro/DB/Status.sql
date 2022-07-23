 
 Select * from  Status 
  truncate table status 
  drop table status 


  Create table Status(
  SID int identity (1,1)   primary key  ,
  OID varchar(25),
  Yarn_Formation varchar(25),
  Fabric_Formation varchar(25),
  Wet_Processing  varchar(25),
  Fabrication  varchar(25),
  Finished_Goods  varchar(25),
  )

  Create table Status(
  ID int identity ,
  Status varchar (30) 
  )

  select * from Status

  insert into Status (Status) values ('Created')
    insert into Status (Status) values ('In Progress')
	insert into Status (Status) values ('On Hold')
	insert into Status (Status) values ('Finished')
	insert into Status (Status) values ('Cancelled')


