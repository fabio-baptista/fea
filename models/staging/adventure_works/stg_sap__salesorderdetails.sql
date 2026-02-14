with
    source_salesorderdetail as (
        select *
        from {{ source('sap_adw', 'sales_salesorderdetail') }}
    )

select
    cast(salesorderid as int) as fk_salesorder
    , cast(productid as int) as fk_product
    , cast(orderqty as int) as quantidade_pedida
    , cast(unitprice as numeric(18,2)) as preco_unitario
    , cast(unitpricediscount as numeric(18,2)) as desconto_unitario
from source_salesorderdetail