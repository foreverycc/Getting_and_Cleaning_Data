# Course_Project
Train_Data_X = read.table('./data/Course_Project/UCI_HAR_Dataset/train/X_train.txt', header = F)
Test_Data_X = read.table("./data/Course_Project/UCI_HAR_Dataset/test/X_test.txt", header = F)
Train_Data_Y = read.table('./data/Course_Project/UCI_HAR_Dataset/train/y_train.txt')
Test_Data_Y = read.table("./data/Course_Project/UCI_HAR_Dataset/test/y_test.txt")

# 1. Merge the training and tet sets to create one data set
Merge_Data_X = rbind(Train_Data_X, Test_Data_X)
Merge_Data_Y = rbind(Train_Data_Y, Test_Data_Y)
Merge_Data = cbind(Merge_Data_X, Merge_Data_Y)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement
Row_Mean = rowMeans(Merge_Data_X)
Row_SD = apply(Merge_Data_X, 1, sd)

# 3. Use descriptive activity names to name the activitie in the data set
Descript_Act = read.table('./data/Course_Project/UCI_HAR_Dataset/activity_labels.txt')
Merge_Data_Y_Vec = Merge_Data_Y[, 1] 
Merge_Data_Y_Act = Descript_Act[,2] [ Merge_Data_Y_Vec]

# 4. Appropriately labels the data set with decriptive variable names
head(Merge_Data)
Features = read.table("./data/Course_Project/UCI_HAR_Dataset/features.txt")
names(Merge_data)[1:nrow(Features)] = as.character(Features[, 2])
Merge_Data_2 = cbind(Merge_data, Merge_Data_Y_Act)
head(Merge_Data_2)

# 5. From data in step 4, creates a second independent tidy data set with the 
# average of each variable for each activity and each subject
Data_Clean = Merge_Data_2[, c(1:561, 563)]
head(Data_Clean)
write.table(Data_Clean, "./output/Course_Project_Clean_Data.txt", row.names = F)
