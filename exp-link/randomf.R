infltrain <- read.csv("D:/r/exp-link/train_new.csv")
infltrain$Choice <- as.factor(train$Choice)


fitControl <- trainControl(method = "repeatedcv", number = 5, repeats = 5, search = "random")


seed <- 7
metric <- "Accuracy"
set.seed(seed)
mtry <- sqrt(ncol(infltrain))
tunegrid <- expand.grid(.mtry=c(1:6))
rftree <- caret:::train(Choice~., verbose = FALSE, preProc = c("scale","center"), data=infltrain, method="rf", metric=metric, tuneGrid=tunegrid, trControl=fitControl)
 

trellis.par.set(caretTheme())

plot(rftree)


plot(rftree, metric="Kappa")

test <- read.csv("D:/r/exp-link/test_new.csv")

test1 <- preProcess(test, method = c("scale","center"))

test_pred <- predict(rftree, test, type="prob")
print(test_pred)

write.csv(test_pred, file = "test-rftree.csv")

#cross val

train <- read.csv("D:/r/exp-link/train.csv")
train$Choice <- as.factor(train$Choice)

library(caret)
set.seed(998)
trainIndex <- createDataPartition(train$Choice, p=.8, list = FALSE, times =1)


inflTrain <- train[trainIndex,]
inflTest <- train[-trainIndex,]

inflTest1 <- preProcess(inflTest , method = c("scale","center"))

inflTest11 <- predict(inflTest1, inflTest)

test_pred <- predict(rftree, inflTest11 , type="prob")

write.csv(test_pred, file = "test-rf.csv")

write.csv(inflTest, file = "test-rf2.csv")