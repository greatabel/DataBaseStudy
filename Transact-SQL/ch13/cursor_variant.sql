use pubs 
go
create proc listsales_cur @title_id tid,@salescursor cursor varying out
as
--declare a local cursor so it's automatically freed when it goes out of scopes
declare c cursor dynamic
local
for select * from sales where title_id like @title_id

declare @sc cursor
set @sc=c

open c
fetch @sc

set @salescursor=@sc
return 0
go
set nocount on
--define a local cursor variable to receive the output parm
declare @mycursor cursor

exec listsales_cur 'BU1032',@mycursor out -- call the procedure

--make shure the returned cursor is open and has at least one row
if(CURSOR_STATUS('variable','@mycursor')=1) begin
 fetch @mycursor
 while(@@FETCH_STATUS =0) begin
 fetch @mycursor
 end
 end

close @mycursor
deallocate @mycursor