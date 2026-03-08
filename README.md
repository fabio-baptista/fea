# Projeto dbt Adventure Works

Este repositório contém o projeto dbt para a transformação de dados do banco de dados Adventure Works. O objetivo é transformar os dados brutos (camada raw) em um modelo dimensional pronto para análise e Business Intelligence.

## 🚀 Visão Geral

O projeto utiliza o **dbt (data build tool)** para realizar a modelagem e transformação dos dados hospedados no **Databricks**. A arquitetura segue as melhores práticas de modelagem dbt, dividindo o processo em camadas:

1.  **Staging (Bronze/Silver):** Limpeza inicial, renomeação de colunas e tipagem básica dos dados brutos.
2.  **Intermediate (Silver):** Transformações complexas, joins e regras de negócio intermediárias.
3.  **Marts (Gold):** Tabelas finais organizadas em um esquema Estrela (Star Schema), com dimensões e fatos.

## 📂 Estrutura de Pastas

```text
├── models/
│   ├── staging/        # Camada de limpeza e padronização (stg_adw__*)
│   ├── intermediate/   # Transformações e cruzamentos intermediários
│   └── marts/          # Modelo dimensional final
│       ├── dimensions/ # Dimensões (dim_*)
│       └── facts/      # Tabelas fato (fct_*)
├── tests/              # Testes customizados de qualidade de dados
├── macros/             # Macros reutilizáveis para SQL
└── seeds/              # Dados estáticos carregados via CSV
```

## 🏗️ Modelagem de Dados

O modelo final está estruturado da seguinte forma:

### Dimensões
-   `dim_produtos`: Informações detalhadas sobre os produtos vendidos.
-   `dim_clientes`: Dados dos clientes (Pessoas e Lojas).
-   `dim_locais`: Endereços, cidades, estados e países.
-   `dim_cartoes`: Informações sobre cartões de crédito utilizados.
-   `dim_pedidos`: Detalhes de cabeçalho dos pedidos.
-   `dim_motivos_vendas`: Motivos associados às vendas.

### Fatos
-   `fct_vendas`: Tabela fato principal, com grão ao nível de item do pedido, contendo métricas de quantidade, preço unitário e descontos.

### Bridge
-   `bridge_pedido_motivo_venda`: Tabela de ligação para tratar o relacionamento N:N entre pedidos e motivos de venda.

## 🛠️ Como Executar o Projeto

### Pré-requisitos
-   Python 3.8+
-   dbt-core instalado
-   Adaptador dbt-databricks (ou o correspondente ao seu ambiente)

### Passo a Passo

1.  **Clone o repositório:**
    ```bash
    git clone [url-do-repositorio]
    cd adventure_works
    ```

2.  **Instale as dependências:**
    ```bash
    dbt deps
    ```

3.  **Verifique a conexão:**
    ```bash
    dbt debug
    ```

4.  **Execute os modelos:**
    ```bash
    dbt run
    ```

5.  **Execute os testes:**
    ```bash
    dbt test
    ```

## 📊 Documentação

Para gerar e visualizar a documentação interativa do projeto (incluindo o diagrama de linhagem dos dados):

```bash
dbt docs generate
dbt docs serve
```

---
Projeto desenvolvido como parte da formação em Engenharia de Dados.
