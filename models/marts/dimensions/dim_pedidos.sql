with pedidos as (
    select distinct
        pk_salesorder,
        cast(data_pedido as date) as data_pedido,
        fk_customer,
        fk_address,
        fk_creditcard
    from {{ ref('stg_adw__salesorderheaders') }}
)

select *
from pedidos
