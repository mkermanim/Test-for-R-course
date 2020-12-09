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

ggplot(gapminder, aes(x=))
