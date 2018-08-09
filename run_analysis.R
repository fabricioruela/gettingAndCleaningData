library(dplyr)

path = "../data/UCI\ HAR\ Dataset"

# read train data
X_train <- read.table(paste(path, "/train/X_train.txt",sep = ""))
Y_train <- read.table(paste(path, "/train/Y_train.txt",sep = ""))
Sub_train <- read.table(paste(path, "/train/subject_train.txt",sep = ""))

# read test data
X_test <- read.table(paste(path, "/test/X_test.txt",sep = ""))
Y_test <- read.table(paste(path, "/test/Y_test.txt",sep = ""))
Sub_test <- read.table(paste(path, "/test/subject_test.txt",sep = ""))

# read features
features <- read.table(paste(path, "/features.txt",sep = ""))

# read activity labels
activity_labels <- read.table(paste(path, "/activity_labels.txt",sep = ""))

# 1. Merges the training and the test sets to create one data set.
X_total <- rbind(X_train, X_test)
Y_total <- rbind(Y_train, Y_test)
Sub_total <- rbind(Sub_train, Sub_test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
selected_features <- features[grep("mean\\(\\)|std\\(\\)",features[,2]),]
X_total <- X_total[,selected_features[,1]]

# 3. Uses descriptive activity names to name the activities in the data set
colnames(Y_total) <- "activity"
Y_total$activitylabel <- factor(Y_total$activity, labels = as.character(activity_labels[,2]))
activitylabel <- Y_total[,-1]

# 4. Appropriately labels the data set with descriptive variable names.
colnames(X_total) <- features[selected_features[,1],2]

# 5. From the data set in step 4, creates a second, independent tidy data set with the average
# of each variable for each activity and each subject.
colnames(Sub_total) <- "subject"
t <- cbind(X_total, activitylabel, Sub_total)
tm <- t %>% group_by(activitylabel, subject) %>% summarize_each(funs(mean))
write.table(tm, file = paste(path, "/tidydata.txt", sep = ""), row.names = FALSE, col.names = TRUE)
