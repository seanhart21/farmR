###import and clean data
library(tidyverse)
df <- readxl::read_xlsx("raw_data/Hart Farm Ag Log Excerpt.xlsx")
head(df)


## Get Dates from excel format.

df[,1]
tail(df[,1])

dates <- as.data.frame(df[,1])
dates <- as.numeric(dates[1:nrow(dates),])

library(lubridate)
as.Date('1899-12-30') + days(dates)
df$date <- as.Date('1899-12-30') + days(dates)
head(df)

## just get squirrels
squirrel.id <- which(df[3,1:56]=="Squirrel") #13

sq <- df %>% select(date, n = squirrel.id)
sq <- sq[4:nrow(sq),]

head(sq)
sq$n <- ifelse(is.na(sq$n), 0, as.numeric(sq$n))

head(sq)

ggplot(sq, aes(x=date,y=n)) + geom_point()+
  theme_classic()

## just get cardinals

card.id <- which(df[3,1:56]=="Cardinal") #13

cd <- df %>% select(date, n = card.id)
cd <- cd[4:nrow(cd),]

head(cd)
cd$n <- ifelse(is.na(cd$n), 0, as.numeric(cd$n))

head(cd)

ggplot(cd, aes(x=date,y=n)) + geom_point()+
  theme_classic()




