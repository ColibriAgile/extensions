select * from (
  select
    turno = m.turno_id,
    oper = f.nome,
    hora = max(substring(convert(varchar, m.dt_hr_pagamento, 108),1,5)),
    dt_hr = max(m.dt_hr_pagamento),
    motivo = isnull(max(descricao), '-'),
    valor = abs(sum(m.vl_recebido))
  from operacao o
  join movimento_caixa m on o.operacao_id = m.operacao_id
  join funcionario f on f.id = m.func_recebeu_id
  where tipo = 'sangria'
    and o.dt_contabil = /*macro:dataini*/
  group by m.turno_id, o.operacao_id, f.nome

  union

  select
    turno = m.turno_id,
    oper = f.nome,
    hora = max(substring(convert(varchar, m.dt_hr_pagamento, 108),1,5)),
    dt_hr = max(m.dt_hr_pagamento),
    motivo = isnull(max(descricao), '-'),
    valor = abs(sum(m.vl_recebido))
  from operacao_geral o
  join movimento_caixa_geral m on o.operacao_id = m.operacao_id
  join funcionario f on f.id = m.func_recebeu_id
  where tipo = 'sangria'
    and o.dt_contabil = /*macro:dataini*/
  group by m.turno_id, o.operacao_id, f.nome
) x
order by turno, hora

