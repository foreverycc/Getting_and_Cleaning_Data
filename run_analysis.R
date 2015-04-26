# Course_Project
# 0.1 load packages
library("dplyr")
# 0.2 read the data
Train_Data_X = read.table('./data/Course_Project/UCI_HAR_Dataset/train/X_train.txt', header = F)
Train_Data_Y = read.table('./data/Course_Project/UCI_HAR_Dataset/train/y_train.txt')
Train_Subject = read.table("./data/Course_Project/UCI_HAR_Dataset/train/subject_train.txt")
Test_Data_X = read.table("./data/Course_Project/UCI_HAR_Dataset/test/X_test.txt", header = F)
Test_Data_Y = read.table("./data/Course_Project/UCI_HAR_Dataset/test/y_test.txt")
Test_Subject = read.table("./data/Course_Project/UCI_HAR_Dataset/test/subject_test.txt")

# 1. Merge the training and tet sets to create one data set
Merge_Data_X = rbind(Train_Data_X, Test_Data_X)
Feature_Names = read.table("./data/Course_Project/UCI_HAR_Dataset/features.txt", header = F)
colnames(Merge_Data_X) = as.character(Feature_Names$V2)
head(Merge_Data_X)
Merge_Data_X$Y = c(Train_Data_Y$V1, Test_Data_Y$V1)
Merge_Data_X$Subjects = c(Train_Subject$V1, Test_Subject$V1)
Merge_Data = Merge_Data_X
dim(Merge_Data)
head(Merge_Data)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement
Sel_Col = c(grep("mean", names(Merge_Data)),  grep ("std", names(Merge_Data)))
Merge_Data_Sel = Merge_Data[, Sel_Col]
head(Merge_Data_Sel)

# 3. Use descriptive activity names to name the activitie in the data set
Activity_Label = read.table('./data/Course_Project/UCI_HAR_Dataset/activity_labels.txt')
Activity_Fac = factor(Merge_Data$Y, levels = Activity_Label$V1, labels = Activity_Label$V2)
Merge_Data_Sel = mutate(Merge_Data_Sel, Activity = Activity_Fac)
Merge_Data_Sel = mutate(Merge_Data_Sel, Subjects = Merge_Data$Subjects)

# 4. Appropriately labels the data set with decriptive variable names
# rename variable names with descriptive names
Var_Names = names(Merge_Data_Sel)
Var_Names = gsub("\\()", "", Var_Names)
Var_Names = gsub("tBody", "TimeBody", Var_Names)
Var_Names = gsub("tGravity", "TimeGravity", Var_Names)
Var_Names = gsub("fBody", "FreqBody", Var_Names)
Var_Names = gsub("Mag", "Magnitude", Var_Names )
Var_Names = gsub("BodyBody", "Body", Var_Names)
Var_Names = gsub("-", "_", Var_Names)
names(Merge_Data_Sel) = Var_Names
head(Merge_Data_Sel)

# 5. From data in step 4, creates a second independent tidy data set with the 
# average of each variable for each activity and each subject
New_Var = paste0("Mean_", Var_Names[1:79])
Tidy_Data = aggregate(Merge_Data_Sel[, 1:79], by = list(Merge_Data_Sel$Subjects, Merge_Data_Sel$Activity), mean)
cbind(New_Var, colnames(Tidy_Data)[3:81] )
colnames(Tidy_Data)[3:81] = New_Var
colnames(Tidy_Data)[1:2] = c("Subjects", "Activity")
Tidy_Data_Arrange = arrange(Tidy_Data, Subjects, Activity)
write.table(Tidy_Data_Arrange, "./Tidy_Data_Course_Proj.txt", row.names = F)
