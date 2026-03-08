with source_orderreason as (
    select *
    from {{ source('adw_raw', 'sales_salesorderheadersalesreason') }}
)

select
    cast(salesorderid as int) as fk_salesorder,
    cast(salesreasonid as int) as fk_salesreason
from source_orderreason
