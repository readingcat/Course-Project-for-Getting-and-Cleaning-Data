# CodeBook: Course Project for Getting and Cleaning Data

# Description of Raw Data

The data contained in 'rawdata.zip' were downloaded via the link provided on the course website:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

A full description of the data is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Description of Steps in 'run_analysis.R'

Step 1. Read relevant raw datasets: The following datasets are read into R using 'read.table()':
- 'featureNames' : names of the features;
- 'activityNames' : codes and corresponding descriptive names of activities;
- 'trainX' : training dataset (values of the features);
- 'trainY' : training dataset (activity codes);
- 'trainSubject' : training dataset (subject id numbers);
- 'testX' : test dataset (values of the features);
- 'testY' : test dataset (activity codes);
- 'testSubject' : test dataset (subject id numbers).

Step 2. Merge train and test datasets: Training and test datasets are in the same format, where rows represent observations and columns represent variables. An easy way to merge them is to stack them using 'rbind()':
- 'trainX' and 'testX' are merged into 'X';
- 'trainY' and 'testY' are merged into 'Y';
- 'trainSubject' and 'testSubject' are merged into 'subject'.

Step 3. Extract mean and standard deviation measurements: We need only the mean and standard deviation measurements. We will identify and extract these using the features' names. The names of all features are contained in 'featureNames':
- Some names are duplicates! First, using 'make.names()', make unique feature names and save under 'featureNamesUnique';
- Second, attach the unique feature names to the variables in 'X';
- Third, use 'select()' to extract the mean and standard deviation measurements. For 'meansX', select all variables whose names contain the character string ".mean.", and for 'stdsX', select all variables whose names contain the character string ".std.".

Step 4. Use descriptive activity names for activities: Activity codes are contained in 'Y', an integer vector with values ranging from 1 to 6. Instead of integers indicating the activities, we want descriptive names of the activities:
- First, transform the class of 'Y' from integer to factor, and call the resulting factor variable 'activity';
- Second, set the levels of the factor variable 'activity' to be the descriptive names (contained in 'activityNames').
- Note: try 'head(activity)' to see the result.

Step 5. Create and write the tidy dataset under 'tidydata.txt':
- First, transform the class of 'subject' from integer to factor (this is a more accurate classification and will be useful later when we use 'subject' as a grouping factor);
- Second, collect 'subject', 'activity', 'meansX', and 'stdsX' under 'tidydata'
- Third, save 'tidydata' as 'tidydata.txt'.
- Note: Project output 1 has been produced.

Step 6. From 'tidydata' create a second dataset with the average of each variable for each activity and each subject: 
- First, group 'tidydata' by subject and activity using 'group_by()' and save the grouped data under 'subjectActivity';
- Second, create the dataset of averages using 'summarize()' on the grouped data;
- Third, save the averages dataset under 'averages_by_subjectActivity.txt'.
- Note: Project output 2 has been produced.


