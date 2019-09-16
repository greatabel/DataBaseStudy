use pubs 
set xact_abort on

select top 5 * from authors

begin tran

delete authors 
delete sales
select top 5 * from authors

rollback tran

print 'end of batch'
go

select top 5 * from authors 

set xact_abort on
