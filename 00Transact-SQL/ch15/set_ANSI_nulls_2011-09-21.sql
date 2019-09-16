if exists( select * from tempdb.dbo.sysobjects where id=object_id(N'tempdb..#test') and type='U') drop table #test
create table #test(test1 nvarchar(10),test2 nvarchar(10));

insert #test values('test',null);

insert #test values('haha','ha');

if(OBJECT_ID('dbo.ListingRegionEmployees') is not null)
drop proc dbo.ListingRegionEmployees
go
set ansi_nulls off
go
create proc dbo.ListingRegionEmployees @region nvarchar(30) as
select * from #test where test2 =@region
go
set ansi_nulls on
go

exec ListingRegionEmployees Null