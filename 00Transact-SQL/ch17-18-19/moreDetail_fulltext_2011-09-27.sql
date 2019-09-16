--use master --the book is using master,but I find it doesn't work
use pubs  
go
if OBJECT_ID('sp_enable_fulltext') is not null
 drop proc sp_enable_fulltext
 go
 create proc sp_enable_fulltext @tablename sysname,@columname sysname=null,
 @catalogname sysname=null, @startserver varchar(3)='NO'
 
 as
 set nocount on
 
if(FULLTEXTSERVICEPROPERTY('isFulltextInstalled')=0) begin  -- search engine 's not installed
 raiserror('search service is not on %s',16,10,@@servername)
 return -1
 end
 
 declare @catalogstatus int ,@indexname sysname
 
 if(UPPER(@startserver)='YES')
  exec master ..xp_cmdshell 'Net start ',no_output
 
 if(@catalogname is null)
  set @catalogname =DB_NAME ()+'Catalog'
  
 create table #indexes( --used to locate a unique index for use 
 Qualifier sysname null,
 Owner sysname null,
 TableName sysname null,
NonQnique sysname null,
IndexQualifier sysname null,
IndexName sysname null,
Type smallint null,
PositionInIndex smallint null,
ColumnName sysname null,
Collation char(1) null,
Cardinality int null,
Pages int null,
PaiterCondition sysname null)

insert #indexes  
exec sp_statistics @tablename

select @indexname =IndexName from #indexes where NonQnique =0 

drop Table #indexes 

if(@indexname is null ) begin --if no unique indexes ,abort
raiserror('no suitble unique %s',16,10,@tablename)
return -1
end

if(DATABASEPROPERTY (db_name(),'IsFulltextEnabled')<>1) 
exec sp_fulltext_database 'enable'

set @catalogstatus =FULLTEXTCATALOGPROPERTY (@catalogname,'PopulateStatus')

if(@catalogstatus is null)
 exec sp_fulltext_catalog @catalogname,'create'
 else if(@catalogstatus in(0,1,3,4,6,7)) --population in progress
 exec sp_fulltext_catalog @catalogname,'stop'
 
if(OBJECTPROPERTY(Object_id(@tablename),'TableHasactivefulltextindex')=0)
 exec sp_fulltext_table @tablename,'crate',@catalogname,@indexname
 else
  exec sp_fulltext_table @tablename,'deactivate'

if(COLUMNPROPERTY (object_id(@tablename),@columname,'Isfulltextindexed')=0) begin
exec sp_fulltext_column @tablename,@columname,'add'
print 'successfully '+@tablename+','+@columname+' in database'+Db_name()
end else
 print 'column '+@columname+' in table '+Db_name()+'.'+@tablename+' is already fulltext indexed'
 
 exec sp_fulltext_table @tablename,'active'
 exec sp_fulltext_catalog @catalogname,'start_full'
 return 0
 
 ----

--exec sp_statistics 'pub_info'
 sp_enable_fulltext 'pub_info','pr_info'

