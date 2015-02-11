if exists( select * from tempdb.dbo.sysobjects where id=object_id(N'tempdb..#series') and type='U') drop table #series

create table #series
(key1 int,
key2 int,
value1 decimal(6,2) Default(
( case (cast(rand()+.5 as int)*-1) when 0 then 1 else -1 end )*(convert(int,rand()*100000)%10000)*rand()
)
)
insert #series (key1,key2) values(1,1)                         
insert #series (key1,key2) values(1,2)
insert #series (key1,key2) values(1,3)  
insert #series (key1,key2) values(2,1) 
insert #series (key1,key2) values(2,2) 
insert #series (key1,key2) values(2,3) 

select * from #series 
--- use the cursor to generate the following code
--- select key1 , sum(case when key2=1 then value1 else null end) [1], sum(case when key2=2 then value1 else null end) [2], sum(case when key2=3 then value1 else null end) [3] from #series group by key1
---

declare s cursor for select distinct key2 from #series order by key2

declare @key2 int ,@key2str varchar(10),@sql varchar(8000)

open s
fetch  s into @key2
set @sql=''
while(@@FETCH_STATUS =0) begin
set @key2str=cast(@key2 as varchar)
set @sql =@sql+', sum(case when key2='+@key2str +' then value1 else null end) ['+@key2str  +']'
fetch s into @key2
end

set @sql ='select key1 '+@sql+' from #series group by key1'
exec(@sql)

close s
deallocate s
drop table #series 
