
install.packages("nycflights13")
library(nycflights13)

fp <- flights %>% filter(arr_time==830) %>%  left_join(planes %>% select(model), by="tailnum")
View(fp)

flights %>% filter(dest == "SEA") %>% select(tailnum) %>%
  left_join(planes %>% select(tailnum, manufacturer)) %>%
  count(manufacturer) %>% # Count observations by manufacturer
  arrange(desc(n))
