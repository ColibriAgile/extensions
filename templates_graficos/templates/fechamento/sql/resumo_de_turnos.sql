declare 
  @dt datetime = /*macro:dataini*/+''


declare @turnos table 
(
  turno_id int,
  oper varchar(50),
  dt_hr_abertura datetime,
  dt_hr_fechamento datetime
)

insert @turnos
select 
  turno_id,
  oper = dbo.fn_capitalize(isnull(f.nome, '(desconhecido)'), 1),
  dt_hr_abertura,
  dt_hr_fechamento
from dbo.turno t
left join dbo.funcionario f on f.id = t.func_id
where t.func_id > 0
/*macro:filtro+*/

  select 
    turno = t.turno_id,
    oper = min(t.oper),
    dt_hr_ini = min(t.dt_hr_abertura),
    dt_hr_fim = min(t.dt_hr_fechamento),
    total= sum(isnull(f.valor_venda,0))
  from @turnos t
  join dbo.fn_fechamento_caixa(@dt, @dt, -1, 1, -1, '') f on t.turno_id = f.turno
  group by turno_id


/*mapeamentos
  periodo=t.dt_contabil
*/


