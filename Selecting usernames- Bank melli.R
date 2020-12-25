library(dplyr)
library(tidyverse)
library(pander)
library(xlsx)

#reading comments file as a df 
dfcomms <- as.data.frame(data.table::fread(file = 'comments.csv'))

# selecting unique usernames 
uniqun <- dfcomms %>% select(username,count) %>%  distinct(username, .keep_all = T)

#making a random sample and saving it 
samplresult <- sample_n(uniqun,8)

#printing result as a pander table
samplresult  %>% pander(style="rmarkdown")

# exporting result as a excel file
write.xlsx(samplresult, 'result.xlsx')


