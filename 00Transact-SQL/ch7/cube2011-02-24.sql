SELECT [stor_id]
      ,[ord_num]
      ,[ord_date]
      ,[qty]
      ,[payterms]
      ,[title_id]
  FROM [pubs].[dbo].[sales]

SELECT [stor_id]
      ,[stor_name]
      ,[stor_address]
      ,[city]
      ,[state]
      ,[zip]
  FROM [pubs].[dbo].[stores]

SELECT [title_id]
      ,[title]
      ,[type]
      ,[pub_id]
      ,[price]
      ,[advance]
      ,[royalty]
      ,[ytd_sales]
      ,[notes]
      ,[pubdate]
  FROM [pubs].[dbo].[titles]


------my script---
select
case grouping(st.stor_name) when 0 then st.stor_name  else 'All abel store' end as myStore,
case grouping(t.type) when 0 then t.type else 'All abel Types' end as myType,
sum(s.qty) as TotalSold

from sales s join titles t on( s.title_id = t.title_id)
join stores st on ( s.stor_id=st.stor_id)
group by st.stor_name,t.type with cube