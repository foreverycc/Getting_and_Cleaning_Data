# Codebook of Course Project

## 0. Dataset introduction
In the dataset of UCI_HAR_Dataset, these files are included:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'train/subject_train.txt': Training subjects.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'test/subject_test.txt': Test subjects'

First read the tables in R by "read.table()".

## 1. Merges the training and the test sets to create one data set.

Merge the X_train.txt, y_train.txt, subject_train.txt, X_test.txt, y_test.txt, subject_test.txt into a new file -- "Merge_Data"
Merge_Data has 10299 rows and 563 columns

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

Use grep function to grep variables that contain "mean" or "std". I selected 79 columns that measures mean or standard deviation.

## 3. Uses descriptive activity names to name the activities in the data set

I used the information in activity_labels.txt to label the activities in the dataset.


## 4. Appropriately labels the data set with descriptive variable names. 

I used "gsub" function to change the variable names more easily understand. 

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

I used "aggregate" function to calculate the average of each variable for each activity and each subject. The tidy data will be saved in the current directory named "Tidy_Data_Course_Proj.txt".
