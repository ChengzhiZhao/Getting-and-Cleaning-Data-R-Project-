#Project No.1
#Read Data from Train_X, Train_Y
Train_X <- read.table("./data/X_train.txt",sep="",header=FALSE)
Train_Y <- read.table("./data/Y_train.txt",sep="",header=FALSE)
names(Train_Y) <- c("V0")
Train_mergedData <- append(Train_Y,Train_X)

#Read Data from Test_X,Test_Y
Test_X <- read.table("./data/X_test.txt",sep="",header=FALSE)
Test_Y <- read.table("./data/Y_test.txt",sep="",header=FALSE)
names(Test_Y) <- c("V0")
Test_mergedData <- append(Test_Y,Test_X)

#import library gtools and merge two data set
library(gtools) 
Alldata <- smartbind(Train_mergedData,Test_mergedData)

#import library reshape and melt data into one columns
library(reshape)
mAlldata <- melt(Alldata,id = ("V0"))

#rename each group
mAlldata$V0[mAlldata$V0 == 1 ] <- 'WALKING'
mAlldata$V0[mAlldata$V0 == 2 ] <- 'WALKING_UPSTAIRS'
mAlldata$V0[mAlldata$V0 == 3 ] <- 'WALKING_DOWNSTAIRS'
mAlldata$V0[mAlldata$V0 == 4 ] <- 'SITTING'
mAlldata$V0[mAlldata$V0 == 5 ] <- 'STANDING'
mAlldata$V0[mAlldata$V0 == 6 ] <- 'LAYING'

#calculat mean and sd
tapply(mAlldata$value,mAlldata$V0,mean)
tapply(mAlldata$value,mAlldata$V0,sd)


#Project No.2
#Read Data from Train_X, Train_Y, Train_Subject
Train_X <- read.table("./data/X_train.txt",sep="",header=FALSE)
Train_Y <- read.table("./data/Y_train.txt",sep="",header=FALSE)
Train_Subject <- read.table("./data/subject_train.txt",sep="",header=FALSE)
names(Train_Subject) <- c("VV")
names(Train_Y) <- c("V0")
Train_mergedData <- append(append(Train_Y,Train_Subject),Train_X)

#Read Data from Test_X,Test_Y, Test_Subject
Test_X <- read.table("./data/X_test.txt",sep="",header=FALSE)
Test_Y <- read.table("./data/Y_test.txt",sep="",header=FALSE)
Test_Subject <- read.table("./data/subject_test.txt",sep="",header=FALSE)
names(Test_Subject) <- c("VV")
names(Test_Y) <- c("V0")
Test_mergedData <- append(append(Test_Y,Test_Subject),Test_X)

#import library gtools and merge two data set
library(gtools) 
Alldata <- smartbind(Train_mergedData,Test_mergedData)

#import library reshape and melt data into one columns
library(reshape)
mAlldata <- melt(Alldata,id = c("V0","VV"))

#rename each group
mAlldata$V0[mAlldata$V0 == 1 ] <- 'WALKING'
mAlldata$V0[mAlldata$V0 == 2 ] <- 'WALKING_UPSTAIRS'
mAlldata$V0[mAlldata$V0 == 3 ] <- 'WALKING_DOWNSTAIRS'
mAlldata$V0[mAlldata$V0 == 4 ] <- 'SITTING'
mAlldata$V0[mAlldata$V0 == 5 ] <- 'STANDING'
mAlldata$V0[mAlldata$V0 == 6 ] <- 'LAYING'

#calculat mean 
tapply(mAlldata$value,list(mAlldata$V0,mAlldata$VV),mean)




