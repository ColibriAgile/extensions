select
  funcao = fn.nome,
  garcon_descr = f.nome,
  material_descr = it.material_descr,
  qtd = sum(it.qtd),
  vl_total = cast(sum(it.qtd * it.vl_unit) as money)
from vw_venda_item_unificada it with (nolock)
left join funcionario f with (nolock) on it.func_lancou_id = f.id
left join funcao fn with (nolock) on f.funcao_id = fn.id
where it.cancelado = 0
  and it.transferido = 0
/*macro:filtro+*/
group by  fn.nome, f.nome, it.material_descr
order by  fn.nome, f.nome, it.material_descr

/*mapeamentos
  periodo=it.dt_contabil
  funcionario=it.func_lancou_id
  grupodematerial=it.grupo_id
  ponto_venda=it.ponto_venda_id
  modo_venda=it.modo_venda_id
*/


