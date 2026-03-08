-- Este teste garante que a soma dos valores brutos dos itens na fct_vendas
-- corresponde ao subtotal informado no cabeçalho do pedido (staging).
-- Diferenças podem indicar perda de dados ou erros de cálculo no item.

with item_totals as (
    select
        pk_salesorder,
        sum(valor_bruto_item) as total_bruto_calculado
    from {{ ref('fct_vendas') }}
    group by 1
),

header_subtotal as (
    select
        pk_salesorder,
        subtotal_valor
    from {{ ref('stg_adw__salesorderheaders') }}
)

select
    i.pk_salesorder,
    i.total_bruto_calculado,
    h.subtotal_valor,
    abs(i.total_bruto_calculado - h.subtotal_valor) as diferenca
from item_totals i
join header_subtotal h on i.pk_salesorder = h.pk_salesorder
where abs(i.total_bruto_calculado - h.subtotal_valor) > 0.01
