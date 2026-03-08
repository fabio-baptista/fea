with source_product as (
    select *
    from {{ source('adw_raw', 'production_product') }}
)

select
    cast(productid as int) as pk_product,
    cast(name as string) as nome_produto
from source_product
