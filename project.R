rm(list = ls())
set.seed(1234)
require(caret)
require(AppliedPredictiveModeling)
require(randomForest)
setwd("~/R/Coursera/8-Machine Learning")
url_train<-"https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv"
url_test<-"https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv"
download.file(url_train, "training.csv")
download.file(url_test, "testing.csv")
training<-read.csv("training.csv", header=TRUE, na.strings = c("NA", ""))
training <- training[, colSums(is.na(training)) == 0]

testing<-read.csv("testing.csv", header=TRUE, na.strings = c("NA", ""))
testing<-testing[, colSums(is.na(testing))==0]

inTrain<-createDataPartition(training$classe, p=3/4, list=FALSE)
training1<-training[inTrain, ]
training2<-training[-inTrain,]

mod_lm<-train(classe~., method="rf", data = training1)
