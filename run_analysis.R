runAnalysis <- function() {
  ## Start of script
  library(dplyr)
  ## Download and unzip file
  zipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  zipFile <- "UCI HAR Dataset.zip"
  download.file(zipUrl, zipFile, mode = "wb")
  unzip(zipFile)
  
  ## Read all files
  trainSubjects <- read.table(file.path("UCI HAR Dataset/train/subject_train.txt"))
  trainLabels <- read.table(file.path("UCI HAR Dataset/train/y_train.txt"))
  trainData <- read.table(file.path("UCI HAR Dataset/train/X_train.txt"))
  testSubjects <- read.table(file.path("UCI HAR Dataset/test/subject_test.txt"))
  testLabels <- read.table(file.path("UCI HAR Dataset/test/y_test.txt"))
  testData <- read.table(file.path("UCI HAR Dataset/test/X_test.txt"))
  features <- read.table(file.path("UCI HAR Dataset/features.txt"), as.is=TRUE)
  
  activityLabels <- read.table(file.path("UCI HAR Dataset/activity_labels.txt"))
  colnames(activities) <- c("subjectID, activityName")
  
  ## (1) Merge trainData and testData, assign headers
  
  mergedData <- rbind(cbind(trainSubjects,trainData,trainLabels), cbind(testSubjects, testData, testLabels))
  colnames(mergedData) <- c("subjectId", features[, 2], "activityId")
  
  ## (2) Remove all columns that don't pertain to mean or standard deviation
  # meanFreq will be included with just 'mean', so the parantheses are included in regex
  filteredHeaders <- grepl("subjectId|activityId|mean\\(\\)|std\\(\\)", colnames(mergedData))
  filteredData <- mergedData[,filteredHeaders]
  
  ## (3) Replace the numerical values under the 'activity' column with their corresponding descriptive names
  
  filteredData$activity <- factor(filteredData$activity, levels = activities[,1], labels = activities[,2])
  
  ## (4) Replace column names from dataset with extended names that are more descriptive
  
  filteredHeaders <- colnames(filteredData)
  
  filteredHeaders <- gsub("^t", "TimeDomain", filteredHeaders)
  filteredHeaders <- gsub("Acc", "Accelerometer", filteredHeaders)
  filteredHeaders <- gsub("mean", "Mean", filteredHeaders)
  filteredHeaders <- gsub("std", "StandardDeviation", filteredHeaders)
  filteredHeaders <- gsub("Gyro", "Gyroscope", filteredHeaders)
  filteredHeaders <- gsub("Mag", "Magnitude", filteredHeaders)
  filteredHeaders <- gsub("^f", "FrequencyDomain", filteredHeaders)
  filteredHeaders <- gsub("subjectId", "SubjectId", filteredHeaders)
  filteredHeaders <- gsub("activity", "Activity", filteredHeaders)
  filteredHeaders <- gsub("[\\(\\)-]", "", filteredHeaders)
  
  colnames(filteredData) <- filteredHeaders

  ## (5) Get averages of mean and standard deviation column for each activity and subject, and write to 'tidy_data.txt' file
  
  filteredDataAverages <- filteredData %>% group_by(SubjectId, Activity) %>% summarise_each(funs(mean))

  write.table(filteredDataAverages, "tidy_data.txt", row.names=FALSE,quote=FALSE)
}