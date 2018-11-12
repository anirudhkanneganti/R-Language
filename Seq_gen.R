#  sequence & repeat

seq(1,10,.5)
seq(1,10,.1)
seq(10)
seq(1,10,by = pi)
seq(0,-10,0.5)
seq(0,-10,-0.5)
seq(5)==1:5
all(seq(5)==1:5)
rep(1,6)
rep(c(1,2),5)
rep(T,5)
rep("Hello",3)

# Random Numbers

runif(1,0,10)
runif(10,0,1)
runif(2,0,1)
set.seed(100)
sample(1:10,5)
sample(1:10,100)
sample(1:10,100,replace = T)
state.name
sample(state.name,10)
s<-sample(1:5,1000,replace=T,prob = c(.2,.2,.2,.2,.2))
table(s)
rnorm(1)
rnorm(1,mean = 0,sd = 100)
x<-rnorm(1000,0,100)
mean(x)
sd(x)

