#Load packages
library(caret)
library(dplyr)
library(MLmetrics)

#Load datasets
train = read.csv(file ='sampled_training.csv.gz')
test = read.csv(file='sampled_test.csv.gz')

table(train$Label)
table(test$Label)



vars = colnames(test)[grepl('feat',colnames(train))]
vars = c('Label',vars)

train = train[,vars]
test = test[,vars]

fitControl <- trainControl(## 10-fold CV
  method = "repeatedcv",
  number = 2,
  ## repeated ten times
  repeats = 2)


set.seed(825)
gbmFit1 <- train(Label ~ ., data = train, 
                 method = "gbm", 
                 trControl = fitControl,
                 ## This last option is actually one
                 ## for gbm() that passes through
                 verbose = FALSE)
gbmFit1

