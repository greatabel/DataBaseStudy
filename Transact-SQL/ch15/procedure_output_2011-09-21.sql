use pubs
if OBJECT_ID('dbo.listsales') is not null
drop proc dbo.listsales
go

create proc dbo.listsales @bestseller tid out, @topsales int out,
 @salescursor cursor varying out
 as
  
 select @bestseller =bestseller, @topsales =totalsales
 from
 (
 select top 1 title_id as bestseller,sum(qty) as totalsales
 from sales
 group by title_id
 order by 2 desc 
 ) bestsellers
 
 declare s cursor
  local
  for select * from sales where title_id=@bestseller
  
  open s
  set @salescursor = s
  return (0)
   
   
     ---------- partII : use the procedure
  declare @topsales int ,@bestseller tid ,@salescursor cursor
  exec listsales @bestseller out,@topsales out,@salescursor out
  select @bestseller ,@topsales 
  fetch @salescursor
  close @salescursor
  deallocate @salescursor
  

