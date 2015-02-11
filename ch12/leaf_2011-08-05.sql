if exists( select * from tempdb.dbo.sysobjects where id=object_id(N'tempdb..#staff') and type='U') drop table #staff
if exists( select * from tempdb.dbo.sysobjects where id=object_id(N'tempdb..#org_chart') and type='U') drop table #org_chart
create table #staff(employee int primary key,
employee_name varchar(100),
supervisor int null references #staff(employee)
)

insert #staff values(1,'level1-President',1)
insert #staff values(2,'level2-managerA',1)

insert #staff values(3,'lev3-workerA',2)
insert #staff values(4,'lev3-workerB',2)
insert #staff values(5,'level2-mangerB',1)
insert #staff values(6,'lev4-slaveworker',3)

select Grunts= s.employee_name 
from #staff s
where not exists( select * from #staff t where t.supervisor =s.employee )