with addresses as (
    select * from {{ ref('stg_adw__addresses') }}
),
stateprovinces as (
    select * from {{ ref('stg_adw__stateprovinces') }}
)

select
    a.pk_address,
    a.nome_cidade,
    sp.pk_stateprovince,
    sp.nome_estado,
    sp.nome_pais
from addresses a
left join stateprovinces sp
    on a.fk_stateprovince = sp.pk_stateprovince
