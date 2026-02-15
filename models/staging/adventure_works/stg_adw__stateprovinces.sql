with source_stateprovince as (
    select *
    from {{ source('adw_raw', 'person_stateprovince') }}
),
source_countryregion as (
    select *
    from {{ source('adw_raw', 'person_countryregion') }}
)

select
    cast(sp.stateprovinceid as int) as pk_stateprovince,
    cast(sp.name as string) as nome_estado,
    cast(sp.countryregioncode as string) as codigo_pais,
    cast(cr.name as string) as nome_pais
from source_stateprovince sp
left join source_countryregion cr
    on sp.countryregioncode = cr.countryregioncode
