with salesorderheaders as (
    select *
    from {{ ref('stg_adw__salesorderheaders') }}
),

salesorderdetails as (
    select *
    from {{ ref('stg_adw__salesorderdetails') }}
)

select
    -- Chave técnica do item de venda (grão: 1 linha por item do pedido)
    md5(cast(sd.pk_salesorderdetail as string)) as sk_venda_item,

    -- Chaves de negócio / relacionamento
    sh.pk_salesorder,
    sd.pk_salesorderdetail,
    sd.fk_product,
    sh.fk_customer,
    sh.fk_address,
    sh.fk_creditcard,

    -- Atributos de tempo
    sh.data_pedido,
    cast(sh.data_pedido as date) as data_pedido_date,
    year(sh.data_pedido) as ano,
    month(sh.data_pedido) as mes,
    sh.status_pedido,

    -- Métricas base
    sd.quantidade_pedida,
    sd.preco_unitario,
    sd.desconto_unitario,

    -- Métricas calculadas
    cast(sd.preco_unitario * sd.quantidade_pedida as decimal(19,6)) as valor_bruto_item,
    cast(sd.preco_unitario * coalesce(sd.desconto_unitario, 0) * sd.quantidade_pedida as decimal(19,6)) as valor_desconto_item,
    cast(sd.preco_unitario * (1 - coalesce(sd.desconto_unitario, 0)) * sd.quantidade_pedida as decimal(19,6)) as valor_liquido_item

from salesorderdetails sd
inner join salesorderheaders sh
    on sd.fk_salesorder = sh.pk_salesorder
