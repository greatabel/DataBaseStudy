-- part1 problem 1
drop table if exists P;
create table P (coefficient  integer,
                     degree integer);

insert into P values
  (2, 2),
  (-5, 1),
  (5, 0);
  
select * from P;


drop table if exists Q;
create table Q (coefficient  integer,
                     degree integer);

insert into Q values
  (4, 4),
  (3, 3),
  (1, 2),
  (-1, 1),
  (0, 0);
  
select * from Q;

select  sum(mcofficient) as p_times_q_coefficient ,mdegree as p_times_q_degree from 
(select p.coefficient *  q.coefficient as mcofficient, p.degree + q.degree as mdegree from P, Q) as R
group by mdegree order by mdegree desc ;


-- part1 problem 2
drop table if exists X;
create table X (index  integer,
                value integer);

insert into X values
  (1, 7),
  (2, -1),
  (3, 2);
  
select * from X;

drop table if exists Y;
create table Y (index  integer,
                value integer);

insert into Y values
  (1, 1),
  (2, 1),
  (3, -10);
  
select * from Y;

select sum(X.value * Y.value) as dotproductxandy   from X
JOIN Y ON x.index=y.index;


-- part 2  problem 3
/*
select p.pid, p.name
from Person p
where p.city = 'Bloomington' and
            exists(select 1
                   from   personSkill ps
                   where  ps.pid = p.pid and ps.skill  <> 'Programming' and
                          ps.skill in (select ps1.skill
                                       from   worksFor w1, personSkill ps1
                                       where  w1.cname = 'Netflix' and
                                              ps1.skill <> 'AI' and
                                              w1.pid = p.pid));
*/
-- above sql ,replace to :
select p.pid, p.name
from Person p
where p.city = 'Bloomington' and
            (select count(*)
                   from   personSkill ps
                   where  ps.pid = p.pid and ps.skill  <> 'Programming' and
                          ps.skill in (select ps1.skill
                                       from   worksFor w1, personSkill ps1
                                       where  w1.cname = 'Netflix' and
                                              ps1.skill <> 'AI' and
                                              w1.pid = p.pid)) > 0 ;
-- part 2  problem 4
/*
select w.pid, w.cname, w.salary
from worksFor w
where not(w.salary <= all (select w1.salary
	from   worksFor w1, Company c
	where  w.pid <> w1.pid and w.cname = w1.cname and
	       c.city not in (select p.city
	                      from   Person p
	where  p.birthyear <> 1990)));   
*/
                                             
-- above sql ,replace to :
select w.pid, w.cname, w.salary
from worksFor w
where not(w.salary <=  (select min(w1.salary)
	from   worksFor w1, Company c left join Person p 
		on c.city = p.city
	where  w.pid <> w1.pid and w.cname = w1.cname and
	       c.city IS not NULL and  p.birthyear = 1990 ));  

	      
-- part 3  problem 5
drop VIEW if exists people_with_3jobs_view;
drop VIEW if exists p_skill_view;
drop VIEW if exists p_skill_without3_view;

create view p_skill_view as
	select p.pid , count(*) as num from personskill p 	
	group by p.pid
	having count(*) >= 3;

create view p_skill_without3_view as
	select p.pid , count(*) as num from personskill p 	
	group by p.pid
	having count(*) = 2
    order by p.pid;


create view people_with_3jobs_view AS
select knows.pid1 , knows .pid2
from  knows  inner join p_skill_view
on knows.pid2 = p_skill_view.pid;

select distinct p.pid, p.name from Person p 
where p.city = 'Bloomington' and p.pid not in 
(select pid1 from people_with_3jobs_view 
group by pid1
having count(*) > 1
);
 
-- part 3  problem 6
select distinct p.pid, p.name from Person p 
where  p.pid  in 
(select pid from p_skill_without3_view 
) order by p.pid;

-- part 3  problem 7
drop VIEW if exists know_company_view;

create view know_company_view as
	select knows.pid1, knows.pid2 , worksfor.cname as pid2_cname from knows inner join worksfor
	on knows.pid2 = worksfor.pid ;


(select w.cname   ,count(*) as num from worksfor w  join know_company_view k2 
on w.pid = k2.pid1 
where w.cname = pid2_cname
group by w.pid
having count(*) >=2
 
)
union
(select distinct w.cname ,0 as num from worksfor w left join know_company_view k2 
on w.pid = k2.pid1 
where w.cname <> pid2_cname
group by w.pid

) order by cname ;


-- part 3  problem 8
drop VIEW if exists salary_above_55000;

create view salary_above_55000 as
	select knows.pid1, knows.pid2 , worksfor.salary  from knows inner join worksfor
	on knows.pid2 = worksfor.pid 	
	where worksfor.salary > 55000;

select pid ,name from person p left join salary_above_55000
on p.pid = salary_above_55000.pid1 
where pid2 is null order by pid ;


-- part 3  problem 9
drop VIEW if exists p9_view;

create view p9_view as
	select knows.pid1 as pid  ,knows.pid2 , worksfor.salary, p2.birthyear  from (knows inner join worksfor
	on knows.pid2 = worksfor.pid ) 	inner join person p2 on worksfor.pid = p2.pid
	where worksfor.cname = 'Netflix' and worksfor.salary >= 55000 
		and p2.birthyear > 1985;

select p.pid , p.name from person p inner join p9_view
on p.pid = p9_view.pid order by p.pid;


-- part 3  problem 10
drop VIEW if exists p10_view;

create view p10_view as
	(select distinct cname from worksfor	
	where worksfor.salary < 55000)
EXCEPT
	(select distinct cname from worksfor	
	where worksfor.salary >= 55000);

select * from p10_view;

-- part 3  problem 11


