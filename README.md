Getting-and-Cleaning-Data-R-Project-
====================================

This is a project for Getting and Cleaning Data on Coursera, and the description on how to run run_analysis.R<br>

Project 1. Calculate mean and standard deviation<br>

1. Load Data set, create two variables<br>
Train_X <- read.table("./data/X_train.txt",sep="",header=FALSE)<br>
Train_Y <- read.table("./data/Y_train.txt",sep="",header=FALSE)<br>

2. rename column in Train_Y to V0, append Train_X to Train_Y, add new variable called Train_mergedData<br>
names(Train_Y) <- c("V0")<br>
Train_mergedData <- append(Train_Y,Train_X)<br>

3. Do the same thing for Test<br>
Test_X <- read.table("./data/X_test.txt",sep="",header=FALSE)<br>
Test_Y <- read.table("./data/Y_test.txt",sep="",header=FALSE)<br>
names(Test_Y) <- c("V0")<br>
Test_mergedData <- append(Test_Y,Test_X)<br>

4. import library gtools and merge two data sets to a variable called Alldata<br>
library(gtools) <br>
Alldata <- smartbind(Train_mergedData,Test_mergedData)<br>

5. import library reshape and melt data into one columns<br>
library(reshape)<br>
mAlldata <- melt(Alldata,id = ("V0"))<br>

6. Uses descriptive activity names to name the activities in the data set<br>
mAlldata$V0[mAlldata$V0 == 1 ] <- 'WALKING'<br>
mAlldata$V0[mAlldata$V0 == 2 ] <- 'WALKING_UPSTAIRS'<br>
mAlldata$V0[mAlldata$V0 == 3 ] <- 'WALKING_DOWNSTAIRS'<br>
mAlldata$V0[mAlldata$V0 == 4 ] <- 'SITTING'<br>
mAlldata$V0[mAlldata$V0 == 5 ] <- 'STANDING'<br>
mAlldata$V0[mAlldata$V0 == 6 ] <- 'LAYING'<br>

7. calculat mean and sd<br>
tapply(mAlldata$value,mAlldata$V0,mean)<br>
tapply(mAlldata$value,mAlldata$V0,sd)<br>
 
 
 

Project 2. Calculate mean<br>

1. As project 1, load data x,y,subject<br>

    Train_X <- read.table("./data/X_train.txt",sep="",header=FALSE)<br>
    Train_Y <- read.table("./data/Y_train.txt",sep="",header=FALSE)<br>
    Train_Subject <- read.table("./data/subject_train.txt",sep="",header=FALSE)<br>
    names(Train_Subject) <- c("VV")<br>
    names(Train_Y) <- c("V0")<br>
    Train_mergedData <- append(append(Train_Y,Train_Subject),Train_X)<br>
    
    Test_X <- read.table("./data/X_test.txt",sep="",header=FALSE)<br>
    Test_Y <- read.table("./data/Y_test.txt",sep="",header=FALSE)<br>
    Test_Subject <- read.table("./data/subject_test.txt",sep="",header=FALSE)<br>
    names(Test_Subject) <- c("VV")<br>
    names(Test_Y) <- c("V0")<br>
    Test_mergedData <- append(append(Test_Y,Test_Subject),Test_X)<br>

2. import library gtools and merge two data sets<br>
library(gtools) <br>
Alldata <- smartbind(Train_mergedData,Test_mergedData)<br>


3. import library reshape and melt data into one columns by id V0,VV<br>
library(reshape)<br>
mAlldata <- melt(Alldata,id = c("V0","VV"))<br>

4. Uses descriptive activity names to name the activities in the data set<br>
mAlldata$V0[mAlldata$V0 == 1 ] <- 'WALKING'<br>
mAlldata$V0[mAlldata$V0 == 2 ] <- 'WALKING_UPSTAIRS'<br>
mAlldata$V0[mAlldata$V0 == 3 ] <- 'WALKING_DOWNSTAIRS'<br>
mAlldata$V0[mAlldata$V0 == 4 ] <- 'SITTING'<br>
mAlldata$V0[mAlldata$V0 == 5 ] <- 'STANDING'<br>
mAlldata$V0[mAlldata$V0 == 6 ] <- 'LAYING'<br>

5. calculat mean <br>
tapply(mAlldata$value,list(mAlldata$V0,mAlldata$VV),mean)<br>

