if exists( select * from tempdb.dbo.sysobjects where id=object_id(N'tempdb..#staff') and type='U') drop table #staff
if exists( select * from tempdb.dbo.sysobjects where id=object_id(N'tempdb..#org_chart') and type='U') drop table #org_chart
create table #staff(employee int primary key,
employee_name varchar(15),
supervisor int null references #staff(employee)
)

insert #staff values(1,'abel1',1)
insert #staff values(2,'abel0',1)

insert #staff values(3,'heroA00',2)
insert #staff values(4,'heroB00',2)
insert #staff values(5,'conquer0',1)
insert #staff values(6,'conquer000',3)

select t.employee_name ,supervisor ='Supervises',s.employee_name 
from #staff s inner join #staff t on( s.supervisor =t.employee )
where s.supervisor <>s.employee 
order by s.employee ,s.supervisor 

-------multi-layer---
select chartdepth=1, employee=o2.employee ,supervisor =o1.employee 
into #org_chart
from #staff o1 inner join #staff o2 on(o1.employee =o2.supervisor )


insert into #org_chart
select distinct o1.chartdepth +1,o2.employee ,o1.supervisor 
from #org_chart o1 inner join #org_chart o2 on(o1.employee =o2.supervisor )
where o1.chartdepth =(select MAX(chartdepth) from #org_chart )and o1.supervisor <>o1.employee 

insert into #org_chart
select distinct o1.chartdepth +1,o2.employee ,o1.supervisor 
from #org_chart o1 inner join #org_chart o2 on(o1.employee =o2.supervisor )
where o1.chartdepth =(select MAX(chartdepth) from #org_chart )and o1.supervisor <>o1.employee 

insert into #org_chart
select distinct o1.chartdepth +1,o2.employee ,o1.supervisor 
from #org_chart o1 inner join #org_chart o2 on(o1.employee =o2.supervisor )
where o1.chartdepth =(select MAX(chartdepth) from #org_chart )and o1.supervisor <>o1.employee 

select s.employee_name ,supervisor ='supervises',e.employee_name 
from #org_chart o inner join #staff s on(o.supervisor =s.employee )
inner join #staff e on(o.employee =e.employee )
where o.supervisor <>o.employee 
group by o.supervisor ,o.employee ,s.employee_name ,e.employee_name 
order by o.supervisor ,o.employee ,s.employee_name ,e.employee_name 