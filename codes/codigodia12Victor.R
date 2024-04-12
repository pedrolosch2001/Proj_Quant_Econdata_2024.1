install.packages("tidyquant")
library(tidyquant)
library(dplyr)
library(tidyverse)

ITU64_SA <- tq_get("ITUB4.SA",get = "stock.prices",complete_cases = TRUE)

install.packages("zoo")
library(zoo)
SMA("ITU64_SA",x=)

ITU64_SA$adjusted %>% SMA(n=7)

ITU64_SA <- ITU64_SA %>% mutate(SMA7=SMA(adjusted,n=7),SMA30=SMA(adjusted,n=30))
ggplot(ITU64_SA) +
  geom_point(aes(x=date, y=adjusted, color = 'adjusted')) +
  geom_line(aes(x=date,y=SMA7, color = 'media movel'))+
  geom_line(aes(x=date,y=SMA30, color = 'media movel2'))+
  theme_minimal()+
  xlim(as.Date("2020-01-01"),as.Date("2020-06-01"))


library(PerformanceAnalytics)
