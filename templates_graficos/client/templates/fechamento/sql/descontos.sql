declare
  @total as money

select @total = sum(m.vl_desconto)
from vw_movimento_caixa m with (nolock)
left join desconto d with (nolock) on d.id = m.desconto_id
where m.vl_desconto > 0
  and cancelada = 0
/*macro:filtro+*/

select
  modo_venda = UPPER(modo_venda),
  func_recebeu = func_recebeu_nome,
  func_autorizou = func_recebeu_nome,
  descr = desconto,
  vl = sum(vl_desconto),
  pct = cast((sum(vl_desconto) / @total) * 100 as numeric(10,2)),
  total = @total
from vw_movimento_caixa with (nolock)
where vl_desconto > 0
  and cancelada = 0
/*macro:filtro+*/
group by 
  dt_hr_pagamento,
  func_recebeu_nome, 
  modo_venda, 
  desconto
order by 
  dt_hr_pagamento, 
  func_recebeu_nome, 
  modo_venda, 
  desconto

/*mapeamentos
  modo_venda=modo_venda_id
  periodo=dt_contabil
  hora=cast(dt_hr_pagamento as time)
  ponto_venda=ponto_venda_id
  ponto de venda=ponto_venda_nome
  modo de venda=modo_venda
  funcionario=func_recebeu_id
*/
