{{ config(materialized='view') }}

with source_salesorderdetail as (

    select *
    from {{ source('adw_raw', 'sales_salesorderdetail') }}

),

renamed as (

    select
        -- PK da linha do pedido (ESSENCIAL para grão correto na fact)
        cast(salesorderdetailid as int) as pk_salesorderdetail,

        -- FKs
        cast(salesorderid as int) as fk_salesorder,
        cast(productid as int) as fk_product,

        -- Métricas base
        cast(orderqty as int) as quantidade_pedida,

        -- manter precisão alta
        cast(unitprice as decimal(19,6)) as preco_unitario,
        cast(unitpricediscount as decimal(19,6)) as desconto_unitario

    from source_salesorderdetail

)

select *
from renamed