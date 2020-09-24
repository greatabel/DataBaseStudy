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