declare
  @dt datetime = /*macro:dataini*/+'',
  @dia_aberto datetime,
  @func_id varchar(6) = 0/*macro:funcionarioLiteral*/,
  @turno_id int = 0/*macro:turno_id*/,
  @apenasUltimoFechamento bit = 1;

declare @tbl table
(
  operacao_id uniqueidentifier
)

if @func_id = -1
  set @apenasUltimoFechamento = 0

declare @turnos table (turno_id int)

insert into @turnos
select
  turno_id
from dbo.fn_turnos(@func_id, @dt, @dt, @apenasUltimoFechamento, @turno_id);

select @dia_aberto = h.dt_hr_fechamento
from periodo as h
where dt_contabil = @dt

if @dia_aberto is null
  insert into @tbl
  select operacao_id
  from movimento_caixa as m
  join @turnos t on t.turno_id = m.turno_id
  /*macro:filtro*/
  group by m.operacao_id
else
  insert into @tbl
  select operacao_id
  from movimento_caixa_geral as m
  join @turnos t on t.turno_id = m.turno_id
  /*macro:filtro*/
  group by m.operacao_id

if @dia_aberto is null
  select
    modo_venda = upper(min(mv.nome)),
    codigo = min(f.codigo),
    funcionario = min(f.nome),
    valor_venda = convert(money, sum(isnull(i.vl_total, 0))),
    servico_calculado = convert(money, sum(isnull(i.vl_servico_calculado, 0))),
    servico_recebido = convert(money, sum(isnull(i.vl_servico_informado, 0)))
  from @tbl t
  join venda h with (nolock) on h.operacao_id = t.operacao_id
  join venda_item i with (nolock) on i.venda_id = h.venda_id
  join funcionario f with (nolock) on i.func_lancou_id = f.id
  join funcao fn with (nolock) on f.funcao_id = fn.id
  join modo_venda as mv with (nolock) on mv.id = h.modo_venda_id
  where i.valido = 1
  group by
    mv.id,
    i.func_lancou_id
  order by 1, 3

else
  select
    modo_venda = upper(min(mv.nome)),
    codigo = min(f.codigo),
    funcionario = min(f.nome),
    valor_venda = convert(money, sum(isnull(i.vl_total, 0))),
    servico_calculado = convert(money, sum(isnull(i.vl_servico_calculado, 0))),
    servico_recebido = convert(money, sum(isnull(i.vl_servico_informado, 0)))
  from @tbl t
  join venda_geral h with (nolock) on h.operacao_id = t.operacao_id
  join venda_item_geral i with (nolock) on i.venda_id = h.venda_id
  join funcionario f with (nolock) on i.func_lancou_id = f.id
  join funcao fn with (nolock) on f.funcao_id = fn.id
  join modo_venda as mv with (nolock) on mv.id = h.modo_venda_id
  where i.valido = 1
  group by
    mv.id,
    i.func_lancou_id
  order by 1, 3

/*mapeamentos
funcionario=m.func_recebeu_id
*/
