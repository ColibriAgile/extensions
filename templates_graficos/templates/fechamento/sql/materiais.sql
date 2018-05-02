/*Obtendo filtro por data de recebimento*/
declare
  @dt datetime = /*macro:dataini*/+'',
  @func_id varchar(6) = 0/*macro:funcionarioLiteral*/,
  @turno_id int = 0/*macro:turno_id*/,
  @apenasUltimoFechamento bit = 0;

declare @turnos table (turno_id int)

insert into @turnos
select
  turno_id
from dbo.fn_turnos(@func_id, @dt, @dt, @apenasUltimoFechamento, @turno_id);

declare @operacoes table
(
  operacao_id uniqueidentifier
)

insert @operacoes
select distinct o.operacao_id
from movimento_caixa m
join operacao o on
  o.operacao_id = m.operacao_id and
  o.cancelada = 0
join @turnos t on t.turno_id = m.turno_id
where ((m.func_recebeu_id = @func_id) or (@func_id <= 0))

insert @operacoes
select distinct o.operacao_id
from movimento_caixa_geral m
join operacao_geral o on
  o.operacao_id = m.operacao_id and
  o.cancelada = 0
join @turnos t on t.turno_id = m.turno_id
where ((m.func_recebeu_id = @func_id) or (@func_id <= 0));

with dados as
(
  select
    material_id,
    qtde = sum(aux.qtde),
    total = sum(aux.total)
  from
  (
    select
      iv.material_id,
      qtde = iv.qtd,
      total = convert(money, iv.qtd * iv.vl_preco)
    from @operacoes as o
    join venda as hv on hv.operacao_id = o.operacao_id
    join venda_item as iv on iv.venda_id = hv.venda_id
    where iv.valido = 1

    union all

    select
      iv.material_id,
      qtde = iv.qtd,
      total = convert(money, iv.qtd * iv.vl_preco)
    from @operacoes o
    join venda_geral as hv on hv.operacao_id = o.operacao_id
    join venda_item_geral as iv on iv.venda_id = hv.venda_id
    where iv.valido = 1
  ) aux
  group by material_id
)
select
  codigo = m.codigo,
  descricao = m.descricao,
  d.qtde,
  d.total,
  faturamento_pct = round((d.total / x.totgeral) * 100, 2,1),
  pctParaCalculo = d.total / x.totgeral
from dados d with (nolock)
join material m on m.id = d.material_id
cross join
(
  select totgeral = sum(total)
  from dados with (nolock)
) x
order by descricao

/*mapeamentos
funcionario=mv.func_recebeu_id
*/
