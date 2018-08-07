declare @dt datetime = /*macro:dataini*/;

select
  atendente = f.nome,
  qtd_mesas = count(v.venda_id),
  qtd_pessoas = sum(o.qtd_pessoas),
  total = sum(o.vl_total),
  media_mesa = avg(o.vl_total),
  media_cliente = sum(o.vl_total) / sum(o.qtd_pessoas)
from dbo.fn_operacoes_venda(@dt, @dt, 0) o
cross apply dbo.fn_venda(o.operacao_id, default, 1) v
join dbo.funcionario f with (nolock) on f.id = v.func_atendeu_id
where o.modo_venda_id = 3
  and o.cancelada = 0
group by f.nome

