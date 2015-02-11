--- order by in view must have numbers return
create view myauthors as
select top 50 *
from authors
order by au_lname

select * from myauthors

select * from information_schema.tables

use master
exec sp_helptext syslogins