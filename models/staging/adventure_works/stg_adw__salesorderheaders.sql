with
    source_salesorderheader as (
        select *
        from {{ source('adw_raw', 'sales_salesorderheader') }}
    )

select
    cast(salesorderid as int) as pk_salesorder
    , cast(customerid as int) as fk_customer
    , cast(creditcardid as int) as fk_creditcard
    , cast(billtoaddressid as int) as fk_address
    , cast(orderdate as timestamp) as data_pedido
    , cast(status as int) as status_pedido
    , cast(subtotal as decimal(19,6)) as subtotal_valor
    , cast(taxamt as decimal(19,6)) as imposto_valor
    , cast(freight as decimal(19,6)) as frete_valor
    , cast(totaldue as decimal(19,6)) as total_valor
from source_salesorderheader
