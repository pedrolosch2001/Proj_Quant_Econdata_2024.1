install.packages("tidyverse")
library(tidyverse)
library(rvest)

ativos_trabalhados <- "https://br.tradingview.com/markets/stocks-brazil/market-movers-large-cap/" %>% 
read_html() %>%   
html_elements(".tickerName-GrtoTeat") %>% 
html_text() %>%
  str_c(".SA")

acao <- tq_get(x = ativos_trabalhados, from = "2010-01-01", to = "2020-12-31")
acao


