--turn on advanced options so that 'cursor threadhold' can be configured
EXEC sp_configure 'show advanced option', '1';
reconfigure with override

use testDB

declare c cursor static -- force rows to be copied to tempdb
for SELECT  [databaseID]
      ,[scName]
      ,[dcName]
      ,[scType]
      ,[dcType]
      ,[className]
      ,[functionName]
      ,[needUpdate]
      ,[stName]
      ,[scName2nd]
      ,[scType2nd]
  FROM [testDB].[dbo].[Map_main]
  
  declare @start datetime
  set @start =GETDATE()
  
  -- first try it with a synchronous cursor
  open c
  print char(10)
  select DATEDIFF(ms,@start,getdate()) as [milliseconds for synchronous cursor]
  
  select @@CURSOR_ROWS as [Number of rows in Synchronous cursor]
  
  close c
  --now reconfigure's cursor threebold' and force an asynch cursor
exec sp_configure 'cursor threshold',1000 --asynchronous for cursors >1000 rows
  reconfigure with override
  print char(13)
  set @start =GETDATE()
  
  -- first try it with a synchronous cursor
  open c
  print char(10)
  select DATEDIFF(ms,@start,getdate()) as [milliseconds for Asynchronous cursor]
  
  select @@CURSOR_ROWS as [Number of rows in Asynchronous cursor]
  
  
  close c
  deallocate c
go

exec sp_configure 'cursor threshold', -1 --back to synchronous
reconfigure with override
