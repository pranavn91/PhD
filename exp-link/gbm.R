infltrain <- read.csv("D:/r/exp-link/train.csv")
infltrain$Choice <- as.factor(train$Choice)

library(caret)

#trainIndex <- createDataPartition(train$Choice, p=.8, list = FALSE, times =1)

#head(trainIndex)

inflTrain <- train[trainIndex,]
infinflTest <- train[trainIndex,]


#we now have 8:2 split of the data
fitControl <- trainControl(method = "repeatedcv", number = 5, repeats = 5)

set.seed(655)  #choose random number as seed.

gbmGrid <- expand.grid(interaction.depth = c(3:6), 
                        n.trees = (1:30)*10, 
                        shrinkage = seq(0.1,1,0.3),
                        n.minobsinnode = c(1,5,10,20)) 

nrow(gbmGrid) 

gbmFit <- caret:::train(Choice ~ ., data = inflTrain, method="gbm", trControl = fitControl, verbose = FALSE, preProc = c("scale","center"), tuneGrid = gbmGrid)


trellis.par.set(caretTheme())

plot(gbmFit)

plot(gbmFit, metric = "Kappa")
gbmFit


test <- read.csv("D:/r/exp-link/test.csv")
test
test1 <- preProcess(test, method = c("scale","center"))

test_pred <- predict(gbmFit, test, type="prob")
print(test_pred)

write.csv(test_pred, file = "test-gbm.csv")
