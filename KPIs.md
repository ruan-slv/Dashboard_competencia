# KPIs recomendados

Este documento registra uma proposta inicial de indicadores para o projeto. As medidas abaixo usam o canal de vendas pela internet do AdventureWorks Data Warehouse (`FactInternetSales`). Portanto, representam **vendas pela internet**, não o total combinado com revendas.

## Pré-requisitos do modelo

Carregue as tabelas `FactInternetSales`, `DimDate`, `DimProduct`, `DimProductSubcategory` e `DimProductCategory` no Power BI e configure estas relações:

- `DimDate[DateKey]` → `FactInternetSales[OrderDateKey]` (ativa);
- `DimProduct[ProductKey]` → `FactInternetSales[ProductKey]`;
- `DimProductSubcategory[ProductSubcategoryKey]` → `DimProduct[ProductSubcategoryKey]`;
- `DimProductCategory[ProductCategoryKey]` → `DimProductSubcategory[ProductCategoryKey]`.

Marque `DimDate` como tabela de datas usando `FullDateAlternateKey`. As fórmulas DAX abaixo usam nomes de tabela e coluna do banco restaurado. Dependendo da configuração regional do Power BI, pode ser necessário substituir vírgulas por ponto e vírgula nos argumentos.

## Indicadores

### 1. Receita de vendas pela internet

**O que mede:** valor das vendas pela internet no contexto de filtros selecionado.

```DAX
Receita Internet =
SUM(FactInternetSales[SalesAmount])
```

**Formato sugerido:** moeda.

### 2. Lucro bruto pela internet

**O que mede:** receita menos o custo total dos produtos vendidos.

```DAX
Lucro Bruto Internet =
[Receita Internet] - SUM(FactInternetSales[TotalProductCost])
```

**Formato sugerido:** moeda.

### 3. Margem de lucro bruto

**O que mede:** parcela da receita que permanece após o custo dos produtos.

```DAX
Margem Bruta % =
DIVIDE([Lucro Bruto Internet], [Receita Internet])
```

**Formato sugerido:** percentual.

### 4. Quantidade vendida

**O que mede:** unidades vendidas, respeitando os filtros aplicados.

```DAX
Unidades Vendidas =
SUM(FactInternetSales[OrderQuantity])
```

**Formato sugerido:** número inteiro.

### 5. Número de pedidos

**O que mede:** quantidade de pedidos distintos pela internet.

```DAX
Pedidos Internet =
DISTINCTCOUNT(FactInternetSales[SalesOrderNumber])
```

**Formato sugerido:** número inteiro.

### 6. Ticket médio por pedido

**O que mede:** receita média por pedido pela internet.

```DAX
Ticket Médio Internet =
DIVIDE([Receita Internet], [Pedidos Internet])
```

**Formato sugerido:** moeda.

### 7. Crescimento anual da receita

**O que mede:** variação percentual da receita em relação ao mesmo período do ano anterior.

```DAX
Receita Ano Anterior =
CALCULATE(
    [Receita Internet],
    DATEADD(DimDate[FullDateAlternateKey], -1, YEAR)
)

Crescimento Anual Receita % =
DIVIDE(
    [Receita Internet] - [Receita Ano Anterior],
    [Receita Ano Anterior]
)
```

**Formato sugerido:** percentual. O resultado depende da relação ativa entre `DimDate` e a data do pedido.

### 8. Desconto concedido

**O que mede:** soma dos descontos registrados nas linhas de venda.

```DAX
Desconto Concedido =
SUM(FactInternetSales[DiscountAmount])
```

**Formato sugerido:** moeda.

### 9. Taxa de desconto

**O que mede:** proporção do valor estendido das vendas concedida como desconto.

```DAX
Taxa de Desconto % =
DIVIDE(
    [Desconto Concedido],
    SUM(FactInternetSales[ExtendedAmount])
)
```

**Formato sugerido:** percentual. Interprete em conjunto com receita e margem para avaliar o efeito comercial dos descontos.

### 10. Participação da categoria na receita

**O que mede:** participação de cada categoria na receita pela internet, preservando outros filtros, como período e região.

```DAX
Participação da Categoria % =
DIVIDE(
    [Receita Internet],
    CALCULATE(
        [Receita Internet],
        REMOVEFILTERS(DimProductCategory),
        REMOVEFILTERS(DimProductSubcategory)
    )
)
```

**Formato sugerido:** percentual. Use `DimProductCategory[EnglishProductCategoryName]` ou a coluna de categoria no idioma desejado para segmentar o resultado.

## Observações

- Estes KPIs são uma proposta documentada; ainda precisam ser criados e validados como medidas no Power BI.
- As medidas acima cobrem somente `FactInternetSales`. Para apresentar o desempenho total do negócio, crie medidas equivalentes para `FactResellerSales` e trate moedas e filtros de canal de forma consistente.
- “Lucro bruto” é calculado com `SalesAmount` menos `TotalProductCost`; valide essa definição com o escopo analítico do trabalho.
- Confira a agregação e os resultados das medidas com consultas no SQL Server antes de usá-los na análise e na apresentação.
