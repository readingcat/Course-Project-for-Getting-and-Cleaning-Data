## Preamble:
## ==========================================================================
##
## This script creates from raw data (raw data are in the zipped folder) two
## tidy datasets: 'tidydata.txt' and 'averages_by_subjectActivity.txt'.
## Before running the script, make sure that:
##         - zipped folder is unzipped into a folder called 'data'
##         - both this script 'run_analysis.R' and the folder 'data' are in the
##           current working directory
##         - the following packages are installed: dplyr
##
## ==========================================================================





## Step 1. Read relevant raw datasets:
## ==========================================================================

# Read feature names
featureNames <- read.table("data/features.txt")

# Read activity labels
activityNames <- read.table("data/activity_labels.txt")

# Read training data
trainX <- read.table("data/train/X_train.txt")
trainY <- read.table("data/train/y_train.txt")
trainSubject <- read.table("data/train/subject_train.txt")

# Read test data
testX <- read.table("data/test/X_test.txt")
testY <- read.table("data/test/y_test.txt")
testSubject <- read.table("data/test/subject_test.txt")





## Step 2. Merge train and test datasets:
## =========================================================================

# Merge 'trainX' and 'testX'
X <- rbind(trainX, testX)

# Merge 'trainY' and 'testY'
Y <- rbind(trainY, testY)

# Merge 'trainSubject' and 'testSubject'
subject <- rbind(trainSubject, testSubject)





## Step 3. Extract from 'X' mean and standard deviation measurements:
## ========================================================================
## Remark: Some feature names are duplicates! First, make syntactically
##         valid and unique feature names, using 'make.names()'. Second,
##         notice that the names of mean and standard deviation measurements 
##         contain either the string ".mean." or the string ".std."

# Make syntactically valid and unique feature names
featureNamesUnique <- make.names(featureNames[,2], unique = TRUE)

# Attach feature names to columns of 'X'
colnames(X) <- featureNamesUnique

# Use 'select()' to extract the mean and std measurements
library(dplyr)
meansX <- select(X, contains(".mean."))
stdsX <- select(X, contains(".std."))





## Step 4. Use descriptive activity names for activities:
## =======================================================================

# Better to transform class of 'Y' from integer to factor
activity <- factor(Y[,1])

# Use descriptive activity names
levels(activity) <- as.character(activityNames[,2])





## Step 5. Create and write the tidy dataset under 'tidydata.txt':
## ======================================================================

# Better to transform class of 'subject' from integer to factor
subject <- factor(subject[,1])

# Create the tidy dataset
tidydata <- data.frame(subject, activity, meansX, stdsX)

# Write the tidy dataset under 'tidydata.txt'
write.table(tidydata, file = "tidydata.txt", row.names = FALSE)





## Step 6. From 'tidydata' create a second dataset with the average of
## each variable for each activity and each subject:
## ======================================================================

# Group 'tidydata' by subject and activity
subjectActivity <- group_by(tidydata, subject, activity)

# Create the averages dataset using 'summarize()'
averages_by_subjectActivity <- summarise_each(subjectActivity, 'mean')

# Write the averages dataset under 'averages_by_subjectActivity.txt'
write.table(averages_by_subjectActivity, file = "averages_by_subjectActivity.txt", row.names = FALSE)





