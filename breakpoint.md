Rotina 1 concluída e verificada no Power BI Desktop. Segue o resumo.
O que foi alterado
Gráfico de barras — “Receita por Categoria e Subcategoria (Drill-Down)”
- Eixo Y agora tem apenas [Receita Internet] (antes tinha 3 medidas misturadas).
- [Margem Bruta %] e [Participação da Categoria %] movidas para Dicas de Ferramenta (Tooltips).
- Rótulos de dados ativados (OutsideEnd, 2 casas, exibição em Milhões) → “R$ 14,52 Mi”, “R$ 9,95 Mi” etc.
- Título atualizado com o sufixo (Drill-Down).
- Hierarquia Categoria → Subcategoria → Produto preservada.
Gráfico de linhas — “Evolução Mensal da Receita”
- Receita Internet: linha azul-marinho #1F4E79, espessura 3.
- Receita Ano Anterior: linha tracejada laranja #C55A11, espessura 2.
- Tela de fundo branca + cantos arredondados, igual aos cartões.
Demais ajustes
- Segmentador Categoria: removida a seleção padrão “Accessories” → agora abre em “Todos”.
- Cartão Pedidos Internet: removido o override de formato 0.00 da projeção; o cartão exibe 27,66 Mil, exatamente como o guia descreve (comentário abaixo).
- Cartões dos dois gráficos: fundo branco, borda #E3E7ED e raio de 8 px (padrão dos KPIs).
Verificação
- pbir validate: válido (12 avisos, todos apenas de versão de schema; 4 informativos).
- Modelo íntegro: 12 tabelas, 11 medidas — nenhuma alteração no modelo.
- Conferido visualmente por screenshot do Desktop: Categoria em “Todos”, rótulos no gráfico de barras, legenda do gráfico de linhas com as cores corretas (marinho / laranja tracejado) e cartões com totais gerais (R$ 29,36 Mi, R$ 12,08 Mi, 41,15%...).
Dois pontos técnicos que você precisa saber
1. Assinatura do pacote: o pbix guarda uma assinatura (SecurityBindings). Ao reescrever o relatório por ferramenta, essa assinatura fica inválida e o Power BI recusava abrir o arquivo (“Não foi possível abrir o documento”). Removi o blob antigo — o arquivo abre normalmente e o Desktop re-assina ao salvar. Por isso ele aparece como “não salvo”; se fechar pedindo para salvar, pode salvar.
2. Cores do gráfico de linhas: o Power BI ignora lineStyles.strokeColor nesse visual; a cor por série só é aplicada via dataPoint.fill (que é o que usei). A espessura e o tracejado continuam via lineStyles.
Observação (não alterei)
Com Ano = “Todos”, as duas linhas do gráfico mensal ficam praticamente sobrepostas, porque [Receita Ano Anterior] soma o mesmo conjunto de anos deslocado. A comparação só fica legível com um ano específico selecionado. Se quiser, posso definir um ano padrão no segmentador (ex.: 2014) numa das próximas rotinas — mas isso muda o padrão de todos os cartões.
O arquivo Dashboard_Analitico.pbix está aberto no Desktop para você conferir. A cópia de segurança segue intacta e há também um backup do estado anterior em %LOCALAPPDATA%\Temp\opencode\pbix\Dashboard_Analitico_pre_routine1.pbix.
Me avise quando quiser que eu siga para a Rotina 2 (Top 10 Produtos Mais Vendidos + Descontos Concedidos e alinhamento do layout).