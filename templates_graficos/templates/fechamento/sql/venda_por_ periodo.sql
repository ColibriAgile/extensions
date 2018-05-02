select
  codigo = i.material_cod_num,
  descricao = min(i.material_descr),
  qtde = sum(i.qtd),
  total = sum(i.vl_total),
  faturamento_pct = cast(cast(sum(i.vl_total) as numeric(20,8)) * 100 / max(x.total) as numeric(20,8))
from vw_venda_item_unificada i with (nolock)
join
(
  select total = sum(i.vl_total)
  from vw_venda_item_unificada i with (nolock)
  where i.cancelado = 0
    and i.transferido = 0
    /*macro:filtro+*/
) x on 1=1
where i.cancelado = 0
  and i.transferido = 0
  /*macro:filtro+*/
group by i.material_cod_num
/*macro:ordenacao*/



/*mapeamentos
periodo=i.dt_contabil
funcionario=i.func_lancou_id
hora=cast(i.hr_lancamento as time)
modo_venda=i.modo_venda_id
ponto_venda=i.ponto_venda_id
Descrição=min(i.material_descr)
Total=sum(i.vl_total)
Código=i.material_cod_num
Quantidade=sum(i.qtd)
*/

