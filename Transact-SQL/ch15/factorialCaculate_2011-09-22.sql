set nocount on
use master 
if OBJECT_ID('dbo.sp_calcfactorial') is not null
 drop proc dbo.sp_calcfactorial
 
 declare @typestr varchar(20)
 set @typestr ='decimal('+CAST(@@max_precision as varchar(2))+',0)'
 if TYPEPROPERTY ('bigd','precision') is not null
 exec sp_droptype 'bigd'
 
 exec sp_addtype 'bigd' ,@typestr -- add a custom type 
 
 go
 create proc dbo.sp_calcfactorial @base_number bigd,@factorial bigd out
 as
 set nocount on
 declare @previous_number bigd
 
 if( (@base_number >26) and (@@MAX_PRECISION <38)) or(@base_number >32) begin
  raiserror('computing the factorial would exceed the server''s max. numeric precision of %d or
   the max.procedure metting',16,10,@@max_precision)
   return(-1)
  end
  
  if(@base_number <0)begin
  raiserror('can''t calculate negative factorial',16,10)
  return(-1)
  end
  
  if(@base_number <2) set @factorial =1 --factorial of 0 or 1=1
  else begin
   set @previous_number =@base_number -1
   exec sp_calcfactorial @previous_number,@factorial out -- recursive call
   if(@factorial =-1) return (-1) --got an error,return
   set @factorial =@factorial *@base_number 
   if(@@ERROR <>0) return(-1) --got an error
   end
   return(0)
   go
   
   ----------
   declare @factorial bigd
   exec sp_calcfactorial 26,@factorial out
   select @factorial 
 
 