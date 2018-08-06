declare @dt datetime = /*macro:dataini*/;

select
  turno = isnull(t.turno_id, 0),
  oper = f.nome,
  venda = v.ticket,
  hora = o.dt_hr_encerramento,
  desconto = o.vl_desconto,
  desconto_nome = o.desconto,
  pct_desconto = o.pct_desconto,
  vl_recebido = o.vl_total,
  o.operacao_id
from dbo.fn_operacoes_venda(@dt, @dt, 0) o
join dbo.funcionario f with (nolock) on f.id = o.func_encerrou_id
cross apply dbo.fn_venda(o.operacao_id, default, 1) v
left join dbo.turno t on o.dt_hr_encerramento between t.dt_hr_abertura and isnull(t.dt_hr_fechamento, getdate()) and t.func_id = o.func_encerrou_id
where o.func_encerrou_id > 0
  and o.vl_desconto > 0
  and o.modo_venda_id in (3, 4)
order by o.dt_hr_encerramento





