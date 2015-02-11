--- query 1
set transaction isolation level repeatable read

begin tran
print 'Nothing up ...'
select top 5 * from sales

waitfor delay '00:00:05'
print '..exectp this rabbit.'
print 'you don''t '


select top 5 * from sales
go
rollback tran

--query 2 : run query 2 when query 1 is running 
set transaction isolation level repeatable read
insert sales values(6380,999999,getdate(),2,'usd','test')


  
 