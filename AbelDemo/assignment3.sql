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
drop VIEW if exists p_skill_view;
create view p_skill_view as
	select p.pid , count(*)  from personskill p 
	having count(*) >= 3
	group by p.pid;
	      
drop VIEW if exists people_with_3jobs_view;

CREATE VIEW people_with_3jobs_view AS
SELECT knows.pid1 
FROM  knows left join p_skill_view
on knows.pid2 = p_skill_view.pid;

select p.pid, p.name from Person p left join people_with_3jobs_view
	on p.pid = people_with_3jobs_view.pid1 
where city = 'Bloomington' 
     
