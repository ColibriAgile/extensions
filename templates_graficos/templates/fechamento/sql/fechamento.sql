--fechamento do periodo/operador
declare
  @dtini datetime = /*macro:dataini*/+'',
  @dtfim datetime = /*macro:datafim*/+'',
  @func varchar(6) = 0/*macro:funcionarioLiteral*/,
  @turno_id int = 0/*macro:turno_id*/,
  @apenasUltimoFechamento bit = 1
  /*@modosdevenda varchar(10) = macro:modosdevenda*/


if object_id('tempdb..#auxRel') is not null
  drop table #auxRel

select
  meio_id,
  meio_nome,
  bandeira,
  valor_calculado = sum(isnull(valor_calculado,0)),
  valor_informado = sum(isnull(valor_informado,0)),
  diferenca = sum(diferenca),
  valor_venda = sum(valor_venda),
  credito_assinada = sum(credito_assinada),
  troco = sum(troco),
  repique = sum(repique),
  contra_vale = sum(contra_vale),
  sangria = sum(sangria),
  suprimento = sum(suprimento)
into #auxRel
from dbo.fn_fechamento_caixa(
  @dtini,
  @dtfim,
  @func,
  @apenasUltimoFechamento,
  @turno_id,
  ''
)
group by meio_id, meio_nome, bandeira
order by meio_nome, bandeira


declare @retorno table (
  grupo int,
  meio_id int,
  col_1 varchar(40),
  col_2 varchar(40),
  col_3 varchar(40),
  col_4 varchar(40),
  mostrar_valores bit default 1
)

--Grupo 1 ENTROU NO CAIXA
insert into @retorno 
select 
  grupo = 1,
  meio_id,
  col_1,
  col_2, 
  col_3, 
  col_4,
  mostrar_valores
from 
(
	select 
	meio_id,
	col_1 = meio_nome,
	col_2 = null,
	col_3 = valor_venda,
	col_4 = credito_assinada,
  mostrar_valores = 1
	from #auxRel
	where bandeira is null
    and ((valor_venda > 0) or 
         (credito_assinada > 0))

	union all

	select 
	meio_id,
	col_1 = meio_nome,
	col_2 = null,
	col_3 = null,
	col_4 = null,
  mostrar_valores = 0
	from #auxRel
	where bandeira is not null
    and ((valor_venda > 0) or 
         (credito_assinada > 0))
  
	group by meio_id, meio_nome

	union all

	select 
	meio_id,
	col_1 = '  ' + bandeira,
	col_2 = null,
	col_3 = valor_venda,
	col_4 = credito_assinada,
  mostrar_valores = 1
	from #auxRel
	where bandeira is not null	  
    and ((valor_venda > 0) or 
         (credito_assinada > 0))

) g1

--Grupo 2 SAIU DO CAIXA
insert into @retorno 
select 
  grupo = 2,
  meio_id,
  col_1,
  col_2, 
  col_3, 
  col_4,
  mostrar_valores
from 
(
	select 
    meio_id,
    col_1 = meio_nome,
    col_2 = troco,
    col_3 = repique,
    col_4 = contra_vale,
    mostrar_valores = 1
	from #auxRel
	where bandeira is null
    and (troco <> 0 or repique <> 0 or contra_vale <> 0)  

	union all

	select 
	meio_id,
	col_1 = meio_nome,
	col_2 = null,
	col_3 = null,
	col_4 = null,
  mostrar_valores = 0
	from #auxRel
	where bandeira is not null
	  and (troco <> 0 or repique <> 0 or contra_vale <> 0)  
  group by meio_id, meio_nome

	union all

	select 
	meio_id,
	col_1 = '  ' + bandeira,
    col_2 = troco,
    col_3 = repique,
    col_4 = contra_vale,
    mostrar_valores = 1
	from #auxRel
	where bandeira is not null	  
   and (troco <> 0 or repique <> 0 or contra_vale <> 0)  

) g2

-- grupo 3 OUTROS MOVIMENTOS
insert @retorno
select 
  grupo = 3,
  meio_id,
  col_1 = meio_nome,
  col_2 = null,
  col_3 = sangria,
  col_4 = suprimento,
  mostrar_valores = 1
from #auxRel
where sangria < 0 or suprimento > 0

-- grupo 4 TOTAIS
insert into @retorno 
select 
  grupo = 4,
  meio_id,
  col_1,
  col_2, 
  col_3, 
  col_4,
  mostrar_valores
from 
(
	select 
	  meio_id,
    col_1 = meio_nome,
    col_2 = valor_calculado,
    col_3 = valor_informado,
    col_4 = diferenca,
    mostrar_valores = 1
	from #auxRel
	where bandeira is null
  
	union all

	select 
	  meio_id,
	  col_1 = meio_nome,
	  col_2 = null,
	  col_3 = null,
	  col_4 = null,
    mostrar_valores = 0
	from #auxRel
	where bandeira is not null
	group by meio_id, meio_nome

	union all

	select 
	  meio_id,
	  col_1 = '  ' + bandeira,
    col_2 = valor_calculado,
    col_3 = valor_informado,
    col_4 = diferenca,
    mostrar_valores = 1
	from #auxRel
	where bandeira is not null	  
   and (valor_calculado <> 0 or valor_informado <> 0)

) g4

 
declare @tot money = (select sum(diferenca) from #auxRel)
insert @retorno
select
  grupo = 5,
  null,
  col_1 = case
    when @tot > 0 then 'SOBRA ====> ' + cast(@tot as varchar)
    when @tot < 0 then 'FALTA ====> ' + cast(@tot as varchar)
    else 'CAIXA OK !'
  end,
  col_2 = null,
  col_3 = null,
  col_4 = null,
  mostrar_valores = null


declare 
  @TefSimplificado bit = 0

if exists(select * from parametro where codigo = 'CfgUsaTEFSimplificado' and valor = '1')
  set @TefSimplificado = 1

if (@TefSimplificado = 1) 
  select grupo, col_1, col_2, col_3, col_4, mostrar_valores
  from @retorno
  order by grupo, abs(meio_id), col_3
else
  select 
    grupo, 
    col_1 = max(col_1), 
    col_2 = cast(sum(cast(col_2 as money)) as varchar), 
    col_3 = cast(sum(cast(col_3 as money)) as varchar), 
    col_4 = cast(sum(cast(col_4 as money)) as varchar), 
    mostrar_valores = 1
  from @retorno
  group by grupo, abs(meio_id)
  order by grupo, abs(meio_id)

