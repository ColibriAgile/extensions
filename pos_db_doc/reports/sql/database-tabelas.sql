select 
  [schema] = s.name,
  table_id = t.object_id,
  table_name = t.name,
  table_name_complete = s.name + '.' + t.name,
  table_descr = tp.value,
  column_name = c.name,
  column_ord = c.colorder,
  column_type = b.name + case 
    when b.name like '%char' then ' (' + case c.length when -1 then 'max' else cast(c.length as varchar) end + ')'
    when b.name in ('decimal','numeric') then ' (' + cast(c.prec as varchar) + ',' + cast(c.xscale as varchar) + ')'
    else ''
  end,
  column_notnull = ~convert(bit, c.isnullable),
  column_descr = cp.value
from sys.tables t
left join sys.schemas s on s.schema_id = t.schema_id
left join syscolumns c on c.id = t.object_id 
left join systypes b on b.xusertype = c.xtype
left join sys.extended_properties tp on
  tp.major_id = c.id and
  tp.minor_id = 0
left join sys.extended_properties cp on
  cp.major_id = c.id and
  cp.minor_id = c.colid
/*macro.filtro*/  
order by 
  s.name 
  , t.name
  /*macro.ordenacao+*/

/*
[filtro.tabelas]
tipo=db-tabelas
campo=t.object_id

[ordenacao]
titulo=Ordem
Ordem da coluna=c.colorder->asc
Nome da coluna=c.name
*/
  

