with
    source_salesorderheader as (
        select *
        from {{ source('sap_adw', 'sales_salesorderheader') }}
    )

select
    cast(salesorderid as int) as pk_salesorder
    , cast(customerid as int) as fk_customer
    , cast(creditcardid as int) as fk_creditcard
    , cast(billtoaddressid as int) as fk_address -- Corrigido: usando billtoaddressid conforme o log
    , cast(orderdate as timestamp) as data_pedido
    , cast(status as int) as status_pedido
    , cast(subtotal as numeric(18,2)) as subtotal_valor -- Importante para o teste do Carlos
    , cast(taxamt as numeric(18,2)) as imposto_valor
    , cast(freight as numeric(18,2)) as frete_valor
    , cast(totaldue as numeric(18,2)) as total_valor
from source_salesorderheader