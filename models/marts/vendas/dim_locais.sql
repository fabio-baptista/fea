with
    stg_addresses as (
        select *
        from {{ ref('stg_sap__addresses') }}
    )
    , stg_states as (
        select *
        from {{ ref('stg_sap__stateprovinces') }}
    )
    , joined as (
        select
            stg_addresses.pk_address as sk_local
            , stg_addresses.nome_cidade
            , stg_states.nome_estado
            , stg_states.fk_country_region as codigo_pais
        from stg_addresses
        left join stg_states on stg_addresses.fk_state_province = stg_states.pk_state_province
    )

select * from joined