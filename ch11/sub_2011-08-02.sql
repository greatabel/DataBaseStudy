if exists( select * from tempdb.dbo.sysobjects where id=object_id(N'tempdb..#Population_Estimate') and type='U') drop table #Population_Estimate

create table #Population_Estimate (region char(10),state char(10),Population int)

insert #Population_Estimate values('West','CA',31000000);
insert #Population_Estimate values('South','TX',19000000);
insert #Population_Estimate values('North','NY',18000000);
insert #Population_Estimate values('West1','CAX1',1100000);
insert #Population_Estimate values('West2','CAX2',2100000);
insert #Population_Estimate values('West3','CAX3',3100000);
insert #Population_Estimate values('West3','CAX4',3000000);
----method1
select top 3 state,region,population
from #Population_Estimate 
order by Population desc

---method2
set rowcount 3

select state,region,population 
from #Population_Estimate 
order by Population desc

set rowcount 0  -- reset rowcount

---method3
select top 4 state,region,Population=Population/1000000
from #Population_Estimate 
order by Population /1000000 desc;
---method3A
select top 4 with ties state,region,Population=Population/1000000
from #Population_Estimate 
order by Population /1000000 desc;

