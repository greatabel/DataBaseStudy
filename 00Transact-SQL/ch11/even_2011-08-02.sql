if exists( select * from tempdb.dbo.sysobjects where id=object_id(N'tempdb..#set1') and type='U') drop table #set1

create table #set1(k1 int identity)

insert #set1 default values
insert #set1 default values
insert #set1 default values
insert #set1 default values
insert #set1 default values
insert #set1 default values
insert #set1 default values
insert #set1 default values

select s1.k1
from #set1 s1 join #set1 s2 on( s1.k1 >=s2.k1 )
group by s1.k1 
having ( COUNT(*)%2)=0 