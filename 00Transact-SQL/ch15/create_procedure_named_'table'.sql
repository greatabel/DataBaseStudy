use pubs 
set quoted_identifier on
go

if OBJECT_ID('table') is not null
 drop proc "table"
 go
 
 create proc "table" @tableclause varchar(8000),
 @columnclaus varchar(8000)='*',
 @whereclause varchar(8000)=null,
 @groupbyclause varchar(8000)=null,
 @havingcluase varchar(8000)=null,
@orderbyclause varchar(8000)=null,
 @computeclause varchar(8000)=null
 as
declare @execstr varchar(8000)
set @execstr ='select '+@columnclaus +' from '+@tableclause 
+ISNULL(' where '+@whereclause ,' ')
+ISNULL (' Group by '+ @groupbyclause ,' ')
+ISNULL (' having ' +@havingcluase,' ')
+ISNULL (' order by '+@orderbyclause,' ')
+ISNULL (' compute '+@computeclause ,'')

---use procedure
exec(@execstr)
go
set quoted_identifier off
go


