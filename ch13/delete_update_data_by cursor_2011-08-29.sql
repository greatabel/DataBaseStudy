use pubs
select * from sales

set cursor_close_on_commit off

set nocount on
declare c cursor dynamic
for select * from sales

open c
fetch c

begin tran  --start a transaction 
update sales set qty=qty+1 where current of c

fetch relative 0 from c

fetch c

delete sales where current of c
select * from sales where qty =3

rollback tran --throw away our changes

select * from sales where qty =3

close c   

deallocate c