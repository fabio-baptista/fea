with
    stg_salesreasons as (
        select *
        from {{ ref('stg_sap__salesreasons') }}
    )
    , stg_orderreasons as (
        select *
        from {{ ref('stg_sap__orderreasons') }}
    )
    , joined as (
        select
            stg_orderreasons.fk_sales_order
            , stg_salesreasons.nome_motivo_venda
        from stg_orderreasons
        left join stg_salesreasons on stg_orderreasons.fk_sales_reason = stg_salesreasons.pk_sales_reason
    )

select * from joined