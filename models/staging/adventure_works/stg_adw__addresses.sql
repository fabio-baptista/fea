with source_address as (
    select *
    from {{ source('adw_raw', 'person_address') }}
)

select
    cast(addressid as int) as pk_address,
    cast(city as string) as nome_cidade,
    cast(stateprovinceid as int) as fk_stateprovince
from source_address
