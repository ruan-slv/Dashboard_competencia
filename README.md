# Dashboard de Competência

<p align="center">
  <img src="https://img.shields.io/badge/Power%20BI-Analysis-%23F2C811?style=for-the-badge&logo=microsoftpowerbi" alt="Power BI" />
  <img src="https://img.shields.io/badge/AdventureWorks-Data%20Warehouse-%231F6FEB?style=for-the-badge" alt="AdventureWorks" />
  <img src="https://img.shields.io/badge/Status-Em%20desenvolvimento-%23FFB703?style=for-the-badge" alt="Em desenvolvimento" />
</p>

## Visão Geral

Este projeto tem como objetivo desenvolver um dashboard analítico com base no banco de dados AdventureWorks, aplicando conceitos de Business Intelligence, construção de KPIs e storytelling de dados. O trabalho busca transformar informações comerciais em indicadores relevantes para a tomada de decisão, com foco em desempenho operacional, comercial e estratégico da organização.

## Objetivos

O projeto tem como foco exercitar os seguintes conceitos:

- Construção de KPIs;
- Desenvolvimento de dashboards;
- Interpretação de indicadores por meio de análise de dados;
- Aplicação de conceitos de data storytelling;
- Comunicação dos resultados de forma clara e objetiva.

## Enunciado

Utilizando o modelo de dados do AdventureWorks, deve ser desenvolvido um dashboard contendo, no mínimo, 10 indicadores (KPIs) relevantes para o negócio. A base de dados utilizada será o AdventureWorks Data Warehouse.

## Atividades do Projeto

1. Definir e calcular pelo menos 10 indicadores (métricas/KPIs) relevantes;
2. Construir um dashboard utilizando o Power BI;
3. Preparar uma apresentação fundamentada no dashboard, aplicando data storytelling;
4. Explicar:
   - o significado dos indicadores;
   - os principais insights identificados;
   - possíveis tomadas de decisão a partir da análise;
5. Realizar a defesa do projeto em sala de aula;
6. Enviar o arquivo do Power BI (.pbix) no AVA.

## Estrutura do Repositório

```text
Dashboard_competencia/
├── README.md
├── KPIs.md
├── data/
│   └── AdventureWorksDW2025.bak
└── (arquivos do projeto Power BI e materiais adicionais)
```

## Dados

O conjunto de dados utilizado no projeto está localizado em:

- `data/AdventureWorksDW2025.bak`

Esse arquivo representa um backup do banco de dados AdventureWorks Data Warehouse, que pode ser restaurado em um ambiente SQL Server para suporte à modelagem e análise no Power BI.

## Requisitos Técnicos

- SQL Server (para restauração do backup caso necessário);
- Power BI Desktop;
- Microsoft Excel (opcional, para validação de dados e organização de métricas);
- Conhecimentos básicos de modelagem dimensional e indicadores de negócio.

## Sugestões de KPIs

Alguns exemplos de métricas que podem ser avaliadas:

- Receita total;
- Vendas por categoria e produto;
- Lucro bruto;
- Ticket médio por cliente;
- Taxa de crescimento de vendas;
- Retorno por região;
- Volume de pedidos por mês;
- Performance de vendedores;
- Índice de satisfação do cliente;
- Custo por unidade vendida.

As definições e fórmulas DAX de uma proposta inicial com 10 indicadores estão em [KPIs.md](./KPIs.md).

## Apresentação

A apresentação será individual e deve comunicar de forma clara a narrativa dos dados, destacando os indicadores mais relevantes, os principais achados e as decisões que podem ser tomadas a partir das análises.

## Prazo de Entrega

- Data limite para envio: 01/07/2026.

## Critérios Avaliativos

| Critério | Descrição | Pontuação |
|---|---|---:|
| Construção dos KPIs | Clareza, relevância e coerência dos indicadores desenvolvidos para análise do negócio. | 6,0 |
| Desenvolvimento do Dashboard | Qualidade visual, organização, usabilidade, interatividade e aplicação de boas práticas no Power BI. | 6,0 |
| Análise e Insights | Capacidade de interpretar os dados e extrair insights relevantes para apoio à tomada de decisão. | 5,0 |
| Data Storytelling e Apresentação | Clareza na comunicação, estrutura da apresentação e capacidade de explicar os indicadores e resultados obtidos. | 5,0 |
| Defesa do Projeto | Domínio do conteúdo, argumentação e respostas aos questionamentos realizados durante a apresentação. | 3,0 |
| Total |  | 25,0 |

## Observações

- Trabalhos entregues após o prazo poderão sofrer desconto na nota;
- O projeto deve ser desenvolvido individualmente;
- KPIs repetitivos ou sem relevância para o negócio podem impactar negativamente a avaliação;
- O dashboard deve apresentar identidade visual consistente e adequada ao contexto empresarial.

## Fontes

- AdventureWorks
- Modelo de dados AdventureWorks
- Modelo Multi-Dimensional

## Objetivo Final

O resultado esperado deste projeto é a criação de um dashboard eficiente, visualmente bem estruturado e rico em informações estratégicas, capaz de apoiar a tomada de decisão por meio de dados e storytelling analítico.