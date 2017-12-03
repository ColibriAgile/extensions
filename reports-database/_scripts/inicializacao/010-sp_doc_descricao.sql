if (object_id('doc.sp_doc_tabela') is not null)
  drop procedure doc.sp_doc_tabela
go

create procedure doc.sp_doc_tabela(@tabela nvarchar(100), @descricao nvarchar(1000), @schema nvarchar(100) = 'dbo')
as
begin
  declare
    @descr sql_variant   = @descricao,
    @prop nvarchar(20)   = N'MS_Description',
    @type0 nvarchar(20)  = N'schema',
    @name0 nvarchar(20)  = @schema,
    @type1 nvarchar(20)  = N'table',
    @name1 nvarchar(100) = @tabela

  select @type1 = case o.type
    when 'V' then N'view'
    else N'table'
  end
  from sys.objects o
  where (o.name = @tabela)

  if (@@rowcount=0) begin
    print 'Tabela '+@schema+'.'+@tabela+' não existe.'
    return
  end

  if not exists (select * from ::fn_listextendedproperty(@prop, @type0, @name0, @type1, @name1, null, null))
    execute sp_addextendedproperty @prop, @descr, @type0, @name0, @type1, @name1, null, null
  else
    execute sp_updateextendedproperty @prop, @descr, @type0, @name0, @type1, @name1, null, null
end
go
------------------------------------------------------------------------------
if (object_id('doc.sp_doc_campo') is not null)
  drop procedure doc.sp_doc_campo
go

create procedure doc.sp_doc_campo(@tabela nvarchar(100), @campo nvarchar(100), @descricao nvarchar(1000), @schema nvarchar(100) = 'dbo')
as
begin
  declare
    @descr sql_variant   = @descricao,
    @prop nvarchar(20)   = N'MS_Description',
    @type0 nvarchar(20)  = N'schema',
    @name0 nvarchar(20)  = @schema,
    @type1 nvarchar(20)  = N'table',
    @name1 nvarchar(100) = @tabela,
    @type2 nvarchar(20)  = 'column',
    @name2 nvarchar(100) = @campo

  select @type1 = case o.type
    when 'V' then N'view'
    else N'table'
  end
  from sys.objects o
  where (o.name = @tabela)

  if (@@rowcount=0) begin
    print 'Tabela [' + @schema + '.' + @tabela + '] não existe (campo ['+ @campo + '])' 
    return
  end

  if not exists 
  (
    select * 
    from sys.columns o
    where object_id = object_id(@schema+'.'+@tabela)
      and name = @campo
  ) 
  begin
    print 'Campo [' + @schema + '.' + @tabela + '.' + @campo + '] não existe.' 
    return
  end
    
  if not exists (select * from ::fn_listextendedproperty(@prop, @type0, @name0, @type1, @name1, @type2, @name2))
    execute sp_addextendedproperty @prop, @descr, @type0, @name0, @type1, @name1, @type2, @name2
  else
    execute sp_updateextendedproperty @prop, @descr, @type0, @name0, @type1, @name1, @type2, @name2
end
go
------------------------------------------------------------------------------
if (object_id('doc.sp_doc_schema') is not null)
  drop procedure doc.sp_doc_schema
go

create procedure doc.sp_doc_schema (@schema nvarchar(100), @descricao nvarchar(1000))
as
begin
  declare 
    @descr sql_variant   = @descricao,
    @prop nvarchar(20)   = N'MS_Description',
    @type0 nvarchar(20)  = N'schema',
    @name0 nvarchar(20)  = @schema 
 
  if not exists(select * from sys.schemas where name = @schema) 
    return
  if not exists (select * from ::fn_listextendedproperty(@prop, @type0, @name0, null, null, null, null))
    execute sp_addextendedproperty @prop, @descr, @type0, @name0, null, null, null, null
  else 
    execute sp_updateextendedproperty @prop, @descr, @type0, @name0, null, null, null, null
end
go
