--faturamento (periodo/operador)
declare
  @dtini datetime = /*macro:dataini*/+'',
  @dtfim datetime = /*macro:datafim*/+'',
  @func varchar(6) = 0/*macro:funcionarioLiteral*/,
  @apenasUltimoFechamento bit = 0/*macro:apenasUltimoFechamento*/,
  @turno_id int = 0/*macro:turno_id*/,
  @modosdevenda varchar(10) = /*macro:modosdevenda*/+'';

select
  grupo,
  sessao,
  descricao,
  valor = sum(isnull(valor, 0)),
  total_faturamento = max(isnull(total_faturamento, 0))
from dbo.fn_faturamento(
  @dtini,
  @dtfim,
  @func,
  @apenasUltimoFechamento,
  @turno_id,
  @modosdevenda
)
group by
  grupo,
  sessao,
  descricao
order by
  grupo,
  case
    when lower(descricao) = 'dinheiro' then descricao
    else sessao
  end,
  descricao