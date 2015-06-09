if exists( select * from tempdb.dbo.sysobjects where id=object_id(N'tempdb..#house') and type='U') drop table #house

create table #house( mls int ,mls_num int)
insert #house  values(311,3110000)
insert #house  values(311,3110001)
insert #house  values(311,3110002)
insert #house  values(311,3110003)
insert #house  values(312,3120000)
insert #house  values(312,3120001)
insert #house  values(312,3120002)
insert #house  values(312,3120003)
insert #house  values(112,1120000)
insert #house  values(112,1120001)
insert #house  values(112,1120002)

select * from #house 

select 
GETDATE() as 'Date',
SUM(case mls when 311 then 1 else null end) as '311',

SUM(case mls when 312 then 1 else null end) as '312',
SUM(case mls when 112 then 1 else null end) as '112'

from #house



