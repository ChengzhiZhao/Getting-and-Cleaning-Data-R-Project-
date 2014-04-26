Getting-and-Cleaning-Data-R-Project-
====================================

This is a project for Getting and Cleaning Data on Coursera, and the description on how to run run_analysis.R

Project 1. Calculate mean and standard deviation

1. Load Data set, create two variables
Train_X <- read.table("./data/X_train.txt",sep="",header=FALSE)
Train_Y <- read.table("./data/Y_train.txt",sep="",header=FALSE)

2. rename column in Train_Y to V0, append Train_X to Train_Y, add new variable called Train_mergedData
names(Train_Y) <- c("V0")
Train_mergedData <- append(Train_Y,Train_X)

3. Do the same thing for Test
Test_X <- read.table("./data/X_test.txt",sep="",header=FALSE)
Test_Y <- read.table("./data/Y_test.txt",sep="",header=FALSE)
names(Test_Y) <- c("V0")
Test_mergedData <- append(Test_Y,Test_X)

4. import library gtools and merge two data sets to a variable called Alldata
library(gtools) 
Alldata <- smartbind(Train_mergedData,Test_mergedData)

5. import library reshape and melt data into one columns
library(reshape)
mAlldata <- melt(Alldata,id = ("V0"))

6. rename each group
mAlldata$V0[mAlldata$V0 == 1 ] <- 'WALKING'
mAlldata$V0[mAlldata$V0 == 2 ] <- 'WALKING_UPSTAIRS'
mAlldata$V0[mAlldata$V0 == 3 ] <- 'WALKING_DOWNSTAIRS'
mAlldata$V0[mAlldata$V0 == 4 ] <- 'SITTING'
mAlldata$V0[mAlldata$V0 == 5 ] <- 'STANDING'
mAlldata$V0[mAlldata$V0 == 6 ] <- 'LAYING'

7. calculat mean and sd
tapply(mAlldata$value,mAlldata$V0,mean)
tapply(mAlldata$value,mAlldata$V0,sd)



Project 2. Calculate mean

1. As project 1, load data x,y,subject

    Train_X <- read.table("./data/X_train.txt",sep="",header=FALSE)
    Train_Y <- read.table("./data/Y_train.txt",sep="",header=FALSE)
    Train_Subject <- read.table("./data/subject_train.txt",sep="",header=FALSE)
    names(Train_Subject) <- c("VV")
    names(Train_Y) <- c("V0")
    Train_mergedData <- append(append(Train_Y,Train_Subject),Train_X)
    
    Test_X <- read.table("./data/X_test.txt",sep="",header=FALSE)
    Test_Y <- read.table("./data/Y_test.txt",sep="",header=FALSE)
    Test_Subject <- read.table("./data/subject_test.txt",sep="",header=FALSE)
    names(Test_Subject) <- c("VV")
    names(Test_Y) <- c("V0")
    Test_mergedData <- append(append(Test_Y,Test_Subject),Test_X)

2. import library gtools and merge two data sets
library(gtools) 
Alldata <- smartbind(Train_mergedData,Test_mergedData)


3. import library reshape and melt data into one columns by id V0,VV
library(reshape)
mAlldata <- melt(Alldata,id = c("V0","VV"))

4. rename each group
mAlldata$V0[mAlldata$V0 == 1 ] <- 'WALKING'
mAlldata$V0[mAlldata$V0 == 2 ] <- 'WALKING_UPSTAIRS'
mAlldata$V0[mAlldata$V0 == 3 ] <- 'WALKING_DOWNSTAIRS'
mAlldata$V0[mAlldata$V0 == 4 ] <- 'SITTING'
mAlldata$V0[mAlldata$V0 == 5 ] <- 'STANDING'
mAlldata$V0[mAlldata$V0 == 6 ] <- 'LAYING'

5. calculat mean 
tapply(mAlldata$value,list(mAlldata$V0,mAlldata$VV),mean)

