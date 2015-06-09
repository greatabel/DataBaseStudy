--管理员可以使用系统存储过程来方便地查看当前对象上锁的信息，它的语法为：
--SP_LOCK
--其显示信息为：
--Spid：进程ID号
--Dbid：数据库ID号
--Objid：对象ID号
--Indid：索引ID号
--Type：缩写的对象类型(DB:数据库、TAB:表、PG:页、EXT:簇、RID:行标等)
--Resource：锁资源
--Mode：锁模式(S:共享锁、U:修改锁、X:排它锁、IS共享意图锁、IX排它意图锁)
--Status：当前该锁的状态(GRANT获得状态、WAIT被其它进程阻塞、CVNT当前锁正在转化)
drop table #locks
create table #locks(spid int ,dbid int ,objid int, objectname sysname null,
 indid int ,type char(4),resource char(15),mode char(10),status char(6))
 
 insert #locks (spid,dbid ,objid ,indid ,type ,resource ,mode ,status )
 exec sp_lock
 
 select * from #locks 
 
 ------------
 EXECUTE sp_configure 'show advanced options', 1
RECONFIGURE WITH OVERRIDE
GO
EXECUTE sp_configure 'xp_cmdshell', '1'
RECONFIGURE WITH OVERRIDE
GO
EXECUTE sp_configure 'show advanced options', 0
RECONFIGURE WITH OVERRIDE
GO
--turn on xp_cmdshell
drop table #cmd_result
 create table #cmd_result(output varchar(8000))
 insert #cmd_result 
 exec master..xp_cmdshell 'copy errorlog.1 *.sav'
 
 select * from #cmd_result 