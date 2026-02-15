with source_salesreason as (
    select *
    from {{ source('adw_raw', 'sales_salesreason') }}
)

select
    cast(salesreasonid as int) as pk_salesreason,
    cast(name as string) as nome_motivo_venda,
    cast(reasontype as string) as tipo_motivo_venda
from source_salesreason
