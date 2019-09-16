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

select * from #dist order by c1

--
set rowcount 4
select * from #dist order by c1 desc
set rowcount 0

select '÷ÿ∏¥'
--deal with duplicate
declare @a int
-- get third distinct value
select distinct top 3 @a=c1 from #dist order by c1 
select * from #dist where c1<=@a order by c1 
