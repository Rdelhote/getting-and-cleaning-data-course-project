### Getting and Cleaning Data

### Coursera Course Project - Week 4

### Adjustments to original downloaded original

Merging the training and the test sets to create one data set.
Extracting only the measurements on the mean and standard deviation for each measurement.
Using descriptive activity names to name the activities in the data set
Appropriately labeling the data set with descriptive variable names.
Creating a second, independent tidy data set with the average of each variable for each activity and each subject.

### Identifiers
#### Subject: integer, ranges from 1 to 30.

#### Activity: 6-variables string:

- WALKING: subject was walking
- WALKING_UPSTAIRS: subject was walking upstairs
- WALKING_DOWNSTAIRS: subject was walking downstairs
- SITTING: subject was sitting
- STANDING: subject was standing
- LAYING: subject was laying

### Measurements
The results of the calculations are means and standard deviations of the previously merged dataset and the re-naming of the original columns.
The final dataset has been put together with the average of each variable for each activity and each subject.
The source data, calculations and the adjustments have been done by the run_analysis.R R script (see README.md to know more).

