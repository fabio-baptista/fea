with
    stg_customers as (
        select *
        from {{ ref('stg_sap__customers') }}
    )
    , stg_persons as (
        select *
        from {{ ref('stg_sap__persons') }}
    )
    , joined as (
        select
            stg_customers.pk_customer as sk_cliente
            , stg_persons.nome_pessoa as nome_cliente
        from stg_customers
        left join stg_persons on stg_customers.fk_person = stg_persons.pk_person
    )

select * from joined