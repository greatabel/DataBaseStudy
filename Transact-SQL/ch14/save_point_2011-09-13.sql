select 'before begin tran main' ,@@TRANCOUNT 
begin tran main
  select 'after begin tran main',@@TRANCOUNT 
   delete sales 
    save tran sales -- make a save point
   select 'after save tran sales',@@TRANCOUNT 
     begin tran nested
     select' after begin tran nested',@@TRANCOUNT 
     delete titleauthor 
     save tran titleauthor
     select 'after save tran titleauthor',@@TRANCOUNT 
   rollback tran sales
select 'after rollback tran sales',@@TRANCOUNT 
select top 5 au_id from titleauthor 
if @@TRANCOUNT >0 begin
 rollback tran
 select 'after rollback tran',@@TRANCOUNT 
 end
 
 select top 4 au_id from titleauthor 