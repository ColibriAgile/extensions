select 
  meio = case meio_pagamento_id 
    when -2 then 'Crédito de cliente'
    when -3 then 'Repique'
    else 'Outros trocos'
  end,
  valor = abs(sum(vl_recebido))
from 
  (select meio_pagamento_id, vl_recebido 
     from movimento_caixa mc
     join operacao o on o.operacao_id = mc.operacao_id
     where func_recebeu_id < 0
     /*macro:filtro+*/       
  union 
    select meio_pagamento_id, vl_recebido 
     from movimento_caixa_geral mcg
     join operacao_geral og on og.operacao_id = mcg.operacao_id
     where func_recebeu_id < 0
     /*macro:filtro+*/       
  ) x
group by meio_pagamento_id

/*mapeamentos
  periodo=dt_contabil
*/