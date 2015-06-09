--use this procedure to show how to use system 's procedure in your own procedure
use master 
if OBJECT_ID ('dbo.sp_created') is not null
 drop proc dbo.sp_created
 go
 
 create proc dbo.sp_created @objname sysname=null
  as
  if(@objname is null) or (@objname ='/?') goto Help
  select name,crdate from sysobjects
  where name like @objname 
  return 0
  
 Help:
 exec sp_usage @objectname='sp_created',
  @desc='List the creation date(s)',
  @parameters='@objname="Object names or mask you want to display"',
  @example='sp_created @objname="myprocs%"'
  return -1
  
  ---use the proc
 use pubs 
 exec sp_created  '%author%'