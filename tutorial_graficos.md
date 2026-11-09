# Guia Prático: Construção dos Gráficos Analíticos no Power BI

Este guia contém o passo a passo detalhado para dar continuidade à construção do **Dashboard Comercial de E-Commerce (AdventureWorks DW)** a partir da seção central de gráficos analíticos.

---

## 📌 Estado Atual do Projeto
* **Cabeçalho:** Criado com título, subtítulo e segmentadores de dados (`Ano` e `Categoria` em formato de lista suspensa).
* **Cartões de KPIs (Linha Superior):**
  * `Receita Internet` (R$ 29,36 Mi)
  * `Lucro Bruto Internet` (R$ 12,08 Mi)
  * `Margem Bruta %` (41,15%)
  * `Pedidos Internet` (27,66 Mil)
  * `Ticket Médio Internet` (1,06 Mil)
  * `Unidades Vendidas` (60 Mil)

---

## 📊 1. Gráfico Central Esquerdo: Evolução Mensal da Receita (Atual vs Ano Anterior)

**Objetivo:** Demonstrar a inteligência temporal do modelo e comparar a sazonalidade das vendas mês a mês em relação ao mesmo período do ano anterior (**KPI 7: Receita Ano Anterior**).

### Passo a Passo de Construção:
1. No painel de **Visualizações**, clique no ícone de **Gráfico de linhas** *(Line chart)*.
2. Posicione o gráfico no lado esquerdo, logo abaixo dos cartões de KPIs.
3. Configure os campos de dados:
   * **Eixo X:** Arraste `DimDate[EnglishMonthName]`.
   * **Eixo Y:** Arraste duas medidas da tabela `_Medidas`:
     1. `[Receita Internet]`
     2. `[Receita Ano Anterior]`

### ⚠️ Ajuste Importante: Ordenação Correta dos Meses (Janeiro a Dezembro)
Por padrão, o Power BI pode ordenar os meses em ordem alfabética (*April, August, December...*). Para ordenar de forma cronológica correta:
1. Vá até o painel de **Dados** à direita e expanda a tabela **`DimDate`**.
2. Clique com o botão esquerdo na coluna **`EnglishMonthName`** (para selecioná-la).
3. Na faixa de opções superior do Power BI, clique na guia **Ferramentas de coluna** *(Column tools)*.
4. Clique no botão **Classificar por coluna** *(Sort by column)*.
5. Escolha a coluna numérica **`MonthNumberOfYear`**.
6. No gráfico, clique nos **três pontinhos (...)** no canto superior direito > **Classificar eixo** > selecione **`EnglishMonthName`** e ordem **Crescente**.

### Formatação Visual Recomendada:
* **Geral > Efeitos:** Ative **Tela de fundo** branca com cantos arredondados (raio de 6 a 8 px) e sombra sutil, combinando com os cartões.
* **Geral > Título:** `Evolução Mensal da Receita (Atual vs Ano Anterior)`.
* **Visual > Linhas:** 
  * Linha da Receita Atual: cor de destaque (Azul marinho ou Azul royal).
  * Linha do Ano Anterior: cor secundária ou tracejada (Cinza escuro ou Laranja).

---

## 📊 2. Gráfico Central Direito: Receita por Categoria com Drill-Down

**Objetivo:** Permitir navegação hierárquica completa do nível macro para o nível micro (**Categoria $\rightarrow$ Subcategoria $\rightarrow$ Produto**) e cumprir o requisito de **Drill-down** e a **KPI 10: Participação da Categoria %**.

### Passo a Passo de Construção:
1. No painel de **Visualizações**, selecione o **Gráfico de colunas clusterizado** *(ou Gráfico de barras horizontais)*.
2. Posicione o gráfico no lado direito, alinhado à mesma altura do gráfico de linhas.
3. Configure os campos no painel de visualização:
   * **Eixo X:** Arraste **em ordem hierárquica**:
     1. `DimProductCategory[EnglishProductCategoryName]`
     2. `DimProductSubcategory[EnglishProductSubcategoryName]`
     3. `DimProduct[EnglishProductName]`
   * **Eixo Y:** `[Receita Internet]`
   * **Dicas de ferramenta (Tooltips):**
     * Arraste `[Margem Bruta %]`
     * Arraste `[Participação da Categoria %]`
     *(Isso permite que, ao passar o mouse sobre cada coluna, o usuário veja o faturamento, a margem de lucro e o peso da categoria no total).*

### Como Testar e Usar o Drill-Down na Apresentação:
No canto superior ou inferior do visual, utilize os controles interativos:
* **Seta única para baixo ($\downarrow$):** Ativa o modo drill-down por clique. Ao clicar na barra de *Bikes*, o gráfico desce apenas para as subcategorias de bicicletas.
* **Duas setas para baixo ($\downarrow\downarrow$):** Desce todo o visual para o próximo nível (todas as subcategorias juntas).
* **Seta ramificada / bifurcada ($\Psi$):** Expande a hierarquia mantendo o nome do nível superior concatenado.
* **Seta para cima ($\uparrow$):** Retorna ao nível superior.

### Formatação Visual Recomendada:
* **Geral > Efeitos:** Fundo branco com cantos arredondados (mesmo padrão dos cartões).
* **Geral > Título:** `Receita por Categoria e Subcategoria (Drill-Down)`.
* **Visual > Rótulos de dados:** Ative os rótulos no topo das colunas para facilitar a leitura.

---

## 📊 3. Visuais Inferiores Complementares (Seção Final da Tela)

Abaixo dos dois gráficos centrais, preencha a base da tela com:

### A. Top 10 Produtos Mais Vendidos (Esquerda Inferior)
* **Visual:** Gráfico de barras clusterizado (horizontal).
* **Eixo Y:** `DimProduct[EnglishProductName]`.
* **Eixo X:** `[Receita Internet]`.
* **Filtro Top 10:**
  1. Com o visual selecionado, abra o painel **Filtros**.
  2. Expanda o filtro do campo `EnglishProductName`.
  3. No tipo de filtro, mude de "Filtragem básica" para **Top N**.
  4. Mostrar itens: **Superior** `10`.
  5. Por valor: arraste a medida `[Receita Internet]`.
  6. Clique em **Aplicar filtro**.
* **Título:** `Top 10 Produtos Mais Vendidos por Receita`.

### B. Análise de Eficiência e Descontos (Direita Inferior)
* **Visual:** Gráfico de colunas ou Gráfico de dispersão/área.
* **Eixo X:** `DimProductCategory[EnglishProductCategoryName]`.
* **Eixo Y:** `[Desconto Concedido]` *(KPI 8)* e/ou `[Taxa de Desconto %]` *(KPI 9)*.
* **Título:** `Descontos Concedidos e Impacto Comercial`.

---

## 🎨 Dicas de Alinhamento e Finalização
1. **Alinhamento Perfeito:** Selecione múltiplos visuais com `Shift` pressionado e vá em **Formato** > **Alinhar** > **Alinhar pela parte superior / Distribuir uniformemente**.
2. **Teste de Filtros:** Clique nos seletores suspensos de `Ano` e `Categoria` no cabeçalho para garantir que todos os 6 cartões e os novos gráficos recalculam dinamicamente.
