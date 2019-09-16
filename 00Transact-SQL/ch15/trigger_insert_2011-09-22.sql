set nocount on
use pubs 
drop trigger SalesQty_Insert_Update
go
create trigger SalesQty_Insert_Update on sales for insert,update as

if @@ROWCOUNT =0 return --no rows affects,exit

if(UPDATE(qty)) and (select MIN(qty) from inserted)<10 begin
 raiserror('Mininum order is 10 unit',16,10)
  rollback tran
  return
 end
 go
 
 --test a single -row insert
 begin tran
  insert sales values(6380,'ORD9997',GETDATE(),5,'Net 60','BU1032')
  if @@TRANCOUNT >0 rollback tran
  go
  
 --test a mutilrow insert
 begin tran
  insert sales 
   select stor_id,ord_num+'A',ord_date,5,payterms,title_id from sales 
 if @@TRANCOUNT >0 rollback tran
 go
 
 