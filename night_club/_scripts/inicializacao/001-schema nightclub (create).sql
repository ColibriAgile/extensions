if exists(select * from sys.schemas where name = 'nightclub') return
exec('create schema nightclub')
go
