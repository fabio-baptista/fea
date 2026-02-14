with
    stg_orders as (
        select *
        from {{ ref('stg_sap__salesorderheaders') }}
    )

    , stg_order_items as (
        select *
        from {{ ref('stg_sap__salesorderdetails') }}
    )

    , joined as (
        select
            stg_order_items.fk_salesorder
            , stg_order_items.fk_product
            , stg_orders.fk_customer
            , stg_orders.fk_address
            , stg_orders.fk_creditcard
            , stg_orders.data_pedido
            , stg_order_items.quantidade_pedida
            , stg_order_items.preco_unitario
            , stg_order_items.desconto_unitario
            -- Cálculo da Métrica: Valor Total Negociado (conforme dicionário de dados)
            , stg_order_items.quantidade_pedida * stg_order_items.preco_unitario as valor_bruto_item
        from stg_order_items
        left join stg_orders on stg_order_items.fk_salesorder = stg_orders.pk_salesorder
    )

select * from joined