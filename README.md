## Getting and Cleaning Data Course Project

This analysis creates two files based on the data taken form the Human Activity Recognition Using Smartphones Dataset (UCI HAR Dataset) Version 1.0. The UCI HAR Dataset raw data and a full description of the data used to create these two files can be downloaded [here][datalink].

All the scripits and data files created for this analysis can be found [here][project].

The two files created by this analysis are described below:

1. merged_mean_sd_X_test_train.txt: A file containing a merger of the mean and standard deviation measurements of the test and training datasets. 

2. avg_merged_mean_sd_X_test_train.txt: A calculated average of each of the mean and standard deviation fields found in the merged_mean_sd_X_test_train.txt file grouped by subject and activity.
## How The Files Where Created
The R script run_analysis.R loads the UCI HAR Dataset, performs the transformations and then extracts the merged and averaged data into the two files. Below are the steps execute by the script.  The script's run_analysis() function takes a directory parameter which is used to set the current working directory. This working directory needs to contain the UCI HAR Dataset files in the locations described below. The script executes the following steps: 

1. The following UCI HAR Dataset files are loaded:
 + ./activity_labels.txt
 + ./features.txt
 + ./test/x_test.txt
 + ./test/y_test.txt"
 + ./test/subject_test.txt
 + ./train/x_train.txt
 + ./train/y_train.txt
 + ./train/subject_train.txt
2. The test and training data are separately merged with their subject data (contained in subject_*.txt) and activity data (contained in y_*.txt).
3. The test and training data are then merged. 
4. The columns contained in the merged data are then filtered to only contain the fields which contain "mean()" and "std()". 
5. The mean and standard deviation data is then written to the file merged_mean_sd_X_test_train.txt.
4. An average grouped by the Subject and Activity is then performed on the mean and standard deviation variables. The prefix "avg_" is added to each variable name.
5. The averaged data is then written to the file avg_merged_mean_sd_X_test_train.txt

##Instruction To Load Files
To load merged_mean_sd_X_test_train.txt run: read.table("./merged_mean_sd_X_test_train.txt",head=TRUE)
To load avg_merged_mean_sd_X_test_train.txt run: read.table("./avg_merged_mean_sd_X_test_train.txt",head=TRUE)

[datalink]: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "UCI HAR Dataset"
[project]: https://github.com/EnriqueElGato/GetAndCleanData_Project "Project files."

