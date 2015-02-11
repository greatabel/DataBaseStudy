if exists( select * from tempdb.dbo.sysobjects where id=object_id(N'tempdb..#dist') and type='U')
drop table #dist
create table #dist(c1 int)
insert #dist values(2)
insert #dist values(3)
insert #dist values(1)
insert #dist values(4)
insert #dist values(8)

--- find median--
select Median=d.c1
from #dist d cross join #dist i
group by d.c1
having count( case when i.c1 <=d.c1 then 1 else null end) = (count(*)+1)/2