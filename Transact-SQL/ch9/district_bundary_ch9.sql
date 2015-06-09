create table #valueset(k1 int identity,c1 int)
insert #valueset (c1) values(20)
insert #valueset (c1) values(30)
insert #valueset (c1) values(40)
insert #valueset (c1) values(0)
insert #valueset (c1) values(0)
insert #valueset (c1) values(0)
insert #valueset (c1) values(120)
insert #valueset (c1) values(0)
insert #valueset (c1) values(0)

select v.k1
from #valueset v join #valueset a on(v.c1 =0)
group by v.k1
having( ISNULL (min(case when a.k1>v.k1 and a.c1!=0 then a.k1 else null end)-1,MAX(case when a.k1>v.k1 then a.k1 else v.k1 end))
-
ISNULL (max(case when a.k1<v.k1 and a.c1!=0 then a.k1 else null end)+1,Min(case when a.k1<v.k1 then a.k1 else v.k1 end)))+1>=3