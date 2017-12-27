if exists(select * from sys.schemas where name = 'doc') return

exec('create schema doc')
go

