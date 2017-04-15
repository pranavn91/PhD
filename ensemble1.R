train <- read.csv("D:/r/exp-link/train_new.csv")
train$Choice <- as.factor(train$Choice)

set.seed(998)
trainIndex <- createDataPartition(train$Choice, p=.8, list = FALSE, times =1)


inflTrain <- train[trainIndex,]
inflTest <- train[-trainIndex,]



levels(inflTrain$Choice) <- make.names(levels(factor(inflTrain$Choice)))

my_control <- trainControl(index=createResample(inflTrain$Choice,25), summaryFunction=twoClassSummary,method = "repeatedcv", number = 5, repeats = 5, savePredictions="final", classProbs=TRUE, allowParallel = TRUE)

set.seed(998)


nnGrid <- expand.grid(size = 22) 

gbmGrid <- expand.grid(interaction.depth = c(4,5), 
                        n.trees = c(100,110), 
                        shrinkage = c(0.1,0.2),
                        n.minobsinnode = c(10,20)) 

rfGrid <- expand.grid(.mtry=c(1:2))

library(caretEnsemble)
models <- caretList(Choice~., data=inflTrain, trControl=my_control, metric="ROC", tuneList=list(gbm=caretModelSpec(method="gbm",tuneGrid=data.frame(gbmGrid), preProcess = c("scale","center")),mlp=caretModelSpec(method="mlp", tuneGrid=data.frame(nnGrid), preProcess = c("scale","center"))), verbose = FALSE)
 
results<- resamples(models)
summary(results)
dotplot(results)

xyplot(results)

modelCor(results)
splom(results)

my_control1 <- trainControl(index=createResample(inflTrain$Choice,25), summaryFunction=twoClassSummary,method = "repeatedcv", number = 5, repeats = 5, savePredictions="final", classProbs=TRUE, allowParallel = TRUE)


greedy_ensemble <- caretEnsemble(
  models, 
  metric="ROC",
  trControl=my_control1)
summary(greedy_ensemble)


