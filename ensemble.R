
pred1 <- predict(gbmFit, inflTest11)

pred2 <- predict(nnFit, inflTest11)

pred3 <- predict(rftree, inflTest11)

predDF <- data.frame(pred1, pred2, pred3, Choice=inflTest11$Choice)

predDF$Choice <- as.factor(predDF$Choice)

combModFit <- caret:::train(Choice~., method="gam", data=predDF)

predMat <- data.frame(pred1, pred2, pred3)
write.csv(predMat, file = "pred.csv")

pred <- read.csv("C:/Users/Abc/Documents/pred.csv")

predCor <- cor(pred)
calcCorr <- findCorrelation(predCor, cutoff=.75)
#no correlation


#boosting

boosting_results <- resamples(list(nn=nnFit, gbm=gbmFit, rf=rftree))
summary(boosting_results)
dotplot(boosting_results)