if exists( select * from tempdb.dbo.sysobjects where id=object_id(N'tempdb..#staff') and type='U') drop table #staff
if exists( select * from tempdb.dbo.sysobjects where id=object_id(N'tempdb..#org_chart') and type='U') drop table #org_chart
create table #staff(employee int primary key,
employee_name varchar(25),
supervisor int null references #staff(employee)
)

insert #staff values(1,'level1-President',1)
insert #staff values(2,'level2-managerA',1)

insert #staff values(3,'lev3-workerA',2)
insert #staff values(4,'lev3-workerB',2)
insert #staff values(5,'level2-mangerB',1)
insert #staff values(6,'lev4-slaveworker',3)

select chartdepth=1, employee=o2.employee ,supervisor =o1.employee 
into #org_chart
from #staff o1 inner join #staff o2 on(o1.employee =o2.supervisor )
 
 
while(@@ROWCOUNT >0) begin

insert into #org_chart(chartdepth ,employee ,supervisor )

select distinct o1.chartdepth +1,o2.employee ,o1.supervisor 
from #org_chart o1 inner join #org_chart o2 on(o1.employee =o2.supervisor )
where o1.chartdepth =(select MAX(chartdepth) from #org_chart )
and o1.supervisor <>o1.employee 

end 

select s.employee_name ,supervisor ='supervises',e.employee_name 
from #org_chart o inner join #staff s on(o.supervisor =s.employee )
inner join #staff e on(o.employee =e.employee )
where o.supervisor <>o.employee 
group by o.supervisor ,o.employee ,s.employee_name ,e.employee_name 
order by o.supervisor ,o.employee ,s.employee_name ,e.employee_name 