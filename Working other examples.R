#Working other examples
library(tibble)
library(dplyr)
library(gapminder)




df <- tibble(
  x = sample(10, 100, rep = TRUE),
  y = sample(10, 100, rep = TRUE)
)
nrow(df)
nrow(distinct(df))
nrow(distinct(df, x, y))

lm_pop_year <- gapminder %>%
  filter(continent == "Americas") %>%
  lm(pop ~ year, data = .)
lm_pop_year


former_yugoslavia <- c("Bosnia and Herzegovina", "Croatia",
                       "Montenegro", "Serbia", "Slovenia")
yugoslavia <- gapminder %>% filter(country %in% former_yugoslavia) 
tail(yugoslavia, 2)

set.seed(500)
yugoslavia %>% sample_n(size = 6, replace = FALSE)

example <- c(1, 0, "asdg", -2)
ifelse(example > 0, "Positive", "Not Positive")

yugoslavia %>% arrange(desc(year), pop)


yugoslavia %>%
  filter(year == 1982) %>%
  summarize()
            