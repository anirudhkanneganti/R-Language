#downloading Open Data

download.file("https://data.cityofnewyork.us/api/views/varh-9tsp/rows.csv?accessType=DOWNLOAD","test.csv")
getwd()
install.packages("RCurl")
library(RCurl)
A<- getURL("http://samplecsvs.s3.amazonaws.com/TechCrunchcontinentalUSA.csv")


#Reading a CSV File
Stock_Data<- read.table('test.csv',sep = ',',header = TRUE,fill=TRUE)
View(Stock_Data)
New_Data<-read.csv('test.csv')
View(New_Data)
read.
xlsx
read.xlsx("file.xlsx")

install.packages("xlsx")
library(xlsx)

iris

as.tibble(iris)
as.data.frame(mpg)

library(tidyverse)
 
class(iris)
class(mpg)
tibble(
  x = 1:5, 
  y = c(1,2,3,4,5), 
  z = x ^ 2 + y
)

df <- tibble(
  x = runif(5),
  y = rnorm(5)
)

df$x

df[["x"]]

df[[1]]

