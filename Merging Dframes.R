
install.packages("nycflights13")
library(nycflights13)

flights %>% left_join(planes)
View(planes)
