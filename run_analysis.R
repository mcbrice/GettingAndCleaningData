# See README.md for more information

# libraries
library(dplyr)

# read data
y_train <- read.table("UCI HAR Dataset\\train\\y_train.txt", header = FALSE)
x_train <- read.table("UCI HAR Dataset\\train\\x_train.txt", header = FALSE)
subject_train <- read.table("UCI HAR Dataset\\train\\subject_train.txt", header = FALSE)
y_test <- read.table("UCI HAR Dataset\\test\\y_test.txt", header = FALSE)
x_test <- read.table("UCI HAR Dataset\\test\\x_test.txt", header = FALSE)
subject_test <- read.table("UCI HAR Dataset\\test\\subject_test.txt", header = FALSE)
activity_labels <- read.table("UCI HAR Dataset\\activity_labels.txt", header = FALSE)
features <- read.table("UCI HAR Dataset\\features.txt", header = FALSE)

# merge data to one clean table
names(subject_train) <- c("subject")
names(y_train) <- c("activity")
names(x_train) <- features$V2
names(subject_test) <- c("subject")
names(y_test) <- c("activity")
names(x_test) <- features$V2
merged_train <- cbind(subject_train, y_train)
merged_train <- cbind(merged_train, x_train)
merged_test <- cbind(subject_test, y_test)
merged_test <- cbind(merged_test, x_test)
merged_all <- rbind(merged_train, merged_test)

# get only mean and std
featuresListFiltered <- grep("mean\\(\\)|std\\(\\)", features$V2, value = TRUE)
neededCols <- c("subject", "activity", featuresListFiltered)
all_needed <- select(merged_all, all_of(neededCols))

# make descriptive activity names
all_needed <- mutate(all_needed, activity = activity_labels$V2[as.numeric(activity)])

# make descriptive variable names
colNames <- names(all_needed)
colNames <- gsub("^t", "time", colNames)
colNames <- gsub("^f", "frequency", colNames)
colNames <- gsub("Acc", "acceleration", colNames)
colNames <- gsub("Mag", "magnitude", colNames)
colNames <- gsub("mean\\(\\)", "mean", colNames)
colNames <- gsub("std\\(\\)", "standarddeviation", colNames)
colNames <- gsub("X", "xaxis", colNames)
colNames <- gsub("Y", "yaxis", colNames)
colNames <- gsub("Z", "zaxis", colNames)
colNames <- gsub("-", "", colNames)
colNames <- tolower(colNames)
names(all_needed) <- colNames

# final tidy data
tidy_set <- all_needed %>% group_by(subject, activity) %>% summarise_all(mean)

# output text file of tidy set to "tidy.txt
write.table(tidy_set, file = "tidy.txt", row.name=FALSE)