if exists( select * from tempdb.dbo.sysobjects where id=object_id(N'tempdb..#1996_POP_ESTIMATE') and type='U')
drop table #1996_POP_ESTIMATE

create table #1996_POP_ESTIMATE(Region char(7),
state char(2),
Population int)

insert #1996_POP_ESTIMATE values('West','CA',11111)
insert #1996_POP_ESTIMATE values('South','TX',21112)
insert #1996_POP_ESTIMATE values('North','XX',31113)
insert #1996_POP_ESTIMATE values('West','YY',41114)

select * from ( select top 2 with ties state ,Region,Population=Population/1000
 from #1996_POP_ESTIMATE order by Population/1000) p
order by Population desc