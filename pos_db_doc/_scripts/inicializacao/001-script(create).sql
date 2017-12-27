if object_id('doc.script') is not null return

create table [doc].[script](
  [versao] [varchar](10) not null,
  [script] [varchar](100) not null,
  [dt_exec] [datetime] not null default getdate(),
  constraint [script_pk] primary key clustered 
  (
    [versao] asc,
    [script] asc
  ) on [PRIMARY] 
)
go
