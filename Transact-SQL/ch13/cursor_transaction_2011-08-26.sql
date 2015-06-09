if exists( select * from tempdb.dbo.sysobjects where id=object_id(N'tempdb..#temp') and type='U') drop table #temp;

create table #temp (k1 int identity primary key,c1 int null)

insert #temp default values
insert #temp default values
insert #temp default values
insert #temp default values

set cursor_close_on_commit on
declare c cursor dynamic

for select k1,c1 from #temp




begin tran
open c
update #temp set c1=2 where k1>1


commit tran
--these fetches will fail because the cursor was closed by the commit
fetch c
fetch last from c

-- this close will fail because the cursor was closed by the commit
close c
deallocate c


go

drop table #temp 
set cursor_close_on_commit off



------------------
------------------
-- SET CURSOR_CLOSE_ON_COMMIT
-------------------------------------------------------------------------------
SET NOCOUNT ON

CREATE TABLE t1 (
   a INT
)
GO 

INSERT INTO t1 
VALUES (1)
INSERT INTO t1 
VALUES (2)
GO

PRINT '-- SET CURSOR_CLOSE_ON_COMMIT ON'
GO
SET CURSOR_CLOSE_ON_COMMIT ON
GO
PRINT '-- BEGIN TRAN'
BEGIN TRAN
PRINT '-- Declare and open cursor'
DECLARE testcursor CURSOR FOR
SELECT a 
FROM t1
OPEN testcursor
PRINT '-- Commit tran'
COMMIT TRAN
PRINT '-- Try to use cursor'
FETCH NEXT FROM testcursor
CLOSE testcursor
DEALLOCATE testcursor
GO
PRINT '-- SET CURSOR_CLOSE_ON_COMMIT OFF'
GO
SET CURSOR_CLOSE_ON_COMMIT OFF
GO
PRINT '-- BEGIN TRAN'
BEGIN TRAN
PRINT '-- Declare and open cursor'
DECLARE testcursor CURSOR FOR
SELECT a 
FROM t1
OPEN testcursor
PRINT '-- Commit tran'
COMMIT TRAN
PRINT '-- Try to use cursor'
FETCH NEXT FROM testcursor
CLOSE testcursor
DEALLOCATE testcursor
GO
DROP TABLE t1;
GO

