SELECT top 3 with ties [dcType],count(*) as NumInstances    
 FROM [testDB].[dbo].[Map_main]
group by dcType
order by NumInstances desc

select dcType FROM [testDB].[dbo].[Map_main]
