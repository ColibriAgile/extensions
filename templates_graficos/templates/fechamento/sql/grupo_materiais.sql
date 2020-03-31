if object_id('tempdb..#tmp_itens') is not null
  drop table #tmp_itens

select
  i.grupo_id,
  grupo_descr = min(i.grupo_descr),
  qtde = sum(i.qtd),
  vl_total = sum(i.vl_total)
into #tmp_itens
from vw_venda_item_unificada i with (nolock)
where i.cancelado = 0
  and i.transferido = 0
  and isnull(i.ticket_estado, '') <> 'consumindo'
  /*macro:filtro+*/
group by
  i.grupo_id
order by
  i.grupo_id

declare @total numeric(18,2)
select @total = sum(vl_total)
from #tmp_itens with (nolock)

select
  i.*,
  percentual = cast((i.vl_total * 100/@total) as numeric(12,8))
from #tmp_itens i
order by grupo_descr


/*mapeamentos
  modo_venda=i.modo_venda_id
  periodo=i.dt_contabil
  hora=cast(i.dt_lancamento as time)
  ponto_venda=i.ponto_venda_id
  grupodematerial=i.grupo_id

  Grupo=grupo_descr
  Quantidade=qtde
  Valor=vl_total
*/



