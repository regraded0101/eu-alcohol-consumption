library(dplyr)
library(readr)
library(stringr)
library(janitor)

df_eu_wage <-
  read_csv('data/eu-average-wage.csv') %>%
  janitor::clean_names() %>%
  mutate(avg_wage = str_replace_all(x2022, "[^[:digit:]]", ""),
         avg_wage = str_sub(avg_wage, 1, nchar(avg_wage)-2),
         avg_wage = as.numeric(avg_wage)) %>%
  select(country, avg_wage)
