with
    source_orderreasons as (
        select *
        from {{ source('sap_adw', 'sales_salesorderheadersalesreason') }}
    )

select
    cast(salesorderid as int) as fk_sales_order
    , cast(salesreasonid as int) as fk_sales_reason
from source_orderreasons