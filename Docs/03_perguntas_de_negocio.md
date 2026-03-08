# Perguntas de Negócio

O dashboard deve permitir responder, no mínimo, às seguintes perguntas:

1. Qual o número de pedidos, quantidade comprada e valor total negociado por:
   - produto
   - tipo de cartão
   - motivo de venda
   - data de venda
   - cliente
   - status
   - cidade
   - estado
   - país

2. Quais os produtos com maior ticket médio por:
   - mês
   - ano
   - cidade
   - estado
   - país

3. Quais os 10 melhores clientes por valor total negociado, com filtros por:
   - produto
   - tipo de cartão
   - motivo de venda
   - data de venda
   - status
   - cidade
   - estado
   - país

4. Quais as 5 melhores cidades em valor total negociado, com filtros por:
   - produto
   - tipo de cartão
   - motivo de venda
   - data de venda
   - cliente
   - status
   - cidade
   - estado
   - país

5. Qual o número de pedidos, quantidade comprada e valor total negociado por mês e ano.

6. Qual produto tem a maior quantidade de unidades compradas para o motivo de venda **Promotion**.

## Métricas-base
- **Número de pedidos:** `count(distinct salesorderid)`
- **Quantidade comprada:** `sum(orderqty)`
- **Valor total negociado bruto:** `sum(unitprice * orderqty)`
- **Valor total negociado líquido:** `sum((unitprice * orderqty) - discount)` ou regra equivalente conforme a modelagem adotada
- **Ticket médio:** `(faturamento bruto - descontos) / número de pedidos`
