exec sp_MSforeachtable  @command1='sp_help "?"',@replacechar='?'
exec sp_MSforeachtable  @command1='sp_help "?"',@replacechar=Default
exec sp_who @loginame=null