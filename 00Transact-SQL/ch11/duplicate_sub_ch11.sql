if exists( select * from tempdb.dbo.sysobjects where id=object_id(N'tempdb..#set1') and type='U') drop table #set1
if exists( select * from tempdb.dbo.sysobjects where id=object_id(N'tempdb..#set2') and type='U') drop table #set2

create table #set1(col1 int ,col2 int)
create table #set2(col1 int ,col2 int)

insert #set1 values(1,1)
insert #set1 values(1,1)
insert #set1 values(2,2)
insert #set1 values(5,5)
insert #set1 values(3,3)
insert #set2 values(1,1)
insert #set2 values(2,2)
insert #set2 values(4,4)
insert #set2 values(5,5)
insert #set2 values(5,5)

select * from #set1 
union
select * from #set2

select col1,col2
from
(
select col1,col2,Num1=COUNT(*),
Num2=(select COUNT(*) from #set2 where col1=ss1.col1 and col2=ss1.col2)
from #set1 ss1
group by col1,col2)s1
group by col1,col2 
having(ABS(sum(Num1)-SUM(num2))>0

)

