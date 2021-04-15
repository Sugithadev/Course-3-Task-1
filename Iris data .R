library(readr) 
setwd('/Users/sugisuri/Documents/Data Analytics /Course 3 Task 1') 
#read csv file 
g <- file.choose()
df1 <-read.csv(g)
is.na(df1)
attributes(df1)
summary(df1) 
str(df1)
names(df1)
hist(df1$Species)
barplot(height=table(df1$Species))
plot(df1$Sepal.Length,df1$Sepal.Width)
qqnorm(df1$Sepal.Length)
df1$Species<- as.factor(df1$Species) 
df1$Species<- as.numeric(df1$Species) 
View(df1)
str(df1)
set.seed(123)
trainSize <- round(nrow(df1) * 0.2)
trainSize
trainingRowIndex1 <- sample(1:nrow(df1), 0.7*nrow(df1))  # row indices for training data
View(trainingRowIndex1)
trainSet <- df1[trainingRowIndex1, ]  # model training data
View(trainSet)
testSet  <- df1[-trainingRowIndex1, ]   # test data
View(testSet)
testSize <- nrow(df1) - trainSet
testSize
set.seed(405)
trainSet <- df1[trainingRowIndex1, ]  # model training data
View(trainSet)
testSet  <- df1[-trainingRowIndex1, ]   # test data
View(testSet)

LinearModel<- lm(Petal.Width ~ Petal.Length,trainSet)
summary(LinearModel)
prediction <- predict(LinearModel, testSet) 
View(prediction)
