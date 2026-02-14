with
    source_salesreason as (
        select *
        from {{ source('sap_adw', 'sales_salesreason') }}
    )

select
    cast(salesreasonid as int) as pk_sales_reason
    , cast(name as string) as nome_motivo_venda
    , cast(reasontype as string) as tipo_motivo_venda
from source_salesreason