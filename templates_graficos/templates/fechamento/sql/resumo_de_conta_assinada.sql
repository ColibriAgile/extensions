select
  turno = m.turno_id,
  operador = f.nome,
  hora = p.dt_hr_pendura,
  cliente = c.nome,
  valor = abs(p.vl_total),
  dt_contabil = p.dt_contabil
from dbo.pendura p
join (
  select
    m.func_recebeu_id,
    m.movimento_caixa_id,
    m.turno_id
  from movimento_caixa m with (nolock)
  where m.meio_pagamento_id = 4
    and m.cancelado = 0
    /*macro:filtro+*/
  union
  select
    m.func_recebeu_id,
    m.movimento_caixa_id,
    m.turno_id
  from movimento_caixa_geral m with (nolock)
  where m.meio_pagamento_id = 4
    and m.cancelado = 0
    /*macro:filtro+*/
) m on m.movimento_caixa_id = p.movimento_id
join dbo.funcionario f with (nolock) on f.id = m.func_recebeu_id
join dbo.cliente c with (nolock) on c.id = p.cliente_id
where p.cancelado = 0
/*macro:filtro+*/
order by p.dt_hr_pendura

/*mapeamentos
  periodo=t.dt_contabil
*/

