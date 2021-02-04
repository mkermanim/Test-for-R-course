#Libraries 
library(tibble)
library(dplyr)
library(gapminder)
library(tidyverse)
library(pander)
library(xlsx)
library(readr)  
library(tidyr)
library(ggplot2)
library(lubridate)
library(stringr)
library(nycflights13)
library(haven)

#For the case I wanted to install these packages
#This solotion is taken from https://socviz.co/ 
libs <- c("tibble","dplyr", "gapminder","tidyverse","pander","xlsx","readr","tidyr","ggplot2",
          "lubridate","stringr","nycflights13","haven")
install.packages(libs, repos = "http://cran.rstudio.com") 