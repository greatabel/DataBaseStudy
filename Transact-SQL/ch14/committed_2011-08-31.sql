--- query 1
set transaction isolation level read committed

begin tran
print 'Now you see it...'
select top 5 * from sales

waitfor delay '00:00:05'
print 'you don''t '


select top 5 * from sales
go
rollback tran

--query 2 : run query 2 when query 1 is running 
set transaction isolation level read committed
update sales set qty=1 where stor_id=6380

  
 