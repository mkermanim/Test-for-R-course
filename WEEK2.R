# R Course Practice- Week 2

# Installing packages

install.packages("tidyverse")
library(tidyverse)
install.packages("dplyr")
library(dplyr)
library(ggplot2)

# Calling data
install.packages("gapminder")
library(gapminder)
str(gapminder) #Looking at data
China <- gapminder %>% filter(country=="China") # Filtering China data
plot(data=China, 
     lifeExp ~ year,
     pch=12) # Using basic plot 

ggplot(data = gapminder, aes(x=continent,y=lifeExp))+
  geom_point(position = position_jitter(width = 1, height = 2), aes(color=continent), pch=5, alpha=0.7)+
  theme_replace() #Using ggplot
ggplot(data = gapminder, aes(x = year, y = lifeExp, group = country)) +
  geom_line(alpha = 0.5, aes(color = "Country", size = "Country")) +
  geom_line(stat = "smooth", method = "loess",
            aes(group = continent, color = "Continent", size = "Continent"), alpha = 0.5) +
  facet_wrap(~ continent, nrow = 2) +
  scale_color_manual(name = "Life Exp. for:",
                     values = c("Country" = "black", "Continent" = "blue")) +
  scale_size_manual(name = "Life Exp. for:",
                    values = c("Country" = 0.25, "Continent" = 3)) +
  theme_minimal(base_size = 14) +
  ylab("Years") + xlab("") +
  ggtitle("Life Expectancy, 1952-2007", subtitle = "By continent and country") +
  theme(legend.position=c(0.75, 0.2), axis.text.x = element_text(angle = 45))
