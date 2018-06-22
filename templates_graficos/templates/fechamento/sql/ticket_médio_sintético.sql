/*Obtendo filtro por data de recebimento*/
declare
  @dt datetime = /*macro:dataini*/+'',
  @turno_id int = 0/*macro:turno_id*/,
  @dt_ini datetime,
  @dt_fim datetime,
  @func_id varchar(6) = /*macro:funcionarioLiteral*/+'';

if (@turno_id > 0)
  select
    @dt_ini = dt_hr_abertura,
    @dt_fim = isnull(c.dt_hr_fechamento, getdate())
  from turno c
  where c.turno_id = @turno_id

select
  *,
  tipo = case
    when modo_venda_id in (3, 4) then 'pessoas'
    else 'atendimentos'
  end,
  ticket_medio = round(rel.total / rel.qtd_pessoas, 2,1)
from
(
  select
    modo_venda_id,
    modo_venda = upper(min(m.nome)),
    funcionario,
    qtd_pessoas = sum(qtd_pessoas),
    total = sum(total)
  from
  (
    select
      o.operacao_id,
      ov.modo_venda_id,
      funcionario = f.nome,
      total = sum(m.vl_recebido),
      qtd_pessoas = ov.qtd_pessoas
    from operacao_geral o with (nolock)
    join movimento_caixa_geral m with (nolock) on m.operacao_id = o.operacao_id
    join operacao_venda_geral ov with (nolock) on o.operacao_id = ov.operacao_id
    join dbo.funcionario f with (nolock) on f.id = o.func_logado_id
    where m.cancelado = 0
      and o.tipo = 'venda'
      and ov.encerrada = 1
      and o.cancelada = 0
      and o.dt_contabil = @dt
      and ((@turno_id = 0) or (m.turno_id = @turno_id))
      /*macro:funcionario+*/
    group by
      o.operacao_id,
      ov.modo_venda_id,
      f.nome,
      ov.qtd_pessoas

    union all

    select
      o.operacao_id,
      ov.modo_venda_id,
      f.nome,
      total = sum(m.vl_recebido),
      qtd_pessoas = ov.qtd_pessoas
    from operacao o with (nolock)
    join movimento_caixa m with (nolock) on m.operacao_id = o.operacao_id
    join operacao_venda ov with (nolock) on o.operacao_id = ov.operacao_id
    join dbo.funcionario f with (nolock) on f.id = o.func_logado_id
    where m.cancelado = 0
      and o.tipo = 'venda'
      and ov.encerrada = 1
      and o.cancelada = 0
      and o.dt_contabil = @dt
      and ((@turno_id = 0) or (m.turno_id = @turno_id))
      /*macro:funcionario+*/
    group by
      o.operacao_id,
      ov.modo_venda_id,
      f.nome,
      ov.qtd_pessoas
  )dados
  join modo_venda m with (nolock) on dados.modo_venda_id = m.id
  group by
    dados.modo_venda_id,
    dados.funcionario
)rel
order by rel.modo_venda

/*mapeamentos
  funcionario=m.func_recebeu_id
*/
