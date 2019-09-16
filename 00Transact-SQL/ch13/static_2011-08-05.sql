if exists( select * from tempdb.dbo.sysobjects where id=object_id(N'tempdb..#temp') and type='U') drop table #temp
create table #temp (k1 int identity,c1 int null)

insert #temp default values
insert #temp default values
insert #temp default values
insert #temp default values
insert #temp default values
insert #temp default values

select * from #temp 

declare c cursor static
for select k1,c1 from #temp

open c         --entire result set is copied to tempdb

fetch c

update #temp 
set c1=2
where k1=1 or k1=3

fetch c
fetch prior from c

select * from #temp 

close c
deallocate c
go

drop table #temp 