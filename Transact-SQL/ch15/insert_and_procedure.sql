--����Ա����ʹ��ϵͳ�洢����������ز鿴��ǰ������������Ϣ�������﷨Ϊ��
--SP_LOCK
--����ʾ��ϢΪ��
--Spid������ID��
--Dbid�����ݿ�ID��
--Objid������ID��
--Indid������ID��
--Type����д�Ķ�������(DB:���ݿ⡢TAB:��PG:ҳ��EXT:�ء�RID:�б��)
--Resource������Դ
--Mode����ģʽ(S:��������U:�޸�����X:��������IS������ͼ����IX������ͼ��)
--Status����ǰ������״̬(GRANT���״̬��WAIT����������������CVNT��ǰ������ת��)
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