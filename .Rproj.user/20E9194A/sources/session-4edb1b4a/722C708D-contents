# Pacotes ------------------------------------------------------

# Pacotes para manipulacao 
library(tidyverse)
library(scales)
library(tidyquant)
library(lubridate)
library(writexl)

# Pacotes para modelagem
library(PerformanceAnalytics)
library(xts)
library(forecast)

# Pacotes para dados
library(rbcb)
library(rb3)
library(ggthemes)
library(rvest) # webscraping
library(zoo)

# Baixando os dados ---------------------------------------------

## Acoes --------------------------------------------------------

# Partes do codigo estarao como comentados pois salvei os dfs em arquivos .rds para facilitar e nao precisar 
# realizar o processo todo do 0.
# arquivos .rds estarao todos salvos na pasta dados

# nomes_ativos <- "https://br.tradingview.com/markets/stocks-brazil/market-movers-large-cap/" %>% 
#   read_html() %>%   
#   html_elements(".tickerName-GrtoTeat") %>% 
#   html_text() %>%
#   str_c(".SA")
# 
# ativos = tq_get(x = nomes_ativos,
#                 from = '2013-01-01',
#                 to = '2023-12-31')
# 
# ibov = tq_get(x = '^BVSP',
#               from = '2013-01-01',
#               to = '2023-12-31')
# 
# ativos_filtrado = ativos %>% 
#   dplyr::mutate(month = month(date),
#                 year = year(date),
#                 day = day(date)) %>% 
#   dplyr::group_by(symbol) %>% 
#   dplyr::filter(all(year >= 2013)) %>%
#   dplyr::ungroup() %>% 
#   dplyr::select(-c(month, year, day)) %>% 
#   dplyr::mutate(date = make_date(year(date),
#                                  month(date),
#                                  day(date))) %>% 
#   dplyr::arrange(date) %>% 
#   dplyr::rename(acao = adjusted, ticker = symbol) %>% 
#   dplyr::select(ticker, date, acao)
# 
# ativos_modelagem = ativos_filtrado %>% 
#   tidyr::pivot_wider(names_from = ticker,
#                      values_from = acao)
# 
# 
# ibov_filtrado = ibov %>% dplyr::mutate(month = month(date),
#                        year = year(date),
#                        day = day(date)) %>% 
#   dplyr::group_by(symbol) %>% 
#   dplyr::filter(all(year >= 2013)) %>%
#   dplyr::ungroup() %>% 
#   dplyr::select(-c(month, year, day)) %>% 
#   dplyr::mutate(date = make_date(year(date),
#                                  month(date),
#                                  day(date))) %>% 
#   dplyr::arrange(date) %>% 
#   dplyr::rename(acao = adjusted, ticker = symbol) %>% 
#   dplyr::select(ticker, date, acao) %>% print()
# 
# ibov_pivot_wider = ibov_filtrado %>% 
#   tidyr::pivot_wider(names_from = ticker,
#                      values_from = acao)

# Salvando os dataframes trabalhados

unique(ativos_filtrado$ticker) # para ver os nomes dos ativos

# write_rds(ativos_filtrado, file.path(getwd(), 'data', 'ativos_filtrado.rds'))
# 
# write_rds(ativos_modelagem, file.path(getwd(), 'data', 'ativos_modelagem.rds'))
# 
# write_rds(ibov_filtrado, file.path(getwd(), 'data', 'ibov_filtrado.rds'))
# 
# write_rds(ibov_pivot_wider, file.path(getwd(), 'data', 'ibov_pivot_wider.rds'))

# Inicio da modelagem -----------------------------------------------------------------------
  
# A partir daqui estaremos usando os dataframes tratados para realizar a aplicacao 
# da estrategia.

ativos_filtrado = read_rds('data/ativos_filtrado.rds') %>% print()

ativos_modelagem = read_rds('data/ativos_modelagem.rds') %>% print()
  
ibov_filtrado = read_rds('data/ibov_filtrado.rds') %>% print()

ibov_pivot_wider = read_rds('data/ibov_pivot_wider.rds') %>% print()

View(ativos_filtrado)
View(ativos_filtrado)
View(ibov_filtrado)
View(ibov_pivot_wider)

unique(ativos_filtrado$ticker) # para ver os nomes dos ativos












