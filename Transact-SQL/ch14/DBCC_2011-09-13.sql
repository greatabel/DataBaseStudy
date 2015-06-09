dbcc opentran(pubs)

create table #logrecs(
currentlsn varchar(30),
operation varchar(20),
context varchar(20),
transactionID varchar(20),
test bit)


insert #logrecs
exec('DBCC LOG(''pubs'')')

select * from #logrecs 
go
drop table #logrecs 