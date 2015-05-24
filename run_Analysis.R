##
## You should create one R script called run_analysis.R that does the following:
## 1) Merges the training and the test sets to create one data set.
## 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3) Uses descriptive activity names to name the activities in the data set
## 4) Appropriately labels the data set with descriptive variable names. 
## 5) From the data set in step 4, creates a second, independent tidy data set with the average
## of each variable for each activity and each subject.
##

#
# Step 1: Merge the training and test sets into one data set
#
testData <- read.table("X_test.txt")
#trainData <- read.table("X_train.txt")
allData <- rbind(testData, read.table("X_train.txt"))

#
# Step 2: Pull in column & row headers, and other descriptors
#
activities <- read.table("activity_labels.txt", col.names = c("activity.code", "activity"))
features <- read.table("features.txt", col.names = c("column", "feature"))
actCodeByRow <- read.table("y_test.txt", col.name = "activity.code")
actCodeByRow = rbind(actCodeByRow, read.table("y_train.txt", col.name ="activity.code"))
subjectByRow <- read.table("subject_test.txt", col.name = "Subject")
subjectByRow = rbind(subjectByRow, read.table("subject_train.txt", col.name ="Subject"))


#
# Step 3: Set column names (features)
#
names(allData) <- features$feature


#
# Step 4: Just keep "std" and "mean" columns
#
goodCols = grep(pattern = "-mean()", x = features$feature, fixed = TRUE)
goodCols = append(goodCols, grep(pattern = "-std()", x = features$feature, fixed = TRUE))
measuredData <- allData[goodCols]


#
# Step 5: Set row header (subject)
#
measuredData = cbind(Subject = subjectByRow, measuredData)

#
# Step 6: Set row header (activities)
#
activityByRow <- activities[actCodeByRow$activity.code, "activity"]
measuredData = cbind(Activity = activityByRow, measuredData)


#
# Step 7: Create tidy data set and write it out to text file
#
tidyData <- group_by(measuredData, Activity, Subject) %>% summarise_each(funs(mean))
write.table(tidyData, "tidayData.txt", row.name=FALSE)

#
# Step 8: Display file
#
print(tidyData)


