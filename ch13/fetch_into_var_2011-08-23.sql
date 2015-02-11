if exists( select * from tempdb.dbo.sysobjects where id=object_id(N'tempdb..#cursortest') and type='U') drop table #cursortest
create table #cursortest (k1 int identity,c1 int null)

insert #cursortest default values

insert #cursortest default values

insert #cursortest default values

insert #cursortest default values

set nocount on
declare c cursor scroll
for select k1 from #cursortest

declare @k int 

open c
fetch c into @k  --get 1st row

while(@@FETCH_STATUS =0) begin
select @k
fetch c into @k
end 

close c
deallocate c
drop table #cursortest 