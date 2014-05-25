## CodeBook

The run_analysis.R script does the following to the downloaded data:
## 1. Merge the training and the test sets to create one data set.
by reading the training (X_train.txt, y_train.txt and subject_train.txt) and test data (X_test.txt, y_test.txt and subject_test.txt from the)
and joining the two data together.

## 2. Extract only the measurements on the mean and standard deviation for each measurement. 
by creating a logical vector that looks for the appropriate column name (ie. column with names such as mean and std)

## 3. Use descriptive activity names to name the activities in the data set
by using the activity_label.txt file, merge the activity names according to "activity_id"

## 4. Appropriately label the data set with descriptive activity names.
by cleaning up the column names (aka. labels) so that they can be easily read

## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
by subsetting the data and selecting on the columns with the "mean" information
