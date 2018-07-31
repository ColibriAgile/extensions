select
  data = vw.dt_contabil,
  codigo = vw.ticket_codigo,
  numero_venda = vw.numero_venda,
  func_nome = min(f.nome),
  qtd_fechamentos = vw.qtd_fechamentos,
  vl_total = cast(sum(vl_subtotal_itens) as money)
from vw_venda_unificada vw with (nolock)
left join funcionario f with (nolock) on f.id = vw.funcionario_terminou_id
where modo_venda_id = 3
  and qtd_fechamentos > 1
  and cancelado = 0
  and transferido = 0
  /*macro:filtro+*/
group by 
  vw.dt_contabil, 
  f.nome, 
  vw.ticket_codigo, 
  vw.numero_venda, 
  vw.qtd_fechamentos
order by 
  vw.dt_contabil, 
  f.nome, 
  vw.qtd_fechamentos desc, 
  vw.ticket_codigo desc, 
  vw.numero_venda asc

/*mapeamentos
funcionario=vw.funcionario_terminou_id
ponto_venda=vw.ponto_venda_id
periodo=vw.dt_contabil
*/
