select top 5 * from sales
begin tran
update sales set qty=0
select top 5 * from sales

waitfor delay '00:00:05'
rollback tran
select top 5 * from sales

--query 2 : run query 2 when query 1 is running 
set transaction isolation level read uncommitted
print 'now you see it '
select top 5 * from sales 
where qty=0
if @@ROWCOUNT >0 begin
 waitfor delay '00:00:05'
  
  print 'now you don''t'
  select top 5 * from sales 
  where qty =0
  
end
