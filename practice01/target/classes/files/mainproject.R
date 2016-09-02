Sys.setenv(JAVA_HOME='C:\\Program Files (x86)\\Java\\jdk1.8.0_92')
.libPaths('C:/Users/dohyung/Documents/R/win-library/3.3')
outDir<-"C:\\Users\\dohyung\\workspace\\Spring_Works\\MainP\\src\\main\\webapp\\resources\\files\\"
fileToRead<- paste(outDir,"rStat.txt",sep='/')
readWork<-read.csv(fileToRead)
readWork<-readWork[,-15]


fileDir<-"C:\\Users\\dohyung\\workspace\\Spring_Works\\MainP\\src\\main\\webapp\\resources\\files\\statResult"
library(randomForest)
library(rpart)
TotalProfit<-readWork$TOTAL_AMOUNT
TotalProfit[readWork$TOTAL_AMOUNT<50000]<-'profit less than 50000'
TotalProfit[readWork$TOTAL_AMOUNT>=50000 & readWork$TOTAL_AMOUNT<100000]<-'50000<profit<100000'
TotalProfit[readWork$TOTAL_AMOUNT>=100000 & readWork$TOTAL_AMOUNT<200000]<-'100000<profit<200000'
TotalProfit[readWork$TOTAL_AMOUNT>=200000 & readWork$TOTAL_AMOUNT<500000]<-'200000<profit<500000'
TotalProfit[readWork$TOTAL_AMOUNT>=500000]<-'profit more than 500000'
TotalProfit<-factor(TotalProfit)
readWork$TOTAL_PROFIT<-TotalProfit
lmWork<-readWork
colnames(lmWork)
readWork<-subset(readWork,select=-c(TOTAL_AMOUNT))
colnames(readWork)
length(readWork)
dataset<-readWork
library(e1071)
library(caret)
# Default parameter
control <- trainControl(method="repeatedcv", number=10, repeats=3)
seed <- 7
metric <- "Accuracy"
set.seed(seed)
mtry <- sqrt(ncol(x))
tunegrid <- expand.grid(.mtry=mtry)
rf_default <- train(TOTAL_PROFIT~., data=dataset, method="rf", metric=metric, tuneGrid=tunegrid, trControl=control)
print(rf_default)
# initial data set :  default accuracy = 64%
#tune randomforest using tuneRF()
set.seed(seed)
colnames(dataset)
dataset<-subset(dataset,select=-c(ID))
length(dataset)
x<-dataset[,1:12]
y<-dataset[,13]
bestmtry <- tuneRF(x, y, stepFactor=1.5, improve=1e-5, ntree=800)
bestmtry<-as.data.frame(bestmtry)
minVal<-min(bestmtry$OOBError)
chosenValue<-bestmtry$mtry[bestmtry$OOBError==minVal]
rffit<- randomForest(TOTAL_PROFIT~.,data=dataset,importance=TRUE,ntree=800,mtry=chosenValue)
rffit
set.seed(200)
fileText<-paste(fileDir,'rfResult.txt',sep='/')

sink(file = fileText)
print(bestmtry)
print(rffit)
sink()
library(party)
cfit<-cforest(as.factor(TOTAL_PROFIT) ~ .,data=readWork,controls=cforest_unbiased(ntree=800, mtry=3))
pt <- party:::prettytree(cfit @ ensemble[[1]], names(cfit @ data@get('input')))
pt
nt <- new('BinaryTree')
nt @ tree <- pt
nt @ data <- cfit @ data
nt @ responses <- cfit @ responses
nt
plot(nt)
fileGraph<-paste(fileDir,'myGraph.jpeg',sep = '/')
jpeg(filename = fileGraph,600,500)
print(plot(nt))
dev.off()
fileGraph<-paste(fileDir,'varImp.jpeg',sep='/')
jpeg(filename = fileGraph,600,500)
vp<-varImpPlot(rffit)
dev.off()
fileGraph<-paste(fileDir,'partialPlot.jpeg',sep='/')
jpeg(filename=fileGraph,1000,800)
par(mfrow = c(3, 5), mar = c(2, 2, 2, 2), pty = 's');
for (i in 1:(ncol(readWork) - 1)){partialPlot(rffit, readWork, names(readWork)[i], xlab = names(readWork)[i],main = NULL);}
dev.off()
imp <- varimp(cfit)
imp
impDF<-data.frame(imp)
impVar<-rownames(impDF)[order(impDF, decreasing=TRUE)[1:3]]
var1<-as.character(impVar[1])
var3<-as.character(impVar[3])
var2<-as.character(impVar[2])
lmWork$varr1<-lmWork[which(colnames(lmWork)==var1)]
lmWork$varr2<-lmWork[which(colnames(lmWork)==var2)]
lmWork$varr3<-lmWork[which(colnames(lmWork)==var3)]
lmWork$varr1<-unlist(lmWork$varr1)
lmWork$varr2<-unlist(lmWork$varr2)
lmWork$varr3<-unlist(lmWork$varr3)
lmfit<-lm(TOTAL_AMOUNT/10000~varr1+varr2+varr3,data=lmWork)
fileGraph<-paste(fileDir,'multipleRegression.jpeg',sep='/')
jpeg(filename=fileGraph,1000,800)
layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page 
plot(lmfit)
dev.off()
fileText<-paste(fileDir,'lmResult.txt',sep='/')
sink(file = fileText)
print(summary(lmfit))
sink()
library(ggplot2)
coupon_received<-readWork$COUPON_RECEIVED_COUNT
coupon_received[readWork$COUPON_RECEIVED_COUNT<=5]<-'less than 5'
coupon_received[readWork$COUPON_RECEIVED_COUNT>5 & readWork$COUPON_RECEIVED_COUNT<=10]<-'between 5 to 10'
coupon_received[readWork$COUPON_RECEIVED_COUNT>10 & readWork$COUPON_RECEIVED_COUNT<=30]<-'between 10 to 30'
coupon_received[readWork$COUPON_RECEIVED_COUNT>30]<- 'more than 30'
coupon_received<-factor(coupon_received)
fileGraph<-paste(fileDir,'couponPlot.jpeg',sep = '/')
couponPlot<-qplot(lmWork$COUPON_USED_COUNT,lmWork$TOTAL_AMOUNT,color=coupon_received)+xlab('coupon used')+ylab('total profit')+geom_smooth(method = 'lm')
jpeg(filename = fileGraph,width = 600,height=600)
print(couponPlot)
dev.off() 
graphics.off()
rm(list=ls())
