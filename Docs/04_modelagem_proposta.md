# Modelagem Proposta

## Grão da fato
A tabela fato proposta é **fct_vendas**, com grão em **item de pedido de venda**.

## Dimensões sugeridas
- `dim_clientes`
- `dim_locais`
- `dim_cartoes`
- `dim_produtos`
- `dim_motivos_vendas`
- `dim_pedidos`

## Tabelas auxiliares sugeridas
- `bridge_pedido_motivo_venda` para relacionar pedidos a motivos de venda quando necessário.

## Principais fontes transacionais
- `salesorderheader`
- `salesorderdetail`
- `customer`
- `person`
- `product`
- `address`
- `stateprovince`
- `countryregion`
- `creditcard`
- `salesreason`
- `salesorderheadersalesreason`

## Métricas da fato
- quantidade comprada
- preço unitário
- desconto unitário ou percentual
- valor bruto do item
- valor de desconto
- valor líquido do item

## Observação
A modelagem final deve ser refletida no PDF do modelo conceitual dentro da pasta `conceptual_model/`.
