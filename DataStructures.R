


--vector-- # a collection of ordered homogeneous elements
a<-15
vec<-c(1,2,3,4,5)
vec1<-10:15
vec1[3]
vec[-3]
vec[1:3]
vec2<-c(vec,vec1)
length(vec2)
char_vec<-c("Hello","Hi","Wassup!")
bool_vec<-c(T,F,T,T,F)
#type conversion
single_Vec<-c(vec,char_vec,bool_vec)
vec2<-vec+vec1

vec^2


--matrix-- a vetor with two dimensional shape information
  
A<-matrix(c(1,2,4,6,7,9),nrow = 2,ncol = 3 ) 
t(A)
dim(A)
dim(t(vec))
A[1,3]
A[1,4]
A[1,]
A[,2]
B<-matrix(1:20,nrow = 7)
B[c(2,5),]
B*2
B**4
sqrt(B)
dim(B)
A+B

diag(3) 
nrow(B)
ncol(B)
C<-matrix(8:28,nrow = 7)
all(B==C)

D<-matrix(c(30,32,34,27,36,72,60,78,67,71,55,56,57,55,49),ncol=3)
colnames(D)<-c("Chicago","Dallas","Texas")
rownames(D)<-paste("4/",12:16,sep = '')

E<-matrix(c(32,32,44,27,36,72,80,78,67,91,55,51,47,95,59),ncol=3)
colnames(E)<-c("Michigan","Seattle","Boston")
rownames(E)<-paste("4",12:16,sep = '/')
cbind(D,E)

new_data<-matrix(c(35,45,55,56,67,85),nrow = 1)
rownames(new_data)<-"4/17"
colnames(new_data)<-c(colnames(D),colnames(E))
full_data<-rbind(cbind(D,E),new_data)
c(full_data)
min(full_data)
max(full_data)
range(full_data)
sd(full_data)
rowMeans(full_data)
colMeans(full_data)
apply(full_data,1,FUN = sd)
cor(A)
summary(full_data)


--array-- matrix with a dimensional attribute

x<-1:9
ax<-array(x)
attributes(ax)
ax<-array(x,dim = c(3,3))
 
x<-1:12 
ax<-array(x,dim = c(3,2,2))
ax[3,2,2]
dim(ax)<-c(3,4)

--list--ordered vector of different classes

nums<-1:4
strings<-matrix(c("a","b","c","d"),nrow = 2)
boos<-c(T,T,F,F,T)
l<-list(nums,strings,boos)
l[[3]][5]
l<-list("Num"=nums,"String"=strings,"Bool"=boos)
attributes(l)
names(l)
l$String
new_l<-c(l,"Date"=as.character(Sys.Date()))


--factor-- vector with categorical elements and level attribute
 gender<-factor(c("m","m","f","m","f"),levels = c("m","f")) 
 table(gender) 
 class(gender)
 levels(gender)
 
 f1 <- factor(letters)
 levels(f1) <- rev(levels(f1))
 f2 <- rev(factor(letters))
 f3 <- factor(letters, levels = rev(letters))
is.factor(A)
 
--DataFrame-- a list with posible heterogeneous vector elements of same length
  
cities<-c("Bangalore","Delhi","Mumbai")
population<-c(634535,345987,876543)
averageHigh<-c(24,2,18)
contAS<-c(T,T,T)
city.data<-data.frame(cities,population,averageHigh,contAS,stringsAsFactors = F)
class(city.data)
city.data[,2]
city.data$cities
summary(city.data)
str(city.data)
row.names.data.frame(city.data)
rownames(city.data)
colnames(city.data)
is.data.frame(city.data)

library(tidyverse)

class(mpg)

str(mpg)

