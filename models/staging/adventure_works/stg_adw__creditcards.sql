with source_creditcard as (
    select *
    from {{ source('adw_raw', 'sales_creditcard') }}
)

select
    cast(creditcardid as int) as pk_creditcard,
    cast(cardtype as string) as tipo_cartao
from source_creditcard
