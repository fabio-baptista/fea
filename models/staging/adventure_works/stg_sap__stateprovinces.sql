with
    source_stateprovince as (
        select *
        from {{ source('sap_adw', 'person_stateprovince') }}
    )

select
    cast(stateprovinceid as int) as pk_state_province
    , cast(countryregioncode as string) as fk_country_region
    , cast(name as string) as nome_estado
    , cast(stateprovincecode as string) as sigla_estado
from source_stateprovince