if exists( select * from tempdb.dbo.sysobjects where id=object_id(N'tempdb..#dist') and type='U')
drop table #dist

create table #dist(c1 int)
insert #dist values(2)
insert #dist values(3)
insert #dist values(1)
insert #dist values(1)
insert #dist values(1)
insert #dist values(4)
insert #dist values(4)
insert #dist values(8)


select l.ranking,l.c1
from
(select ranking=(select count(distinct a.c1) from #dist a where v.c1<=a.c1),v.c1 from #dist v)
 l 
order by l.ranking

----method 2--
select ranking =identity(int),c1
into #rankings
from #dist
where 1=2

insert #rankings (c1)
select c1
from #dist
order by c1 desc

select * from #rankings order by ranking
drop table #rankings
