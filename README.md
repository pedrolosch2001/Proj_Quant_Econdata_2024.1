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
 \
 Instrucoes sobre o comportamento do codigo:\
 \
 i) Importar os pacotes que serao utilizados.\
  Pacotes adicionados ao longo do codigo devem ser colocados no inicio, na parte #Pacotes.\
  De preferencia, comentar para que cada pacote serve\
 \
 ii) Informacoes dos ativos serao retiradas da API do Yahoo Finance via tidyquant::tq_get('acoes', ...)\
Serao utilizados dados de 2019-01-01 ate 2023-12-31 tq_get('acao', from = '2019-01-01', to = '2023-12-31')\
\
iii) Implementar a estrategia nos ativos e modelar os resultados\
\
iv) Realizar os backtests e analizar os resultados\
Sera utilizado como benchamark para os backtests o IBOV: tq_get('^BVSP',...)\
\
v) Realizar as plotagens