use pubs
if OBJECT_ID ('dbo.listsales') is not null
drop proc dbo.listsales
go
create proc dbo.listsales @title_id tid=null
as

if(@title_id ='/?') goto help --here is basic if


--here is one with begin..end block
if not exists(select * from titles where title_id =@title_id ) begin
print 'invalid title_id'
waitfor delay '00:00:03' --delay 3 seconds 
return -1
end

 
Help:
exec sp_help @objname='listsales'

waitfor delay '00:00:03' --delay 3 seconds
return -1
go

 
