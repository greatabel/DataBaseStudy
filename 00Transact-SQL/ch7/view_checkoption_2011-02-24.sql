create view CA_Authors as
select *
  FROM [pubs].[dbo].[authors] where state='CA'
with check option

---because of check option ,following script will fail
insert CA_Authors values('972-32-1176','hite','Johnson','408 496-7223','10932 Bigge Rd.','Menlo Park','TA','94025',1)