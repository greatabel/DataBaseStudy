use pubs
select top 5  * from sales 

begin tran

delete sales 
select top 5 * from sales 
go

rollback tran
select top 5 * from sales
