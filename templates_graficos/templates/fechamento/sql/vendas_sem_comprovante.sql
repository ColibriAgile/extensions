select
  ticket = h.ticket,
  numero_venda = cast(h.numero_venda as int),
  dt_hr_encerramento = ov.dt_hr_encerramento,
  vl_total = o.vl_total
from dbo.venda h
join dbo.operacao o on o.operacao_id = h.operacao_id
join dbo.operacao_venda ov on o.operacao_id = ov.operacao_id
left join dbo.comprovante c on o.operacao_id = c.operacao_id
where (c.status is null or c.status = 'Nao Emitido')
  and ov.encerrada = 1
  and o.cancelada = 0
  and o.vl_total > 0
  /*macro:filtro+*/
order by h.ticket, h.numero_venda, ov.dt_hr_encerramento

/*mapeamentos
  funcionario=ov.func_encerrou_id
*/
