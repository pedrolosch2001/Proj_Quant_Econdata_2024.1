# Proj_Quant_Econdata_2024.1
 Finanças Quantitativas

 Esse projeto tem como objetivo aplicar uma estratégia de trading quantitativ, e aplicar em um fundo criado por nós, com ativos selecionados manualmente pelos membros do grupo, e que será administrado inteiramente pelo código. \
 Todas as decisões de compra e venda do fundo serão feitas inteiramente por meio de código. \
\
 A estratégia implementada será de Reversão a Média.\
\
 Membros do Grupo: \
 Pedro Vieira Maciel Cardozo Losch - 2311109\
 João Pedro Araújo Valente - 2320477\
 Arthur Guedes Adler - 2012442\
 Bernardo Vergueiro de Andrade - 2211803\
 Victor Carvalho Silva - 2320318\
 Ana Raya Lobo Paiva - 2320593\
 \
 Instrucoes sobre o comportamento do codigo:\
 \
 i) Importar os pacotes que serao utilizados.\
  Pacotes adicionados ao longo do codigo devem ser colocados no inicio, na parte #Pacotes.\
  De preferencia, comentar para que cada pacote serve\
 \
 ii) Informacoes dos ativos serao retiradas da API do Yahoo Finance via tidyquant::tq_get('acoes', ...)\
Serao utilizados dados de 2013-01-01 ate 2023-12-31 tq_get('acao', from = '2013-01-01', to = '2023-12-31')\
\
iii) Implementar a estrategia nos ativos e modelar os resultados\
\
iv) Realizar os backtests e analizar os resultados\
Sera utilizado como benchamark para os backtests o IBOV: tq_get('^BVSP',...)\
\
v) Realizar as plotagens\
\
CHECKLIST --------------------------------------------------------------------------\
\
i) Dados (V)\
ii) IBOV (V)\
iii) Preparar os dados para modelagem (V)\
iv) Modelagem (X)\
v) Backtest (X)\
vi) Plot (X)\
vii) Analise dos resultados e relatorio (X)
