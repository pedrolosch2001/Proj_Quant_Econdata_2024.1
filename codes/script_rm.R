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

nomes_ativos <- "https://br.tradingview.com/markets/stocks-brazil/market-movers-large-cap/" %>% 
  read_html() %>%   
  html_elements(".tickerName-GrtoTeat") %>% 
  html_text() %>%
  str_c(".SA")

ativos = tq_get(x = nomes_ativos,
                from = '2013-01-01',
                to = '2023-12-31')

ibov = tq_get(x = '^BVSP',
              from = '2013-01-01',
              to = '2023-12-31')

ativos %>% 
  dplyr::mutate(month = month(date),
                year = year(date),
                day = day(date)) %>% 
  group_by(symbol) %>% 
  filter(all(year >= 2013)) %>%
  ungroup()
  
  
  
  
  
  
  
  














