drop table #valueset
create table #valueset (k1 smalldatetime,c1 int)

insert #valueset(k1,c1) values('19990901',28)
insert #valueset(k1,c1) values('19991001',8)
insert #valueset(k1,c1) values('19991101',28)
insert #valueset(k1,c1) values('19991201',29)
insert #valueset(k1,c1) values('20000101',33)

select v.k1 ,v.c1
from #valueset v join #valueset a
on ( (a.c1>=v.c1) and (a.k1=Dateadd(mm,1,v.k1)))
or ( (a.c1<=v.c1) and (a.k1=Dateadd(mm,-1,v.k1)) )
group by v.k1,v.c1
----------------
select
 startTime=CAST(v.k1 as CHAR(12)),EndTime=CAST(a.k1 as CHAR(12)),
 StartVal=v.c1,EndVal=a.c1,
 CHANGE_TRACKING_CURRENT_VERSION=SUBSTRING ('- +',sign(a.c1-v.c1)+2,1)+CAST(abs(a.c1-v.c1) as varchar)
 from
 (select k1,c1 ,ranking=(select COUNT(distinct k1) from #valueset u
                         where u.k1<=l.k1
                        )
 from #valueset l
 )v left outer join
 (select k1,c1,ranking=(select COUNT(distinct k1) from #valueset u
                        where u.k1<=l.k1
                       )
 from #valueset l
 )a
 on(a.ranking=v.ranking+1)
 where a.k1 is not null
 -----
 
 select
 startTime=CAST(v.k1 as CHAR(12)),EndTime=CAST(a.k1 as CHAR(12)),
 StartVal=v.c1,EndVal=a.c1,
 CHANGE_TRACKING_CURRENT_VERSION=SUBSTRING ('- +',sign(a.c1-v.c1)+2,1)+CAST(abs(a.c1-v.c1) as varchar)
 from
 (select k1,c1 ,ranking=(select COUNT(distinct k1) from #valueset u
                         where u.k1<=l.k1
                        )
 from #valueset l
 )v left outer join
 (select k1,c1,ranking=(select COUNT(distinct k1) from #valueset u
                        where u.k1<=l.k1
                       )
 from #valueset l
 )a
 on(a.ranking=v.ranking+1)
 where a.k1 is not null and v.ranking %2=0