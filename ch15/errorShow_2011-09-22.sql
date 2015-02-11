use pubs 
declare c cursor
for select title_id ,sum(qty) as sales from sales group by title_id

declare @title_id tid,@qty int

open c

raiserror('starting loop',1,1) 
while(@@ERROR <=1 ) begin
 fetch c into @title_id,@qty
 if(@@FETCH_STATUS =0)
 raiserror('title id %s have sold %d units',1,1,@title_id,@qty)
 else
  break
end
 
close c
deallocate c