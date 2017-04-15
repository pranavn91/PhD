train <- read.csv("D:/r/exp-link/train_new.csv")
train$Choice <- as.factor(train$Choice)
levels(train$Choice) <- make.names(levels(factor(train$Choice)))


library(caret)

trainIndex <- createDataPartition(train$Choice, p=.8, list = FALSE, times =1)


inflTrain <- train[trainIndex,]
inflTest <- train[-trainIndex,]

my_control <- trainControl(index=createResample(inflTrain$Choice,25), summaryFunction=twoClassSummary,method = "repeatedcv", number = 5, repeats = 5, savePredictions="final", classProbs=TRUE, allowParallel = TRUE)


seed <- 7
metric <- "Accuracy"
set.seed(seed)
tunegrid <- expand.grid(.mtry=c(1:6))
rftree <- caret:::train(Choice~., verbose = FALSE, preProc = c("scale","center"), data=inflTrain, method="rf", metric=metric, tuneGrid=tunegrid, trControl=my_control)

#Predicting using random forest model
inflTest$pred_rf<-predict(object = rftree,inflTest)

#Checking the accuracy of the random forest model
confusionMatrix(inflTest$Choice,inflTest$pred_rf)




 

gbmGrid <- expand.grid(interaction.depth = c(4,5), 
                        n.trees = c(100,110), 
                        shrinkage = c(0.1,0.2),
                        n.minobsinnode = c(10,20)) 


seed <- 7
metric <- "Accuracy"
set.seed(seed)
gbmFit <- caret:::train(Choice ~ ., data = inflTrain, method="gbm", trControl = my_control, verbose = FALSE, preProc = c("scale","center"), metric=metric,, tuneGrid = gbmGrid)

#Predicting using random forest model
inflTest$pred_gbm<-predict(object = gbmFit,inflTest)

#Checking the accuracy of the random forest model
confusionMatrix(inflTest$Choice,inflTest$pred_gbm)






nnGrid <- expand.grid (size = c(22,33,44)) 

nnFit <- caret:::train(Choice ~ ., data = inflTrain, method="mlp", trControl = my_control, verbose = FALSE, preProc = c("scale","center"), tuneGrid = nnGrid)

#Predicting using random forest model
inflTest$pred_nn<-predict(object = nnFit,inflTest)

#Checking the accuracy of the random forest model
confusionMatrix(inflTest$Choice,inflTest$pred_nn)

inflTest$pred_nn_prob<-predict(object = nnFit, inflTest, type='prob')
inflTest$pred_gbm_prob<-predict(object = gbmFit, inflTest, type='prob')
inflTest$pred_rf_prob<-predict(object = rftree, inflTest, type='prob')



#Taking average of predictions all three
inflTest$pred_avg<-(inflTest$pred_rf_prob$X0+inflTest$pred_nn_prob$X0+inflTest$pred_gbm_prob$X0)/3

#avg of nn,rf
inflTest$pred_avg12<-(inflTest$pred_rf_prob$X0+inflTest$pred_nn_prob$X0)/2

#avg of gbm,rf
inflTest$pred_avg23<-(inflTest$pred_gbm_prob$X0+inflTest$pred_rf_prob$X0)/2

#avg of nn,gbm
inflTest$pred_avg13<-(inflTest$pred_nn_prob$X0+inflTest$pred_gbm_prob$X0)/2


#calculate threshold
library(pROC)

rocCurve <- roc(response = inflTest$Choice, predictor = inflTest$pred_avg, levels=rev(levels(inflTest$Choice)))
plot(rocCurve) #0.382, recall = 0.677, fallout=0.132
par(new = TRUE)
rocCurve1 <- roc(response = inflTest$Choice, predictor = inflTest$pred_avg12, levels=rev(levels(inflTest$Choice)))
plot(rocCurve1, col="red") #0.474, r=0.746, f=.228
par(new = TRUE)

rocCurve2 <- roc(response = inflTest$Choice, predictor = inflTest$pred_avg13, levels=rev(levels(inflTest$Choice)))
plot(rocCurve2, col="blue")#0.452, r=.732, f=.2
par(new = TRUE)

rocCurve3 <- roc(response = inflTest$Choice, predictor = inflTest$pred_avg23, levels=rev(levels(inflTest$Choice)))
plot(rocCurve3, col="green")#0.502, p=0.791, 0.224

#add legend
legend(0.4,0.4,c("nn+rf+gbm","rf+nn","nn+gbm","gbm+rf"),lty=c(1,1),col=c("black","red","blue","green"))

#Splitting into binary classes at threshold - avg all 3
inflTest$pred_avg<-as.factor(ifelse(inflTest$pred_avg>0.382,0,1))

inflTest$pred_avg12<-as.factor(ifelse(inflTest$pred_avg12>0.474,0,1))

inflTest$pred_avg13<-as.factor(ifelse(inflTest$pred_avg13>0.452,0,1))

inflTest$pred_avg23<-as.factor(ifelse(inflTest$pred_avg23>0.502,0,1))


#confusion matrix

confusionMatrix(inflTest$Choice,inflTest$pred_avg)

confusionMatrix(inflTest$Choice,inflTest$pred_avg12)

confusionMatrix(inflTest$Choice,inflTest$pred_avg13)

confusionMatrix(inflTest$Choice,inflTest$pred_avg23)


#


test <- read.csv("D:/r/exp-link/test-new.csv")

test1 <- preProcess(test, method = c("scale","center"))

testSet <- predict(test1,test)

testSet$pred_rf_prob<-predict(object = rftree, testSet  , type='prob')
testSet$pred_nn_prob<-predict(object = nnFit, testSet , type='prob')

#avg of gbm,rf
testSet$pred_avg<-(testSet$pred_nn_prob$X0+testSet$pred_rf_prob$X0)/2

write.csv(testSet$pred_avg, file = "sub8.csv")


