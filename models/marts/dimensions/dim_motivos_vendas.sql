with reasons as (
    select * from {{ ref('stg_adw__salesreasons') }}
)

select
    pk_salesreason,
    nome_motivo_venda,
    tipo_motivo_venda
from reasons
