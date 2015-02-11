if exists( select * from tempdb.dbo.sysobjects where id=object_id(N'tempdb..#array') and type='U') drop table #array
create table #array(band int ,single int ,title varchar(50))

Insert #array values(0,0,'Little bit o'' love00');
Insert #array values(0,1,'Little bit o'' love01');
Insert #array values(0,2,'Little bit o'' love02');
Insert #array values(1,0,'Little bit o'' love10');
Insert #array values(1,1,'Little bit o'' love11');
Insert #array values(1,2,'Little bit o'' love12');
Insert #array values(1,3,'Little bit o'' love13');
Insert #array values(1,4,'Little bit o'' love14');
Insert #array values(2,0,'Little bit ttt love20');
Insert #array values(2,1,'Little bit ttt love21');
Insert #array values(2,2,'Little bit ttt lovet22');
Insert #array values(2,3,'Little bit ttt love23');
Insert #array values(2,4,'Little bit ttt love24');

select band,NumberOfSongPerband=COUNT(single)
from #array 
group by band 

select band ,"Last Song"=MAX(title)
from #array 
group by band 
order by 2

select single  ,"NumberOfbanderPersingle"=COUNT(band)
from #array 
group by single 

------------
declare @i int 
update #array set @i=band ,band=single ,single =@i

select *
from #array 
order by band ,single 