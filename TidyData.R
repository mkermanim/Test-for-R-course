install.packages("tidyr")
library(tidyr)

billboard_2000_raw <- read_csv(file = "https://clanfear.github.io/CSSS508/Lectures/Week5/data/billboard.csv")


bb_types <- paste(c("icccD", rep("i", 76)), collapse="") #<<

billboard_2000_raw <- 
  read_csv(file = "https://clanfear.github.io/CSSS508/Lectures/Week5/data/billboard.csv",
           col_types = bb_types) #<<

billboard_2000 <- billboard_2000_raw %>%
  pivot_longer (starts_with("wk"),
               names_to ="week",
               values_to = "rank",
               values_drop_na = TRUE,
               names_prefix = "wk")

#another way
#billboard_2000 <- billboard_2000 %>% 
 # mutate(week=parse_number(week))

billboard_2000 <- billboard_2000 %>% 
  separate(time, into = c("min", "sec"),
           sep = ":", convert = TRUE) %>% 
  mutate(lenght= min + sec/60) %>% 
  select(-min,-sec)

  summary(billboard_2000$lenght)
  
  billboard_2000 <- billboard_2000 %>%
    group_by(artist, track) %>%
    mutate(`Weeks at #1` = sum(rank == 1),
           `Peak Rank` = ifelse(any(rank == 1),
                                "Hit #1",
                                "Didn't #1"))  

  billboard_trajectories <- 
    ggplot(data = billboard_2000,
           aes(x = week, y = rank, group = track,
               color = `Peak Rank`)
    ) +
    geom_line(aes(size = `Peak Rank`), alpha = 0.4) +
    # rescale time: early weeks more important
    scale_x_log10(breaks = seq(0, 70, 10)) + 
    scale_y_reverse() + # want rank 1 on top, not bottom
    theme_classic() +
    xlab("Week") + ylab("Rank") +
    scale_color_manual(values = c("black", "red")) +
    scale_size_manual(values = c(0.25, 1)) +
    theme(legend.position = c(0.90, 0.25),
          legend.background = element_rect(fill="transparent"))
  
  billboard_trajectories
  
######
  spd_raw <- read_csv("https://clanfear.github.io/CSSS508/Seattle_Police_Department_911_Incident_Response.csv")
glimpse(spd_raw)  
