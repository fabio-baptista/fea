-- tests/test_vendas_brutas_2011.sql

with total_2011 as (
    select
        cast(sum(valor_bruto_item) as decimal(19, 2)) as total_bruto_2011
    from {{ ref('fct_vendas') }}
    where year(data_pedido) = 2011
)

select *
from total_2011
where total_bruto_2011 <> 12646112.16