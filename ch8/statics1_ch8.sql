if exists( select * from tempdb.dbo.sysobjects where id=object_id(N'tempdb..#valueset') and type='U')
drop table #valueset

create table #valueset (k1 int identity,c1 int)
insert #valueset(c1) values(20)
insert #valueset(c1) values(30)
insert #valueset(c1) values(40)
insert #valueset(c1) values(200)
insert #valueset(c1) values(300)
insert #valueset(c1) values(400)
insert #valueset(c1) values(2000)
insert #valueset(c1) values(3000)
insert #valueset(c1) values(4000)

select v.c1,RunningTotal=sum(a.c1)
from #valueset v cross join #valueset a
where (a.k1<=v.k1)
group by v.k1 ,v.c1
order by v.k1,v.c1

select v.c1,RunningAVG=avg(a.c1)
from #valueset v cross join #valueset a
where (a.k1<=v.k1)
group by v.k1 ,v.c1
order by v.k1,v.c1

select RowNumber=count(*),v.c1
from #valueset v cross join #valueset a
where (a.k1<=v.k1)
group by v.k1 ,v.c1
order by v.k1,v.c1

select v.k1,SlidingSUM=sum(a.c1*1.0)
from #valueset v cross join #valueset a
where (a.k1 between v.k1-3 and v.k1)
group by v.k1 ,v.c1
order by v.k1,v.c1

