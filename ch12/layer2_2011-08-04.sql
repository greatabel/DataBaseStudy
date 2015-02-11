if(OBJECT_ID ('Dinosaurs') is not null) 
drop table Dinosaurs
go
if exists( select * from tempdb.dbo.sysobjects where id=object_id(N'tempdb..#work') and type='U') drop table #work
if exists( select * from tempdb.dbo.sysobjects where id=object_id(N'tempdb..#Dinosaurs') and type='U') drop table #Dinosaurs
go

create table Dinosaurs(OrderNo int Primary key , OrderName varchar(100),
PrecessorNo int null references Dinosaurs (OrderNo))

 insert Dinosaurs values(1,'one',1)
 insert Dinosaurs values(2,'two',1)
 insert Dinosaurs values(3,'three',2)
 insert Dinosaurs values(4,'four',2)
 insert Dinosaurs values(5,'one5',3)
 insert Dinosaurs values(6,'one6',3)
 insert Dinosaurs values(7,'one7',4)
 insert Dinosaurs values(8,'one8',7)
 select * from Dinosaurs ;
 
 create table #work(lvl int ,OrderNo int)
 create table #Dinosaurs(seq int identity,lvl int ,OrderNo int)
 
 declare @lvl int ,@curr int
 select top 1 @lvl=1 ,@curr =OrderNo from Dinosaurs where OrderNo =PrecessorNo 
 
 insert into #work (lvl ,OrderNo ) values(@lvl ,@curr )
 
 --select * from #work 
 --select @lvl as '1' ,@curr as '2'
 
 while(@lvl >0) begin
 
 if exists(select * from #work where lvl=@lvl )  begin
  select top 1 @curr =OrderNo from #work 
  where lvl=@lvl 
  
  insert #Dinosaurs (lvl ,OrderNo ) values(@lvl ,@curr )
  
  delete from  #work 
  where lvl=@lvl  and OrderNo=@curr 
  
  insert #work 
  select @lvl+1,OrderNo 
  from Dinosaurs 
  where PrecessorNo =@curr 
  and PrecessorNo <>OrderNo 
  
 
 if(@@ROWCOUNT >0) set @lvl =@lvl +1
 end else
 set @lvl =@lvl -1
 
 end 
 
 select * from #Dinosaurs 
 
 select 'Dinosaur Orders'= REPLICATE ('         ',lvl)+i.OrderName 
 from #Dinosaurs d join Dinosaurs i on(d.OrderNo =i.OrderNo)
 order by seq
