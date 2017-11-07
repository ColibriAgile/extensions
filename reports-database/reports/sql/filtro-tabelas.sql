select 
  [ID] = t.object_id,
  [Tabelas] = s.name + '.' + t.name
from sys.tables t
left join sys.schemas s on s.schema_id = t.schema_id
order by 
  s.name, 
  t.name


