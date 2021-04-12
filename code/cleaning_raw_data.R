###import and clean data
library(tidyverse)
df <- readxl::read_xlsx("raw_data/Hart Farm Ag Log Excerpt.xlsx")
head(df)
