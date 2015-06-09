drop table #valueset
create table #valueset (k1 int identity,c1 int)
insert #valueset (c1) values(20)
insert #valueset (c1) values(30)
insert #valueset (c1) values(20)
insert #valueset (c1) values(20)
insert #valueset (c1) values(20)
insert #valueset (c1) values(40)

select v.k1
from #valueset v join #valueset a
on( v.c1 =20) and (a.c1=20) and (ABS(a.k1-v.k1)=1)
group by v.k1 