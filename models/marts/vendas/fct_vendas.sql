with salesorderheaders as (
    select *
    from {{ ref('stg_adw__salesorderheaders') }}
),

salesorderdetails as (
    select *
    from {{ ref('stg_adw__salesorderdetails') }}
)

select
    -- chave técnica do item de venda (grão: 1 linha por item do pedido)
    md5(
      concat(
        cast(sh.pk_salesorder as string), '-',
        cast(sd.fk_product as string)
      )
    ) as sk_venda_item,

    -- chaves de negócio / relacionamento
    sh.pk_salesorder,
    sd.fk_product,
    sh.fk_customer,
    sh.fk_address,
    sh.fk_creditcard,

    -- data e atributos analíticos
    sh.data_pedido,
    year(sh.data_pedido) as ano,
    month(sh.data_pedido) as mes,
    sh.status_pedido,

    -- métricas base
    sd.quantidade_pedida,
    sd.preco_unitario,
    sd.desconto_unitario,

    -- métricas calculadas (alta precisão; arredondar só na camada de consumo)
    cast(sd.preco_unitario * sd.quantidade_pedida as decimal(19,6)) as valor_bruto_item,
    cast(sd.preco_unitario * sd.desconto_unitario * sd.quantidade_pedida as decimal(19,6)) as valor_desconto_item,
    cast(sd.preco_unitario * (1 - sd.desconto_unitario) * sd.quantidade_pedida as decimal(19,6)) as valor_liquido_item

from salesorderdetails sd
inner join salesorderheaders sh
    on sd.fk_salesorder = sh.pk_salesorder
