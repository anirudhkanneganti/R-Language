
# this is a comment
X=5
Y=10
Z=20
ls()
rm(x)
rm(Y)

getwd()
setwd("C:/Users/Q836048/Documents/R")

install.packages("tidyverse")
library(tidyverse)


getwd()
setwd("C:/Users/Q836048/Documents/R/r4ds")

data()
data(package = .packages(all.available = TRUE))

help(qplot)
?qplot
??qplot


?mpg

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

summary(mpg)
str(mpg)
#CNTRL+L --> Clears the console


1.Identifiers can be a combination of letters, digits, period (.) and underscore (_).
2.It must start with a letter or a period. If it starts with a period, it cannot be followed by a digit.
3.Reserved words in R cannot be used as identifiers.

help("reserved")

Invalid

tot@l=5
5um
_fine=56, 
TRUE, 
.0ne 


valid

total="total"
Sum=98 
.fine.with.dot
this_is_acceptable
Number5
a=5
b=5L
class(a)
class(b)
class(5i)

class("hello")

install.packages
mpg
as_tibble(iris)
tbl_mpg<-as_tibble(mpg)
class(flights_df)
filter(mpg,cyl== 4)

system("java -version")

if(Sys.getenv("JAVA_HOME")!=""){
  Sys.setenv(JAVA_HOME="")
}
require(readxl)
library(nycflights13)
flights_df<-as.data.frame(flights)
flights_tbl<-flights
