if exists( select * from tempdb.dbo.sysobjects where id=object_id(N'tempdb..#set1') and type='U') drop table #set1
if exists( select * from tempdb.dbo.sysobjects where id=object_id(N'tempdb..#set2') and type='U') drop table #set2

create table #set1(col1 int ,col2 int)
create table #set2(col1 int ,col2 int)

insert #set1 values(1,1)
insert #set1 values(2,2)
insert #set1 values(3,3)
insert #set2 values(1,1)
insert #set2 values(2,2)
insert #set2 values(4,4)
insert #set2 values(5,5)
---method1
select * from #set1 s1
where exists(select * from #set2 s2 where s2.col1 =s1.col1 and s2.col2=s1.col2)
--method2
select s1.*
from #set1 s1 inner join #set2 s2
on(s1.col1 =s2.col1 and s1.col2 =s2.col2)