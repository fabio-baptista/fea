with pedidos as (
    select
        pk_salesorder,
        cast(data_pedido as date) as data_pedido,
        fk_customer,
        fk_address,
        fk_creditcard,
        status_pedido,
        subtotal_valor,
        imposto_valor,
        frete_valor,
        total_valor
    from {{ ref('stg_adw__salesorderheaders') }}
)

select *
from pedidos
