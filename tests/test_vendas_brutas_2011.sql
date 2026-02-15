with validacao as (
    select round(sum(valor_bruto_item), 2) as valor_calculado
    from {{ ref('fct_vendas') }}
    where ano = 2011
)
select *
from validacao
where abs(valor_calculado - 12646112.16) > 0.01
