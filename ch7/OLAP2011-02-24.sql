if exists( select * from tempdb.dbo.sysobjects where id=object_id(N'tempdb..#crosstab') and type='U')
drop table #crosstab

create table #crosstab (yr int, qtr int ,sales money)

insert #crosstab values(1999,1,4)
insert #crosstab values(1999,2,5)
insert #crosstab values(1999,3,6)
insert #crosstab values(1999,4,7)
insert #crosstab values(2000,1,54)
insert #crosstab values(2000,2,55)
insert #crosstab values(2000,3,56)
insert #crosstab values(2000,4,57)
insert #crosstab values(2001,1,1)
insert #crosstab values(2001,2,2)
insert #crosstab values(2001,3,3)
insert #crosstab values(2001,4,4)

select * from #crosstab

select yr as 'statistic year',
sum( case qtr when 1 then sales else null end) as Q1,
sum( case qtr when 2 then sales else null end) as Q2,
sum( case qtr when 3 then sales else null end) as Q3,
sum( case qtr when 4 then sales else null end) as Q4,
sum(sales) as Total
from #crosstab
group by yr