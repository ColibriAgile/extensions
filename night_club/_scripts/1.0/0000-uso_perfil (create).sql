if object_id('nightclub.uso_perfil') is not null return

create table nightclub.uso_perfil
(
  perfil_id int,
  usos int
) on [primary]
go
