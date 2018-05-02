/*Obtendo filtro por data de recebimento*/
declare
  @dt datetime = /*macro:dataini*/+'',
  @func_id varchar(6) = 0/*macro:funcionarioLiteral*/,
  @dt_ini datetime,
  @dt_fim datetime,
  @turno_id int = 0/*macro:turno_id*/;

declare 
  @operacoes table (id uniqueidentifier)

if (@turno_id > 0)
begin
  select
    @dt_ini = dt_hr_abertura,
    @dt_fim = isnull(c.dt_hr_fechamento, getdate())
  from turno c  
  where c.turno_id = @turno_id

  insert into @operacoes
  select operacao_id
  from operacao_venda o
  where o.dt_hr_encerramento between @dt_ini and @dt_fim
    and o.func_encerrou_id = @func_id
  union all
  select operacao_id
  from operacao_venda_geral o
  where o.dt_hr_encerramento between @dt_ini and @dt_fim
    and o.func_encerrou_id = @func_id
end


select
  modo_venda = i.modo_venda_descr,
  producao = case
    when i.codigo_situacao = 'D' then 'Depois da produção'
    when i.codigo_situacao = 'E' then 'Estorno'
    else 'Antes da produção'
  end,
  cod_ticket = i.ticket_cod,
  i.numero_venda,
  i.ponto_venda_id,
  i.ponto_venda,
  i.modo_venda_descr,
  i.material_cod,
  i.material_descr,
  qtde = i.qtd,
  vl_total = i.vl_total,
  hora = cast(cast(isnull(i.dt_hr_cancelamento, 0) as time) as varchar(8)),
  funcionario_id = case
    when i.func_cancelou_id = 0 then func_id
    else func_cancelou_id
  end,
  funcionario = isnull(f.nome, c.nome),
  garcon_id = i.func_lancou_id,
  garcon = isnull(g.nome, '(não encontrado)'),
  func_autorizou_id = i.func_autorizou_id,
  func_autorizou = isnull(a.nome, '(não encontrado)'),
  motivo = isnull(i.motivo_canc, '(não informado)')
from vw_venda_unificada as h with (nolock)
left join vw_venda_item_unificada i with (nolock) on h.venda_id = i.venda_id
left join funcionario c with (nolock) on (c.id = i.func_id)
left join funcionario f with (nolock) on (f.id = i.func_cancelou_id)
left join funcionario g with (nolock) on (g.id = i.func_lancou_id)
left join funcionario a with (nolock) on (a.id = i.func_autorizou_id)
where (i.codigo_situacao in ('A', 'D', 'E'))
  and h.dt_contabil = @dt
  and i.transferido = 0
  and ((@turno_id = 0) or (h.operacao_id in (select id from @operacoes)))
  /*macro:filtro+*/
order by i.cancelado

/*mapeamentos
  ponto_venda=i.ponto_venda_id
  modo_venda=i.modo_venda_id
  funcionario que cancelou=i.func_cancelou_id
  nome do funcionario que lançou=f.nome
  funcionario=i.func_cancelou_id
  nome do garcon=g.nome
  funcionario que autorizou=i.func_autorizou_id
  nome do funcionario que autorizou=a.nome
  ponto de venda=i.ponto_venda_id
  nome do ponto de venda=i.ponto_venda
  nome do modo de venda=i.modo_venda_descr
  nome do grupo do material=i.grupo_descr
  codigo do material=i.material_cod
  nome do material=i.material_descr
*/

