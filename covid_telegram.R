
#reading data
ds1 <- read_csv("D:/Science/Academic Affairs/Covid Challenge Data/telegram_corona981_full.csv", locale = locale(encoding = "utf-8"),
                col_types = cols(
  textField= col_character(),
  views=col_number()
), na="")

#Select usefull variables
ds1_f<- ds1 %>% select(ownerName,mentionField,
                       hashtagField,textField_normal,time_jalali,views)
#Found a solotion for rename() problem in https://stackoverflow.com/questions/34275576
ds1_f<- rename_all(ds1_f, recode, mentionField="mention")

#The most viewed posts
most_view<- ds1_f %>% filter(views>100000) %>% arrange(desc(views))
