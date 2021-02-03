
# reading dataset 
tel_test_data<-read_sav("C:/Users/Hossein/Documents/MEGA/Papers/Completed Works/ML Project/Social Media Lit in Telegram/Data/ML Data.sav")

tel_test_data<- tel_test_data(na.rm=TRUE)
inc_city<- tel_test_data %>% group_by(City) %>% 
    summarize(incmean=mean(Income, na.rm=TRUE), N=n()) #%>% pander()
inc_city %>% rename_all (recode, incmean="MeanIncome") %>% arrange(desc(MeanIncome),desc(N))
inc_city %>%  ggplot(aes(x=incmean, y=N))+ 
  geom_point(pch=10, color="red")+theme_classic()

(tel_test_data %>% transmute(test=mean(EngagementinGs_1)+var(FakeNewsReaction2_1)))
mean(!is.na(tel_test_data$EngagementinGs_1))

a_2_var<-tel_test_data %>% group_by(Gender_1) %>% summarise(sdd=sd(EngagementinGs_1),
                                                   minn=min(FakeNewsKnowledge_1),
                                                   N=n())
a_2_var %>% ggplot(aes(sdd,minn), size=N)+geom_point()
