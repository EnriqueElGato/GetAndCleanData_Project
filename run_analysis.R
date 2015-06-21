# This file contains one function called run_analysis. 
# See the README.md file for more details on the purpose of and 
# the steps executed by this script.
#
#Functions: 
# 1) run_analysis
#      Usage
#        run_analysis(fileDir = "./")
#      Arguments
#        fileDir - Directory where "UCI HAR Dataset" is loacated.
#                    Defaults to current working directory.
#      Output
#        Two files: 
#          1) merged_mean_sd_X_test_train.txt:File containing both the 
#               test and training datasets plus subject and activity variables.
#          2) avg_merged_mean_sd_X_test_train.txt: File containing average of
#               mean and standard deviation fields contained in 
#               merged_mean_sd_X_test_train.txt grouped by Subject and Activity.
#
#
run_analysis <- function(fileDir="./"){
    
#

#c("BodyBody","Body","Jerk","Body","std\\(\\)","mean\\(\\)","t","f","Acc","Gravity","Graviy","Gyro","Mag","X","Y","Z")
#f <- function(cols,t1,t2){
#    
#    for (i in 1:length(t1) ) {
#        cols<-gsub(t1[i],"",cols)
#    }
#    cols
#}

#Code Book
#Read Me
#how created
#Instruction list to load
#how to read
    
    # Example code book: 
    # https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf 
    # Tidy data: http://vita.had.co.nz/papers/tidy-data.pdf

# Acc = Accelerometer
# Gyro = Gyroscope

setwd(fileDir)

# Load test data.
activityLabels <- read.table("./activity_labels.txt") 
features <- read.table("features.txt")
testData            <- read.table("./test/x_test.txt")
names(testData)     <- features$V2
testActivity        <- read.table("./test/y_test.txt")
names(testActivity) <- c("Activity")
testSubjects        <- read.table("./test/subject_test.txt")
names(testSubjects) <- c("Subject")
# Add Subject and Activity variables
test                <- cbind(testSubjects,testActivity,testData)

# Load training data.
trainData           <- read.table("./train/x_train.txt") 
names(trainData)     <- features$V2
trainActivity       <- read.table("./train/y_train.txt") 
names(trainActivity)<- c("Activity")
trainSubjects       <- read.table("./train/subject_train.txt")
names(trainSubjects)<- c("Subject")
# Add Subject and Activity variables
train               <- cbind(trainSubjects,trainActivity,trainData)

# Merge test and training data. Expected: 10299 rows by 563 columns.
merged <- rbind(test,train)

# Convert Activity code values to descriptive string values.
merged$Activity <- activityLabels[match(merged$Activity,activityLabels$V1),]$V2    

# Filter merged data on desired columns. Expected: 10299 rows by 68 columns.
columnIndex <- grep("Subject|Activity|mean\\(\\)|std\\(\\)",names(merged))
filtered <-merged[,columnIndex]

# Write merged means/sd variables to file.
write.table(filtered,file="merged_mean_sd_X_test_train.txt",row.names=FALSE)

# Average mean and sd values grouped by Subject and Activity.
library(dplyr)
grouped <- group_by(filtered,Subject,Activity)
means <- summarise_each(grouped,funs(mean))

# Prefix each mean and sd variable with "avg_" to capture
# that these are average values for the Subject and Activiy.
names(means)[3:length(means)]<-paste("avg_",names(means)[3:length(means)],sep="")

# Write average mean/sd to file.
write.table(means, file = "avg_merged_mean_sd_X_test_train.txt",row.names=FALSE)

}