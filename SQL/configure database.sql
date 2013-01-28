USE Words
EXEC sp_configure 'clr enabled', 1
go
reconfigure 
go

alter database Words set trustworthy on
go