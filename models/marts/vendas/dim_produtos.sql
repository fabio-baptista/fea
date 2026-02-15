with products as (
    select * from {{ ref('stg_adw__products') }}
)

select
    pk_product,
    nome_produto
from products
