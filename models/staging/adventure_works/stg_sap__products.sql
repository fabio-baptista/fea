with
    source_products as (
        select *
        from {{ source('sap_adw', 'production_product') }}
    )

select
    cast(productid as int) as pk_product
    , cast(name as string) as nome_produto
from source_products