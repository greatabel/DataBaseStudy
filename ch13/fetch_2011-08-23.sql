if exists( select * from tempdb.dbo.sysobjects where id=object_id(N'tempdb..#cursortest') and type='U') drop table #cursortest
create table #cursortest (k1 int identity,c1 int null)

insert #cursortest default values

insert #cursortest default values

insert #cursortest default values

insert #cursortest default values

set nocount on
declare c cursor scroll
for select * from #cursortest

open c
fetch c --get 1st row
fetch absolute 4 from c  --get 4th row
fetch relative -1 from c   -- gets 3th row
fetch last from c 
fetch first from c

close c
deallocate c
drop table #cursortest 