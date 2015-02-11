use pubs
declare @tablename sysname,@catalogname sysname,@indexname sysname,@columname sysname

set @tablename ='pub_info'
set @catalogname ='pubsCatalog'
set @indexname ='UPKCL_pubinfo'
set @columname ='pr_info'

exec sp_fulltext_database 'enable'

--drop fulltext catalog 'pubsCatalog'
exec sp_fulltext_catalog @catalogname ,'create'

exec sp_fulltext_table @tablename,'create',@catalogname,@indexname

exec sp_fulltext_column  @tablename,@columname,'add'

exec sp_fulltext_table @tablename,'activate'

exec sp_fulltext_catalog @catalogname,'start_full'
