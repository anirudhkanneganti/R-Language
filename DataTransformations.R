library(nycflights13)
library(tidyverse)

nycflights13::flights
class(flights)

#Filter

filter(flights, month == 1, day == 1)
Jan1<-filter(flights, month == 1, day == 1)

filter(flights, month == 11 | month == 12)#using or operator
nov_dec <- filter(flights, month %in% c(11, 12))

filter(flights, !(arr_delay > 120 | dep_delay > 120))
filter(flights, arr_delay <= 120, dep_delay <= 120)

filter(flights, !(arr_delay > 120 & dep_delay <140))



#missing values

NA > 5
10 == NA
NA + 10
NA==NA
df <- tibble(x = c(1, NA, 3))
filter(df, x > 1)
filter(df, is.na(x) | x > 1)

#Arrange

arrange(flights, year, month, day)
arrange(flights, desc(day))

df <- tibble(x = c(5, 2, NA))
arrange(df, x)#missing values are always sorted at the end
arrange(df, desc(is.na(x)))

#select

select(flights, year, month, day)
select(flights, year:day)
select(flights, -(year:day))
select(flights, starts_with("a"))

ends_with("xyz")
contains("ijk")
matches("(.)\\1")
New_Data<-rename(flights,  tail_num = tailnum)
select(flights, time_hour, air_time, everything())

#mutate
#always adds new variables at the end

flights_sml <- select(flights, 
                      year:day, 
                      ends_with("delay"), 
                      distance, 
                      air_time)

mutate(flights_sml,
       gain = arr_delay - dep_delay,
       speed = distance / air_time * 60)

mutate(flights_sml,
       gain = arr_delay - dep_delay,
       hours = air_time / 60,
       gain_per_hour = gain / hours)

transmute(flights,
          gain = arr_delay - dep_delay,
          hours = air_time / 60,
          gain_per_hour = gain / hours)

#Summarise
summarise(flights, A = mean(dep_delay, na.rm = TRUE))

by_month <- group_by(flights, year, month)
summarise(by_month, delay = mean(dep_delay, na.rm = TRUE))


by_dest <- group_by(flights, dest)
delay <- summarise(by_dest,
                   count = n(),
                   dist = mean(distance, na.rm = TRUE),
                   delay = mean(arr_delay, na.rm = TRUE)
)
delay <- filter(delay, count > 20, dest != "HNL")

#Grouped Summaries
delays <- flights %>% group_by(dest) %>% 
  summarise(
    count = n(),
    dist = mean(distance, na.rm = TRUE),
    delay = mean(arr_delay, na.rm = TRUE)
  ) %>% 
  filter(count > 20, dest != "HNL")

not_cancelled <- flights %>% 
  filter(!is.na(dep_delay), !is.na(arr_delay))

not_cancelled %>% 
  group_by(year, month, day) %>% 
  summarise(mean = mean(dep_delay))

delays <- not_cancelled %>% 
  group_by(tailnum) %>% 
  summarise(
    delay = mean(arr_delay)
  )
not_cancelled %>% 
  group_by(year, month, day) %>% 
  summarise(
    avg_delay1 = mean(arr_delay),
    avg_delay2 = mean(arr_delay[arr_delay > 0]) # the average positive delay
  )

not_cancelled %>% 
  group_by(year, month, day) %>% 
  summarise(n_early = sum(dep_time < 500))

daily <- group_by(flights, year, month, day)
(per_day   <- summarise(daily, flights = n()))

per_month <- summarise(per_day, flights = sum(flights))
per_year  <- summarise(per_month, flights = sum(flights))

daily %>% 
  ungroup() %>%             
  summarise(flights = n())

flights%>% 
  filter(arr_delay > 0) %>% 
  mutate(prop_delay = arr_delay / sum(arr_delay)) %>% 
  select(year:day, dest, arr_delay, prop_delay)

table1
table2
table3
#rate per 10000
table1 %>% 
  mutate(rate = cases / population * 10000)
#Gather--Unpivot
table4a
table4a %>% gather(`1999`, `2000`, key = "year", value = "cases")

table4b
table4b %>% 
  gather(`1999`, `2000`, key = "year", value = "population")

tidy4a <- table4a %>% 
  gather(`1999`, `2000`, key = "year", value = "cases")
tidy4b <- table4b %>% 
  gather(`1999`, `2000`, key = "year", value = "population")
left_join(tidy4a, tidy4b)
inner_join(tidy4a,tidy4b)


#Spread -- Pivot

table2
spread(table2, key = type, value = count)

#Separate & Unite

table3 %>% 
  separate(rate, into = c("cases", "population"), sep = "/")

table3 %>% 
  separate(rate, into = c("cases", "population"), convert = TRUE)

table5 %>% 
  unite(new, century, year, sep = "_")

stocks <- tibble(
  year   = c(2015, 2015, 2015, 2015, 2016, 2016, 2016),
  qtr    = c(   1,    2,    3,    4,    2,    3,    4),
  return = c(1.88, 0.59, 0.35,   NA, 0.92, 0.17, 2.66)
)


stocks %>% 
  complete(year, qtr)

options(tibble.print_min=10)
mpg
