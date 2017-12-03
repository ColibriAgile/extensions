if exists(select * from sys.schemas where name = 'fiscal') return

exec('create schema fiscal')
go

