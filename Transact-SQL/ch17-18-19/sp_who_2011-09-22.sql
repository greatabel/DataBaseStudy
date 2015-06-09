use master 
go
exec sp_who ;
go
----
use master 
go
exec sp_who 'sa';
go                          
--------
use master 
go
exec sp_who 'active';
go
-------
use master 
go
exec sp_who '10' --specifies the process_id;
go                                                                                          