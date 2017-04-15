train <- read.csv("D:/r/exp-link/train.csv")
train$Choice <- as.factor(train$Choice)

library(caret)

trainIndex <- createDataPartition(train$Choice, p=.8, list = FALSE, times =1)


inflTrain <- train[trainIndex,]
inflTest <- train[-trainIndex,]


#we now have 8:2 split of the data
fitControl <- trainControl(method = "repeatedcv", number = 5, repeats = 5)

set.seed(825)  #choose random number as seed.

nnGrid <- expand.grid (size = c(22,33,44)) 
nrow(nnGrid) #for the hidden nodes

nnFit <- caret:::train(Choice ~ ., data = inflTrain, method="mlp", trControl = fitControl, verbose = FALSE, preProc = c("scale","center"), tuneGrid = nnGrid)


trellis.par.set(caretTheme())

plot(nnFit)

plot(nnFit, metric = "Kappa")

test <- read.csv("D:/r/exp-link/test.csv")
test
test1 <- preProcess(test, method = c("scale","center"))

test_pred <- predict(nnFit, test, type="prob")
print(test_pred)

write.csv(test_pred, file = "test.csv")
nnFit


train <- read.csv("D:/r/exp-link/train.csv")
train$Choice <- as.factor(train$Choice)

library(caret)
set.seed(998)
trainIndex <- createDataPartition(train$Choice, p=.8, list = FALSE, times =1)


inflTrain <- train[trainIndex,]
inflTest <- train[-trainIndex,]


inflTest1 <- preProcess(inflTest , method = c("scale","center"))

inflTest11 <- predict(inflTest1, inflTest)

test_pred <- predict(nnFit, inflTest11 , type="prob")

write.csv(test_pred, file = "test-nn.csv")

write.csv(inflTest, file = "test-nn2.csv")




