--- use int variant to get the procedure's return code
declare @res int
exec @res =sp_who 

select @res 

-------- show the parameters of procedure
exec sp_procedure_params_rowset 'sp_MSforeachtable'	