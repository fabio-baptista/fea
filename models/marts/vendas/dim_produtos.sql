with
    stg_produtos as (
        select *
        from {{ ref('stg_sap__products') }}
    )

select
    pk_product as sk_produto -- sk significa Surrogate Key (Chave Substituta)
    , nome_produto
from stg_produtos