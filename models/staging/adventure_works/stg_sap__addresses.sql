with
    source_address as (
        select *
        from {{ source('sap_adw', 'person_address') }}
    )

select
    cast(addressid as int) as pk_address
    , cast(stateprovinceid as int) as fk_state_province
    , cast(city as string) as nome_cidade
from source_address