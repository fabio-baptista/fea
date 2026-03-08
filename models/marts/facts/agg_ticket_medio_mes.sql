with base as (
    select
        date_trunc('month', data_pedido_date) as mes,
        pk_salesorder,
        valor_bruto_item,
        valor_desconto_item,
        valor_liquido_item
    from {{ ref('fct_vendas') }}
),

por_pedido as (
    -- 1 linha por pedido por mês
    select
        mes,
        pk_salesorder,
        sum(valor_bruto_item) as faturamento_bruto,
        sum(valor_desconto_item) as descontos,
        sum(valor_liquido_item) as total_negociado
    from base
    group by 1,2
),

final as (
    select
        mes,
        count(*) as numero_pedidos,
        sum(faturamento_bruto) as faturamento_bruto,
        sum(descontos) as descontos,
        sum(total_negociado) as total_negociado,
        sum(total_negociado) / nullif(count(*), 0) as ticket_medio
    from por_pedido
    group by 1
)

select * from final