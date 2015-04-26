# Getting_and_Cleaning_Data
## Background and data origin
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Course Project Running
Put the data under ./data/Course_Project/, using name as "UCI_HAR_Dataset".
Then run the code should return a clean dataset.

## Result dataset
The result dataset is named "Tidy_Data_Course_Proj.txt".
The dataset has 81 columns
The first column represents the subjects's number. The second column represents the subjects's activity.
Row 3-81 are the mean value of each variables in the raw data grouped by each subject' activity.
