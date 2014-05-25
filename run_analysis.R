## Step 1 : Merges the training and the test sets to create one data set.


## read the train and test data
setwd("/Users/Lynna/Desktop/UCI HAR Dataset/")
TrainData <- read.table("./train/X_train.txt", header = FALSE)
TestData <- read.table("./test/X_test.txt", header = FALSE)

## read the feature file that contains the corresponding feature that was measured in the TrainData and TestData
## this info will be used to label the columns in the TrainData and TestDat
features <- read.table('./features.txt', header=FALSE)
colnames(TrainData) <- features[,2]
colnames(TestData) <- features[,2]

## read the training & test label, then the subjects.
TrainLabel <- read.table("./train/y_train.txt", header = FALSE)
TestLabel <- read.table("./test/y_test.txt", header = FALSE)

TrainSubject <- read.table("./train/subject_train.txt", header = FALSE)
TestSubject <- read.table("./test/subject_test.txt", header = FALSE)

## assign colnames
colnames(TrainLabel) <- "activity_id"
colnames(TrainSubject) <- "subject_id"

colnames(TestLabel) <- "activity_id"
colnames(TestSubject) <- "subject_id"

## combine the training data, label, and subject together.
Train <- cbind(TrainLabel, TrainSubject, TrainData)
Test <- cbind(TestLabel, TestSubject, TestData)
TrainAndTest <- rbind(Train, Test)



## Step 2: 	Extracts only the measurements on the mean and standard deviation for each measurement. 

## create a vector of the TrainAndTest column names
ColumnNames <- colnames(TrainAndTest)

## find which column has mean and SD info, using T/F logical vector
LogicalVector <- (grepl("activity_id",ColumnNames) | grepl("subject_id",ColumnNames) | grepl("-mean..",ColumnNames) & !grepl("-meanFreq..",ColumnNames) & !grepl("mean..-",ColumnNames) | grepl("-std..",ColumnNames) & !grepl("-std()..-",ColumnNames))

## extracting the data
TrainAndTest_MeanAndSD <- TrainAndTest[LogicalVector == TRUE]

## check
head(TrainAndTest_MeanAndSD, n = 2)



## Step 3: 	Uses descriptive activity names to name the activities in the data set
ActivityType <- read.table("./activity_labels.txt", header=FALSE)
head(ActivityType, n = 2)
colnames(ActivityType) <- c("activity_id", "activity_name")
TrainAndTest_MeanAndSD <- merge(TrainAndTest_MeanAndSD, ActivityType, by='activity_id', all.x=TRUE)



## Step 4: Appropriately label the data set with descriptive activity names.
ColumnNames <- colnames(TrainAndTest_MeanAndSD)
## check the labels before
head(TrainAndTest_MeanAndSD, n = 2)

## editting the label of the data set
for (i in 1:length(ColumnNames)) 
{
  ColumnNames[i] = gsub("^(t)","time",ColumnNames[i])
  ColumnNames[i] = gsub("^(f)","freq",ColumnNames[i])
  ColumnNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",ColumnNames[i])
  ColumnNames[i] = gsub("[Gg]yro","Gyro",ColumnNames[i])
  ColumnNames[i] = gsub("AccMag","AccMagnitude",ColumnNames[i])
  ColumnNames[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",ColumnNames[i])
  ColumnNames[i] = gsub("JerkMag","JerkMagnitude",ColumnNames[i])
  ColumnNames[i] = gsub("GyroMag","GyroMagnitude",ColumnNames[i])
  ColumnNames[i] = gsub("\\()","",  ColumnNames[i])
  ColumnNames[i] = gsub("-std","StdDev",ColumnNames[i])
  ColumnNames[i] = gsub("-mean","Mean",ColumnNames[i])
}

## check the labels after
head(TrainAndTest_MeanAndSD, n = 2)



## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## subsetting the data that contains the mean info
AvgPerActivityPerSubject <- TrainAndTest_MeanAndSD[c(1, 2, 3, 5, 7, 9, 11, 13, 15, 17, 19)]

write.table(AvgPerActivityPerSubject, "Averages.txt")
