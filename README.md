Getting and Cleaning Data Course Project
========================================================

The purpose of this project is to  demonstrate my ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

**About the data:**
The data is available at
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data was collected from the accelerometers from the Samsung Galaxy S smartphone. A full description of the data set information is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

**The R script, run_analysis.R does the following:**
- 1. Merges the training and the test sets to create one data set.
- 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
- 3. Uses descriptive activity names to name the activities in the data set
- 4. Appropriately labels the data set with descriptive activity names. 
- 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. This is named "TidyData" in the script.

**CookBook.md** is a code book that describes the variables, the data, and any transformations that were performed on the data.

