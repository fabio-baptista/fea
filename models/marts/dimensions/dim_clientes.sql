with customers as (
    select * from {{ ref('stg_adw__customers') }}
),
persons as (
    select * from {{ ref('stg_adw__persons') }}
)

select
    c.pk_customer,
    c.fk_person,
    c.fk_store,
    p.nome_completo as nome_cliente
from customers c
left join persons p
    on c.fk_person = p.pk_person
