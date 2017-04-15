train <- read.csv("D:/r/exp-link/train.csv", header = TRUE)

test <- read.csv("D:/r/exp-link/test.csv", header=TRUE)

 y = train[,1];
 
 train = as.matrix(train[,-1])
 
 test = as.matrix(test)
 
 
#each row is <1,A,B> which means <0,B,A>

 extradata = cbind(train[,12:22],train[,1:11])
 
 train = rbind(train,extradata)
 
 y=c(y,1-y)

 y<-as.factor(y)
 levels(y) <- make.names(levels(factor(y)))
 
 
 set.seed(1024)
 
 fitControl <- trainControl(index=createResample(inflTrain$Choice,25), summaryFunction=twoClassSummary, method = "repeatedcv", number = 5, repeats = 5, savePredictions=TRUE, classProbs=TRUE, allowParallel = TRUE)
 

 tunegrid <- expand.grid(nrounds=seq(1,30,10)*10, max_depth=seq(1,10,5)*10, eta=seq(0.1,1,0.5), gamma=c(1,3), colsample_bytree=seq(0.1,1,0.5), min_child_weight= c(1,3), subsample = seq(0.1,1,0.5))
 
 
xgbFit <- caret:::train(train, y, method="xgbTree", trControl = fitControl, verbose = FALSE, tuneGrid = tunegrid)


test <- read.csv("D:/r/exp-link/test.csv")

#test1 <- preProcess(test, method = c("scale","center"))

test_pred <- predict(xgbFit, test, type="prob")

result = data.frame(Id = 1:nrow(test), Choice = test_pred)

write.csv(result,'submission.csv',quote=FALSE,row.names=FALSE)
write.csv(test_pred, file = "test-xgb.csv")