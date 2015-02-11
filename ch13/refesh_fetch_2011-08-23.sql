use pubs
 select title_id ,qty from sales order by qty

set cursor_close_on_commit off  
set nocount on

declare c cursor scroll
for select title_id ,qty from sales order by qty

open c

begin tran --so that we can undo the changes we make
print 'before image'
fetch c

update sales set qty=10
where qty=1 

print 'after image'
fetch relative 0 from c

rollback tran

close c
deallocate c
