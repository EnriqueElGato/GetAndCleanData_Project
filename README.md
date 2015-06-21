## Getting and Cleaning Data Course Project

This analysis creates two files based on the data taken form the Human Activity Recognition Using Smartphones Dataset (UCI HAR Dataset) Version 1.0. The UCI HAR Dataset raw data and a full description of the data used to create these two files can be downloaded [here][datalink].

The two files created by this analysis are described below:

1. merged_mean_sd_X_test_train.txt: A file containing a merger of the mean and standard deviation measurements of the test and training datasets. 

2. avg_merged_mean_sd_X_test_train.txt: A calculated average of each of the mean and standard deviation fields found in the merged_mean_sd_X_test_train.txt file grouped by subject and activity.
### How The Files Where Created
The run_analysis function in this script does the following:
#              1. Loads the UCI HAR Dataset training and test data
#              2. Merges them into one dataset
#              3. Writes merged data to the file merged_mean_sd_X_test_train.txt.
#              4. Takes the average of the mean and standard deviation fields found 
#                    in merged_mean_sd_X_test_train.txt grouped by Subject and Activty.
#              5. Writes averaged data to the file avg_merged_mean_sd_X_test_train.txt
###Instruction To Load Files

[datalink]: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "Title"

