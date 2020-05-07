# run_analysis.R

# calling library
library(reshape2)

#1. Get dataset from web
filename <- "getdata_dataset.zip"
if (!file.exists(filename)){
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileURL, filename, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
        unzip(filename) 
}

#2. Merges the training and the test sets to create one data set
# Activity labels & features
activLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activLabels[,2] <- as.character(activLabels[,2])
feat <- read.table("UCI HAR Dataset/features.txt")
feat[,2] <- as.character(feat[,2])

# Extract mean and standard deviation
featSelection <- grep(".*mean.*|.*std.*", feat[,2])
featSelection.names <- feat[featSelection,2]
featSelection.names = gsub('-mean', 'Mean', featSelection.names)
featSelection.names = gsub('-std', 'Std', featSelection.names)
featSelection.names <- gsub('[-()]', '', featSelection.names)

# Loading datasets
train <- read.table("UCI HAR Dataset/train/X_train.txt")[featSelection]
trainActiv <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainSubj <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(trainSubj, trainActiv, train)

test <- read.table("UCI HAR Dataset/test/X_test.txt")[featSelection]
testActiv <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSubj <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(testSubj, testActiv, test)

# final merge datasets & labels
Dataasone <- rbind(train, test)
colnames(Dataasone) <- c("subject", "activity", featSelection.names)

