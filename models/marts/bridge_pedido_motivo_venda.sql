with orderreasons as (
    select *
    from {{ ref('stg_adw__orderreasons') }}
)

select distinct
    fk_salesorder as pk_salesorder,
    fk_salesreason as pk_salesreason
from orderreasons
