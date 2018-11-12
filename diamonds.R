library(tidyverse)
ggplot(diamonds, aes(carat, price)) + 
  geom_hex()
ggsave("diamonds.pdf")

write_csv(diamonds, "diamonds.csv")

vignette("tibble")

#tibble:it never changes the type of the inputs (e.g. it never converts strings to factors!), 
#it never changes the names of variables, 
#and it never creates row names

#tribble()- transposed tibble

nycflights13::flights %>% View()
diamonds %>% View()
bittu<-diamonds
tb<-as_tibble(mtcars)

# date_names_langs() --- to see the langaues present , parse into local of date parser

  library(readxl)
read_excel
iris %>% group_by(Species) %>% sum(Petal.Width)
table(iris$Species)
set.seed(9850)
gp<-runif(nrow(iris))
iris2<-iris[order(gp),]
head(iris2,10)

head(iris_features)

new_sample <- new_sample[1,4]=1.7


iris_features <- iris[1:4]
dist_eucl <- function(x1, x2) sqrt(sum((x1 - x2) ^ 2))
distances <- apply(iris_features, 1,
                     function(x) dist_eucl(x, new_sample))
distances_sorted <- sort(distances, index.return = T)

nn_5 <- iris[distances_sorted$ix[1:5],]

install.packages("pbkrtest")
library(tidyverse)

??caret

library("caret")
iris_numeric <- iris[1:4]
pp_unit <- preProcess(iris_numeric, method = c("range"))
iris_numeric_unit <- predict(pp_unit, iris_numeric)
pp_zscore <- preProcess(iris_numeric, method = c("center",
                                                   "scale"))
iris_numeric_zscore <- predict(pp_zscore, iris_numeric)
pp_boxcox <- preProcess(iris_numeric, method = c("BoxCox"))
iris_numeric_boxcox <- predict(pp_boxcox, iris_numeric)

install.packages("ggplot2")

library(tidyverse)
libra