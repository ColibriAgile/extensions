select
  entregador = isnull(f.nome, '(nenhum)'),
  qtd = count(ov.operacao_id),
  vl_entrega = sum(ov.vl_taxa_de_entrega),
  vl_venda = sum(o.vl_total)
from operacao_venda_geral as ov
left join operacao_geral as o on o.operacao_id = ov.operacao_id
join funcionario as f on f.id = ov.func_entregou_id
where ov.modo_venda_id = 2
  /*macro:filtro+*/
group by
  f.nome
order by
  f.nome

/*mapeamentos
  periodo=o.dt_contabil
  entregador=ov.func_entregou_id
  Nome=f.nome
*/


