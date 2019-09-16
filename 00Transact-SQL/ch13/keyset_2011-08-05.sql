if exists( select * from tempdb.dbo.sysobjects where id=object_id(N'tempdb..#temp1') and type='U') drop table #temp1
create table #temp1 (k1 int identity primary key,c1 int null)

insert #temp1 default values
insert #temp1 default values
insert #temp1 default values
insert #temp1 default values
insert #temp1 default values
insert #temp1 default values

select * from #temp1 

declare c cursor keyset
for select k1,c1 from #temp1

open c         --entire result set is copied to tempdb



update #temp1 
set c1=2
where k1=1 or k1=3

insert #temp1 values(10) -- won't be visible to cursor
fetch c
fetch c
fetch prior from c
fetch last from c

select * from #temp1 

close c
deallocate c
go

drop table #temp1 