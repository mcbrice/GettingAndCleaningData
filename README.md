
---
title: "Getting and Cleaning Data Project"
output: html_document
---

## README.md
This readme contains explanations for how the script "run_analysis.R" works
and the choices made for the analysis.

### Libraries Used
```
library(dplyr)
```


### Reading the Data Files
Read all the necessary data and store in tables. This assumes the data is located in the
folder "UCI HAR Dataset" with its original folder structure in the working directory.

#### Training Data
y_train contains the training labels, x_train contains the training set, and subject_train
identifies the subject who performed the activity for each sample.
```
y_train <- read.table("UCI HAR Dataset\\train\\y_train.txt", header = FALSE)
x_train <- read.table("UCI HAR Dataset\\train\\x_train.txt", header = FALSE)
subject_train <- read.table("UCI HAR Dataset\\train\\subject_train.txt", header = FALSE)
```

#### Test Data
y_test contains the training labels, x_test contains the training set, and subject_test
identifies the subject who performed the activity for each sample.
```
y_test <- read.table("UCI HAR Dataset\\test\\y_test.txt", header = FALSE)
x_test <- read.table("UCI HAR Dataset\\test\\x_test.txt", header = FALSE)
subject_test <- read.table("UCI HAR Dataset\\test\\subject_test.txt", header = FALSE)
```

#### Activity Labels
activity_labels contains a list of activity names in the data set
```
activity_labels <- read.table("UCI HAR Dataset\\activity_labels.txt", header = FALSE)
```

#### Features
features contains a list of features in the data set
```
features <- read.table("UCI HAR Dataset\\features.txt", header = FALSE)
```

### Merging the Data
Here the data will be merged to create one data set.

First a clean column name of "subject" will be given to the subject tables, "activity" to
the activity tables, and the list of features is used to create descriptive column names for the
data sets. The feature column names will be further cleaned up later.

```
names(subject_train) <- c("subject")
names(y_train) <- c("activity")
names(x_train) <- features$V2
names(subject_test) <- c("subject")
names(y_test) <- c("activity")
names(x_test) <- features$V2
```

Then the training tables are combined to form one table, the test tables are combined to
form another table. Finally the training and test sets are merged into one table.

```
merged_train <- cbind(subject_train, y_train)
merged_train <- cbind(merged_train, x_train)
merged_test <- cbind(subject_test, y_test)
merged_test <- cbind(merged_test, x_test)
merged_all <- rbind(merged_train, merged_test)
```

### Extracting Only Measurements on Mean and Standard Deviation
To extract the mean and standard deviation measurements, first the list of features is
filtered to only include the mean and std. Then use the filtered list to select only
the columns of the previously created table that are needed.

```
featuresListFiltered <- grep("mean\\(\\)|std\\(\\)", features$V2, value = TRUE)
neededCols <- c("subject", "activity", featuresListFiltered)
all_needed <- select(merged_all, all_of(neededCols))
```


### Descriptive Activity Names
The id numbers in the activity column will now be replaced with their corresponding
descriptive activity names from the activity_labels data.(WALKING, WALKING_UPSTAIRS,
WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

```
all_needed <- mutate(all_needed, activity = activity_labels$V2[as.numeric(activity)])
```

### Descriptive Variable Names
To create more descriptive variable names, all special characters are removed from the
names, abbreviations are replaced with better descriptive words, and the variable names 
are converted to all lowercase.

```
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
```

### Tidy Data Set
To create a tidy data set which contains the average for each variable for each subject 
and each activity the data is grouped by subject and activity. Then the average (mean) is
calculated for each variable for each group.

```
tidy_set <- all_needed %>% group_by(subject, activity) %>% summarise_all(mean)
```

### Txt file output
Output tidy data as text file "tidy.txt

```
write.table(tidy_set, file = "tidy.txt", row.name=FALSE)
```
The file can be read  with: ```read.table("tidy.txt", header=TRUE)```
