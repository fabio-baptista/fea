with cards as (
    select * from {{ ref('stg_adw__creditcards') }}
)

select
    pk_creditcard,
    tipo_cartao
from cards
