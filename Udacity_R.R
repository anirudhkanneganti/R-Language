
mtcars
mean(mtcars$cyl)
getwd()
setwd("C:/Users/Q836048/Documents")
rm(gp)
statesInfo<-read.csv('stateData.csv')
subset(statesInfo,state.region==1)
statesInfo[statesInfo$state.region==1,]
install.packages('rmarkdown')
str(mtcars)
summary(mtcars)
efficient<-subset(mtcars,mpg>=23)
str(efficient)

subset(mtcars,mpg>=30 | hp<60)
reddit<-read.csv('reddit.csv')
install.packages("ggplot2")
library('ggplot2')
str(reddit)
qplot(reddit$age.range)
qplot(data = reddit,x= income.range)
qplot(ordered(reddit$age.range, levels = c("Under 18", "18-24", "25-34","35-44","45-54","55-64","65 or Above","NA"))
)
getwd()
setwd('~/R/data')
list.files()
pf<- read.csv("pseudo_facebook.tsv",sep = '\t')
head(pf)
library(ggplot2)
qplot(x=dob_day,data=pf)+
  scale_x_continuous(breaks=1:31)+
  facet_grid(gender~dob_month)

ggplot(data = pf, aes(x = dob_day)) + 
  geom_histogram(binwidth = 1) + 
  scale_x_continuous(breaks = 1:31) + 
  facet_wrap(~dob_month)

library(reshape2)
version
str(tips)

sp <- ggplot(tips, aes(x=total_bill, y=tip/total_bill)) + 
  geom_point(shape=1)
sp
sp + facet_grid(. ~ sex)

#modifying facet label

sp + facet_grid(sex ~ day) +
  theme(strip.text.x = element_text(size=10, angle=25,face = "bold"),
        strip.text.y = element_text(size=12, face="bold"),

                strip.background = element_rect(colour="red", fill="#CCCCFF"))


library(ggplot2)
qplot(x=friend_count,data=pf,xlim = c(0,1000)) +
 
  scale_x_continuous(limits = c(0,1000))+
  facet_grid(gender~dob_month)
qplot(x=friend_count,data=pf)+facet_wrap(~gender)
head(pf)
ggplot(aes(x = friend_count), data = subset(pf, !is.na(gender))) + 
  geom_histogram() + 
  scale_x_continuous(limits = c(0, 1000), breaks = seq(0, 1000, 50))+  
  facet_wrap(~gender)

table(pf$gender)
by(pf$friend_count,pf$gender,summary)

ggplot(aes(x = tenure), data = pf) + 
  geom_histogram(binwidth = 30, color = 'black', fill = '#099DD9')

ggplot(aes(x = tenure/365), data = pf) + 
  geom_histogram(binwidth = .5, color = 'black', fill = '#F79420')


ggplot(aes(x = tenure / 365), data = pf) + 
  geom_histogram(color = 'black', fill = '#4169E1') + 
  scale_x_continuous(breaks = seq(1, 7, 1), limits = c(0, 7)) + 
  xlab('Number of years using Facebook') + 
  ylab('Number of users in sample')

ggplot(aes(x = age), data = pf) + 
  geom_histogram(color = 'red', fill = '#4169E1',binwidth = 1) + 
  scale_x_continuous(breaks = seq(0, 120, 10), limits = c(0, 120)) 

Summary(pf) 
head(pf)
str(pf)
sp

install.packages('gridExtra') 
library(ggplot2)

summary(pf$friend_count)
summary(log10(pf$friend_count))


p<-qplot(x=friend_count,data=pf)+
  scale_x_continuous()
q<-qplot(x=friend_count,data=pf)+
  scale_x_log10()
r<-qplot(x=friend_count,data=pf)+
  scale_x_sqrt()
p
grid.arrange(p,q,r)

qplot(x=friend_count,data=subset(pf,!is.na(gender)),binwidth=10)+
  scale_x_continuous(lim=c(0,1000),breaks=seq(0,1000,50))+
  facet_wrap(~gender)

  qplot(x=www_likes,data=subset(pf, !is.na(gender)),
           color=gender)+
    scale_x_continuous()+

    ggplot(aes(x = www_likes), data = subset(pf, !is.na(gender))) + 
    geom_freqpoly(aes(color = gender)) + 
    scale_x_log10()
  
  by(pf$www_likes,pf$gender,sum)
  
  a<-qplot(x=gender,y=friend_count,data = subset(pf, !is.na(gender)),geom='boxplot')+
    coord_cartesian(ylim=c(0,250))
   
  b<-qplot(x=gender,y=friend_count,data = subset(pf, !is.na(gender)),geom='boxplot',ylim=c(0,250))

grid.arrange(a,b,ncol=2)

str(pf)

