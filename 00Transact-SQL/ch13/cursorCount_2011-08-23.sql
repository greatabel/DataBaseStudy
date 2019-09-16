if exists( select * from tempdb.dbo.sysobjects where id=object_id(N'tempdb..#temp') and type='U') drop table #temp
create table #temp (k1 int identity,c1 int null)

insert #temp default values

insert #temp default values

insert #temp default values

insert #temp default values

declare GlobalCursor Cursor static -- declare a global cursor
global
for select k1,c1 from #temp

declare LocalCursor Cursor static -- declare a local cursor
local
for select k1,c1 from #temp where k1<3

open global GlobalCursor
select @@CURSOR_ROWS as NumberOfGlobalCursorRows

open LocalCursor
select @@CURSOR_ROWS as NumberOfLocalCursorRows
close global GlobalCursor
deallocate global GlobalCursor
close LocalCursor
deallocate LocalCursor
go
drop table #temp 