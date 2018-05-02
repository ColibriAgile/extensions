select
  modo_venda = i.modo_venda_descr,
  producao = case when i.imprimiu = 1 then 'Depois da produção' else 'Antes da Produção' end,
  ticket_cod = i.ticket_cod,
  ticket_cod_origem = i.ticket_origem,
  i.venda_origem,
  i.numero_venda,
  i.ponto_venda_id,
  i.ponto_venda,
  i.modo_venda_descr,
  i.material_cod,
  i.material_descr,
  qtde = i.qtd,
  vl_total = i.vl_total,
  hora = cast(cast(i.dt_hr_cancelamento as time) as varchar(8)),
  funcionario_id = isnull(i.func_transferiu_id, g.id),
  funcionario = isnull(f.nome, g.nome),
  garcon_id = i.func_lancou_id,
  garcon = isnull(g.nome, '(não encontrado)'),
  func_autorizou_id = i.func_autorizou_id,
  func_autorizou = isnull(a.nome, '(não encontrado)'),
  motivo = isnull(i.motivo_canc, '(não informado)')
from vw_venda_item_unificada i with (nolock)
left join funcionario f with (nolock) on (f.id = i.func_transferiu_id)
left join funcionario g with (nolock) on (g.id = i.func_lancou_id)
left join funcionario a with (nolock) on (a.id = i.func_autorizou_id)
where (i.ticket_origem <> '')
/*macro:filtro+*/
order by i.imprimiu

/*mapeamentos
  funcionario que cancelou=i.func_cancelou_id
  nome do funcionario que lançou=f.nome
  garcon=i.func_lancou_id
  nome do garcon=g.nome
  funcionario que autorizou=i.func_autorizou_id
  nome do funcionario que autorizou=a.nome
  período=i.dt_contabil
  periodo=i.dt_contabil
  hora=cast(i.hr_cancelamento as time)
  ponto de venda=i.ponto_venda_id
  nome do ponto de venda=i.ponto_venda
  nome do modo de venda=i.modo_venda_descr
  nome do grupo do material=i.grupo_descr
  codigo do material=i.material_cod
  nome do material=i.material_descr
*/



