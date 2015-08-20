# Course Project for Getting and Cleaning Data


## This repository contains the following files:

- 'Readme.md'
- 'rawdata.zip' : project input (zipped folder with raw data)
- 'tidydata.txt' : project output 1 (tidy data that merged train and test datasets, then selected only the mean and standard deviation measurements)
- 'averages_by_subjectActivity.txt' : project output 2 (data with the average of each variable in 'tidydata.txt' for each subject and each activity)
- 'run_analysis.R' : R script that implements the project
- 'CodeBook.md' : Guides through the steps of 'run_analysis.R'


## To reproduce the project outputs:

1. Download and unzip 'rawdata.zip'. Rename the folder as 'data'
2. Download 'run_analysis.R' 
3. Make sure the folder 'data' and the script 'run_analysis.R' are both in the current working directory
4. Make sure the following R packages are installed: {dplyr}
5. Run 'run_analysis.R' ('CodeBook.md' will guide through the steps of the script)




