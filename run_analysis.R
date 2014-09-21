#Script to project of the course Getting and Cleaning Data
#Made by Cesar Rincon  21/09/2014

#This script prepare tidy data from weareable computing

#1. Merges Training and Test Data and create 1 data set
#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names. 
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#load library reshape
library(reshape2)

#Check if data files exists

if (file.exists("UCI HAR Dataset")) {
  
  #set de paths 
  dir <- "./UCI HAR Dataset/"
  dirTrain <- "./UCI HAR Dataset/train/"
  dirTest <- "./UCI HAR Dataset/test/"
  
  #read reference
  activityLabels <- read.table(paste(dir, "activity_labels.txt", sep=""))
  features <- read.table(paste(dir,"features.txt", sep=""))
  
  #read data test
  testData <- read.table(paste(dirTest, "X_test.txt", sep=""))
  testSubject <-read.table(paste(dirTest, "subject_test.txt", sep=""))
  testLabels <- read.table(paste(dirTest, "Y_test.txt", sep=""))
  
  trainData <- read.table(paste(dirTrain, "X_train.txt", sep=""))
  trainSubject <-read.table(paste(dirTrain, "subject_train.txt", sep=""))
  trainLabels <- read.table(paste(dirTrain, "Y_train.txt", sep=""))
  
  #Set labels in columns
  names(testData) <- features[,2]
  names(trainData) <- features[,2]
  
  #Extracts only the measurements on the mean and standard deviation
  meanColumns <- features[grepl("mean", features[,2]),]
  stdColumns <- features[grepl("std", features[,2]),]
  colsToSelect <- rbind(meanColumns, stdColumns)
  
  #select columns
  tydiTestData <- testData[, colsToSelect[,1]]
  tydiTrainData <- trainData[, colsToSelect[,1]]
  
  #Creating new col with Subject Data
  tydiTestData$Subject <- testSubject[,1]
  tydiTrainData$Subject <- trainSubject[,1]
  
  #Naming labels
  
  names(testLabels) <- "activityID"
  names(trainLabels) <- "activityID"
  names(activityLabels) <- c("activityID","label")
  
  #merging labels with ids
  activityTestLabels <- merge(testLabels, activityLabels)
  activityTrainLabels <- merge(trainLabels, activityLabels)
  
  #Creating new col with activity
  #Appropriately labels the data set with descriptive variable names.
  
  tydiTestData$Activity <- activityTestLabels[,2]
  tydiTrainData$Activity <- activityTrainLabels[,2]
  
  #1. Merges Training and Test Data and create 1 data set
  #Combining datasets
  tydiDataSet <- rbind(tydiTestData, tydiTrainData)
  
  #5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  #melting data 
  meltData <- melt(tydiDataSet, id=c("Subject", "Activity"))
  tidyMeanData <-dcast(meltData, Subject + Activity ~ variable, mean )
  
  #Delete variables to clear Memory  
  remove(activityLabels)
  remove(activityTestLabels)
  remove(activityTrainLabels)
  remove(features)
  remove(testData)
  remove(testLabels)
  remove(testSubject)
  remove(trainData)
  remove(trainLabels)
  remove(trainSubject)
  remove(meanColumns)
  remove(stdColumns)
  remove(colsToSelect)
  remove(meltData)
  
} else {
  print("Error- Do not find folder UCI HAR Dataset ")
}

