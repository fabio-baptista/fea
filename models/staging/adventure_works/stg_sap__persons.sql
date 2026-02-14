with
    source_person as (
        select *
        from {{ source('sap_adw', 'person_person') }}
    )

select
    cast(businessentityid as int) as pk_person
    , cast(firstname || ' ' || lastname as string) as nome_pessoa
from source_person