with source_person as (
    select *
    from {{ source('adw_raw', 'person_person') }}
)

select
    cast(businessentityid as int) as pk_person,
    trim(
        concat_ws(
            ' ',
            nullif(firstname, ''),
            nullif(middlename, ''),
            nullif(lastname, '')
        )
    ) as nome_completo,
    cast(persontype as string) as tipo_pessoa
from source_person
