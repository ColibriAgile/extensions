

declare 
  @dt_contabil datetime = (select valor from cache.data_contabil),
  @dt datetime = ''/*macro:data*/


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
where t.dt_contabil = '2018-06-16'
/*macro:filtro*/

/* do dia */
if @dt = @dt_contabil 
  select 
    turno = t.turno_id,
    oper = min(t.oper),
    dt_hr_ini = min(t.dt_hr_abertura),
    dt_hr_fim = min(t.dt_hr_fechamento),
    total= sum(isnull(mc.vl_recebido,0))
  from @turnos t
  left join dbo.movimento_caixa mc on mc.turno_id = t.turno_id
  where mc.cancelado = 0
  group by t.turno_id

/* geral*/
else 
  select 
    turno = t.turno_id,
    oper = min(t.oper),
    dt_hr_ini = min(t.dt_hr_abertura),
    dt_hr_fim = min(t.dt_hr_fechamento),
    total= sum(isnull(mc.vl_recebido,0))
  from @turnos t
  left join dbo.movimento_caixa_geral mc on mc.turno_id = t.turno_id
  where mc.cancelado = 0
  group by t.turno_id


/*mapeamentos
  periodo=t.dt_contabil
*/


