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
