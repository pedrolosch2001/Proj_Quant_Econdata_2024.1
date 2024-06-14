options(scipen = 999)
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
ativos_lista = ativos_filtrado %>% 
  split(f = .$ticker) %>% 
  keep(function(x){
    x$date %>% head(1) == "2013-01-02"
  }) 

ativos_lista = ativos_lista %>% 
  map(function(x){
    x %>% 
      mutate(SMA7 = TTR::SMA(acao, n = 7),
             SMA15 = TTR::SMA(acao, n = 15)) %>% 
      na.omit() %>% 
      mutate(posicao = case_when(lag(SMA7) > lag(SMA15) ~ 1,
                                 lag(SMA7) < lag(SMA15) ~ -1,
                                 lag(SMA7) == lag(SMA15) ~ 0), 
             retorno = case_when(posicao == 1 ~ acao/lag(acao) - 1,
                                 posicao == 0 ~ NA,
                                 posicao == -1 ~ lag(acao)/acao - 1)) %>% 
      na.omit()
  })

funcmax<-function(n1,n2){
  
  lista = ativos_lista %>% 
    map(function(x){
      x %>% 
        mutate(SMA7 = TTR::SMA(acao, n = n1),
               SMA15 = TTR::SMA(acao, n = n2)) %>% 
        na.omit() %>% 
        mutate(posicao = case_when(lag(SMA7) > lag(SMA15) ~ 1,
                                   lag(SMA7) < lag(SMA15) ~ -1,
                                   lag(SMA7) == lag(SMA15) ~ 0), 
               retorno = case_when(posicao == 1 ~ acao/lag(acao) - 1,
                                   posicao == 0 ~ NA,
                                   posicao == -1 ~ lag(acao)/acao - 1)) %>% 
        na.omit()
    })
  
  carteira<-lista %>% 
    bind_rows() %>% 
    select(ticker, date, retorno) %>% 
    pivot_wider(names_from = "ticker", values_from = "retorno") %>% 
    mutate(portfolio=rowMeans(.[-1],na.rm=T))
  
  prod(carteira$portfolio+1)-1
  
}
funcmax(20,35)

df_janelas<-data.frame(sma_menor=sample(10:50,size=10^6,replace=T),
                       sma_maior=sample(10:50,size=10^6,replace=T)) %>%
  filter(sma_menor<sma_maior) %>% 
  unique()


# Separando Dfs para Teste e Backtest

ativos_treino = ativos_lista %>% 
  map(~.x %>%  filter(date < "2020-01-01"))

ativos_teste = ativos_lista %>% 
  map(~.x %>%  filter(date >= "2020-01-01"))


# Fazendo o treino

funcmaxTREINO<-function(n1,n2){
  
  lista = ativos_treino %>% 
    map(function(x){
      x %>% 
        mutate(SMA7 = TTR::SMA(acao, n = n1),
               SMA15 = TTR::SMA(acao, n = n2)) %>% 
        na.omit() %>% 
        mutate(posicao = case_when(lag(SMA7) > lag(SMA15) ~ 1,
                                   lag(SMA7) < lag(SMA15) ~ -1,
                                   lag(SMA7) == lag(SMA15) ~ 0), 
               retorno = case_when(posicao == 1 ~ acao/lag(acao) - 1,
                                   posicao == 0 ~ NA,
                                   posicao == -1 ~ lag(acao)/acao - 1)) %>% 
        na.omit()
    })
  
  carteira<-lista %>% 
    bind_rows() %>% 
    select(ticker, date, retorno) %>% 
    pivot_wider(names_from = "ticker", values_from = "retorno") %>% 
    mutate(portfolio=rowMeans(.[-1],na.rm=T))
  
  prod(carteira$portfolio+1)-1
  
}
ALGO<-funcmaxTREINO(10,20)


df_janelas <- df_janelas %>% 
  mutate(retorno = mapply(funcmaxTREINO, sma_menor, sma_maior))

df_janelas <- df_janelas %>% 
  mutate(retornoanual=((retorno+1)^(1/6)-1))

#df_janelas$retorno =  mapply(funcmax, df_janelas$sma_menor, df_janelas$sma_maior)
max(df_janelas$retorno)
janelasmax <- df_janelas %>% 
  filter(retorno==max(df_janelas$retorno))


#retorno da teste
funcmaxTESTE<-function(n1,n2){
  
  lista = ativos_teste %>% 
    map(function(x){
      x %>% 
        mutate(SMA7 = TTR::SMA(acao, n = n1),
               SMA15 = TTR::SMA(acao, n = n2)) %>% 
        na.omit() %>% 
        mutate(posicao = case_when(lag(SMA7) > lag(SMA15) ~ 1,
                                   lag(SMA7) < lag(SMA15) ~ -1,
                                   lag(SMA7) == lag(SMA15) ~ 0), 
               retorno = case_when(posicao == 1 ~ acao/lag(acao) - 1,
                                   posicao == 0 ~ NA,
                                   posicao == -1 ~ lag(acao)/acao - 1)) %>% 
        na.omit()
    })
  
  carteira<-lista %>% 
    bind_rows() %>% 
    select(ticker, date, retorno) %>% 
    pivot_wider(names_from = "ticker", values_from = "retorno") %>% 
    mutate(portfolio=rowMeans(.[-1],na.rm=T))
  
  prod(carteira$portfolio+1)-1
  
}

retteste<-funcmaxTESTE(20,24)

retornoanualteste=((retteste+1)^(1/3)-1)


funcretorno<-function(n1,n2){
  
  lista = ativos_teste %>% 
    map(function(x){
      x %>% 
        mutate(SMA7 = TTR::SMA(acao, n = n1),
               SMA15 = TTR::SMA(acao, n = n2)) %>% 
        na.omit() %>% 
        mutate(posicao = case_when(lag(SMA7) > lag(SMA15) ~ 1,
                                   lag(SMA7) < lag(SMA15) ~ -1,
                                   lag(SMA7) == lag(SMA15) ~ 0), 
               retorno = case_when(posicao == 1 ~ acao/lag(acao) - 1,
                                   posicao == 0 ~ NA,
                                   posicao == -1 ~ lag(acao)/acao - 1)) %>% 
        na.omit()
    })
  
  carteira<-lista %>% 
    bind_rows() %>% 
    select(ticker, date, retorno) %>% 
    pivot_wider(names_from = "ticker", values_from = "retorno") %>% 
    mutate(portifolio=rowMeans(.[-1],na.rm=T))
  
  return(carteira %>% select(date,portifolio))
  
}

df_backtest<-funcretorno(20,24)


df_backtest %>% 
  as.xts() %>% 
  chart.CumReturns()

#as,xts é necessário para a função
Return.annualized(df_backtest %>% as.xts())

#PegandoCDI
cdi<-read.csv2("CDI.csv")

ibov_pivot_wider %>% 

df_backtest <- df_backtest %>% 
  left_join(ibov_pivot_wider) %>% 
  rename(ibov=`^BVSP`)

