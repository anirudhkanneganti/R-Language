
install.packages('tidyverse')
library(tidyverse)
install.packages(c("nycflights13", "gapminder", "Lahman"))
library(nycflights13)
library(gapminder)
library(Lahman)
summary(flights)

?mpg
summary(mtcars)
str(mtcars)
ggplot(data = mpg,mapping = aes(x = class, y = drv)) + 
  geom_point()

library(tidyverse)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy,stroke=0.5))

str(mpg)

aesthetics:shape(supports only 6 shapes),size,color,alpha(tranparency),
stroke(marker size)

# facet_grid(~)- two variables
# facet_wrap(~)- one variable

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

# geom - geometrical object
# cheet sheet ggplot2
# multiple geoms in same sheet

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

# different aesthetics in different layers

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth()

# local arguments always over rides global arguments

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)
??ggplot2::geom_smooth

# se - confidence interval around a line
# linetype - seperate line with legend

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth(se = FALSE)

demo <- tribble(
  ~cut,         ~freq,
  "Fair",       1610,
  "Good",       4906,
  "Very Good",  12082,
  "Premium",    13791,
  "Ideal",      21551
)
str(diamonds)

ggplot(data = demo) +
  geom_bar(mapping = aes(x = cut, y = freq), stat = "identity")

??ggplot2::geom_bar


ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = ..prop.., group = 1))

ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )
ggplot(data = diamonds, mapping = aes(x = cut, color = clarity)) + 
  geom_bar( position = "identity")

# position- identity(in same place),fill(100% stacked bar),dodge(side by side bar)
# stack,nudge,jitter(noise addition)

# basic template

ggplot(data = <DATA>) + 
  <GEOM_FUNCTION>(
    mapping = aes(<MAPPINGS>),
    stat = <STAT>, 
    position = <POSITION>
  ) +
  <COORDINATE_FUNCTION> +
  <FACET_FUNCTION>
  
  # SHIFT + ALT + K --> all shortcuts
  
  library(nycflights13)
library(tidyverse)  

str(flights)

#Pick observations by their values (filter()).
#Reorder the rows (arrange()).
#Pick variables by their names (select()).
#Create new variables with functions of existing variables (mutate()).
#Collapse many values down to a single summary (summarise())

df <- tibble(x = c(1, NA, 3))
filter(df,x>1)
filter(flights, month == 1, day == 1)
arrange(flights, desc(dep_delay))
select(flights, contains("TIME"))
rename(flights,air_time=airtime)
flights

flights_sml <- select(flights, 
                      year:day, 
                      ends_with("delay"), 
                      distance, 
                      air_time
)
fligts_demo <- mutate(flights_sml,
       gain = arr_delay - dep_delay,
       speed = distance / air_time * 60
)

transmute()
lag()
lead()
cumsum(), cumprod(), cummin(), cummax()
min_rank()
row_number(), dense_rank(), percent_rank(), cume_dist(), ntile()
summarize()


summarise(flights, delay = mean(dep_delay, na.rm = TRUE))

by_day <- group_by(flights, year, month, day)
summarise(by_day, delay = mean(dep_delay, na.rm = TRUE))


delays <- flights %>% 
  group_by(dest) %>% 
  summarise(
    count = n(),
    dist = mean(distance, na.rm = TRUE),
    delay = mean(arr_delay, na.rm = TRUE)
  ) %>% 
  filter(count > 20, dest != "HNL")
# %>% pipe can be used to avoid intermediate variables
ggplot(data = delays, mapping = aes(x = dist, y = delay)) +
  geom_point(aes(size = count), alpha = 1/3) +
  geom_smooth(se=FALSE)

not_cancelled <- flights %>% 
  filter(!is.na(dep_delay), !is.na(arr_delay))

delays <- not_cancelled %>% 
  group_by(tailnum) %>% 
  summarise(
    delay = mean(arr_delay)
  )

delays <- not_cancelled %>% 
  group_by(tailnum) %>% 
  summarise(
    delay = mean(arr_delay, na.rm = TRUE),
    n = n()
  )

delays %>% 
  filter(n > 25) %>% 
  ggplot(mapping = aes(x = n, y = delay)) + 
  geom_point(alpha = 1/10)

batting <- as_tibble(Lahman::Batting)

batters <- batting %>% 
  group_by(playerID) %>% 
  summarise(
    ba = sum(H, na.rm = TRUE) / sum(AB, na.rm = TRUE),
    ab = sum(AB, na.rm = TRUE)
  )

batters %>% 
  filter(ab > 100) %>% 
  ggplot(mapping = aes(x = ab, y = ba)) +
  geom_point() + 
  geom_smooth(se = FALSE)
str(flights)
library(tidyverse)

ggplot()+
  geom_area(data=subset(economics,psavert>12.0),aes(date, unemploy))
str(mpg)

output<- filter(mpg,cyl==4| cyl==6) %>% group_by(cyl) %>% summarise(hml=max(hwy))

install.packages('xlsx')
library(xlsx)
?economics
str(economics)
head(economics)

read.xlsx("C:/Users/Q836048/Documents/SPOTFIRE/STUDY/Data/mlgraph.xlsx", 1)

input1<-read.csv("C:/Users/Q836048/Documents/SPOTFIRE/STUDY/Data/mgraph.csv", 1,dec='_')
str(input)

output <- filter(input, !(is.na(Result.Date))& Date.Category== 'Screening Date - String') %>% 
   summarise(C_Scr=max(Cum.Screened))

is.na(inputResult.Date)
filter(input,Date.Category== 'Screening Date - String'& Protocol.Number=='221AD301' ) %>%
  group_by(Date.Category,Result.Date)%>%
  summarise(max(Cum.Screened))

filter(input,Date.Category== 'Screening Date - String' ) %>%
  group_by(Date.Category,Result.Date)%>%
  summarise(mean(Cum.Screened,na.rm= TRUE))

op <- filter(input,Protocol.Number=='221AD301'& Result.Date!=' - ' ) %>%group_by(Date.Category,Result.Date,Result.Date...Date)%>%
  summarise(C_Scr=max(Cum.Screened),l_scr=max(Screened.Count),l_ran=max(Rand.Count),
            l_pd=max(PD.count))
str(output)

ggplot() + 
  geom_area(data=subset(op,Date.Category== 'Screening Date - String') ,mapping=aes(x=Result.Date...Date,y=C_Scr,alpha=0.9),color="lightblue",fill="lightblue")+
  geom_line(data=subset(output,Date.Category== 'Screening Date - String'),mapping=aes(x=Result.Date...Date,y=l_scr,alpha=0.9,group=F),color="red")+
  geom_line(data=subset(output,Date.Category== 'Randomization Date - String'),mapping=aes(x=Result.Date...Date,y=l_ran,alpha=0.9,group=F),color="green")+
  geom_line(data=subset(output,Date.Category== 'Occurred Date - String'),mapping=aes(x=Result.Date...Date,y=l_pd,alpha=0.9,group=F),color="violet")

?scale_x_datetime()

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))

  str(diamonds)
ggplot(diamonds,mapping = aes(carat,price))+
  geom_hex()



library(modelr)

mod <- lm(log(price) ~ log(carat), data = diamonds)

str(diamonds) <- diamonds %>% 
  add_residuals(mod) %>% 
  mutate(resid = exp(resid))

ggplot(data = diamonds) + 
  geom_point(mapping = aes(x = carat, y = resid))


getwd()






