#
# Create Tidy Dataset for Coursera Data Cleaning Class
#
# modification history
# 11Dec2014  Bill Anderson  created
#
# to read in data created by this script:
# df <- read.table("tidy-data.txt", header=TRUE)
#
#
library(dplyr)
library(reshape2)

#
# first, read in the test dataset
#
dataTest <- read.table("./UCI HAR Dataset/test/X_test.txt")

#
# read in the test subject ids
#
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
names(subjectTest) <- c("subject")

#
# read in the test activity ids
#
activityTest <- read.table("./UCI HAR Dataset/test/y_test.txt")
names(activityTest) <- c("activity")

#
# combine the subjects, activities, and data
#
dfTest <- cbind(subjectTest, activityTest, dataTest)

#
# now read in the training data
#
dataTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")

#
# read in the training subject ids
#
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
names(subjectTrain) <- c("subject")

#
# read in the training activity ids
#
activityTrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
names(activityTrain) <- c("activity")

#
# combine the subjects, activities, and data
#
dfTrain <- cbind(subjectTrain, activityTrain, dataTrain)

#
# now combine the test and training data frames
#
dfAll <- rbind(dfTest, dfTrain)

#
# Now keep only the mean and std. dev. variables.
# I chose variables that had the name "mean" in them and also had an
# associated standard deviation ("std") with them. I ignored other
# columns with the name "mean" in them that didn't have an associated
# standard deviation column with them. This approach resulted in 66
# variables.
#
#
dfMeanStd <- dfAll[, c("subject", "activity", "V1", "V2", "V3", "V4", "V5", "V6", "V41", "V42", "V43", "V44", "V45", "V46", "V81", "V82", "V83", "V84", "V85", "V86", "V121", "V122", "V123", "V124", "V125", "V126", "V161", "V162", "V163", "V164", "V165", "V166", "V201", "V202", "V214", "V215", "V227", "V228", "V240", "V241", "V253", "V254", "V266", "V267", "V268", "V269", "V270", "V271", "V345", "V346", "V347", "V348", "V349", "V350", "V424", "V425", "V426", "V427", "V428", "V429", "V503", "V504", "V516", "V517", "V529", "V530", "V542", "V543")]

#
# replace activity numbers with strings
#
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors=FALSE)
for (i in 1:nrow(activityLabels)) {
    dfMeanStd$activity <- sub(activityLabels$V1[i], activityLabels$V2[i], 
                                dfMeanStd$activity)
}

#
# modify column/variable names to be descriptive and be tidy (remove parens
# and dashes)
#
colnames(dfMeanStd) = c("subject", "activity", "timeBodyAccMeanX", "timeBodyAccMeanY", "timeBodyAccMeanZ", "timeBodyAccStdX", "timeBodyAccStdY", "timeBodyAccStdZ", "timeGravityAccMeanX", "timeGravityAccMeanY", "timeGravityAccMeanZ", "timeGravityAccStdX", "timeGravityAccStdY", "timeGravityAccStdZ", "timeBodyAccJerkMeanX", "timeBodyAccJerkMeanY", "timeBodyAccJerkMeanZ", "timeBodyAccJerkStdX", "timeBodyAccJerkStdY", "timeBodyAccJerkStdZ", "timeBodyGyroMeanX", "timeBodyGyroMeanY", "timeBodyGyroMeanZ", "timeBodyGyroStdX", "timeBodyGyroStdY", "timeBodyGyroStdZ", "timeBodyGyroJerkMeanX", "timeBodyGyroJerkMeanY", "timeBodyGyroJerkMeanZ", "timeBodyGyroJerkStdX", "timeBodyGyroJerkStdY", "timeBodyGyroJerkStdZ", "timeBodyAccMagMean", "timeBodyAccMagStd", "timeGravityAccMagMean", "timeGravityAccMagStd", "timeBodyAccJerkMagMean", "timeBodyAccJerkMagStd", "timeBodyGyroMagMean", "timeBodyGyroMagStd", "timeBodyGyroJerkMagMean", "timeBodyGyroJerkMagStd", "freqBodyAccMeanX", "freqBodyAccMeanY", "freqBodyAccMeanZ", "freqBodyAccStdX", "freqBodyAccStdY", "freqBodyAccStdZ", "freqBodyAccJerkMeanX", "freqBodyAccJerkMeanY", "freqBodyAccJerkMeanZ", "freqBodyAccJerkStdX", "freqBodyAccJerkStdY", "freqBodyAccJerkStdZ", "freqBodyGyroMeanX", "freqBodyGyroMeanY", "freqBodyGyroMeanZ", "freqBodyGyroStdX", "freqBodyGyroStdY", "freqBodyGyroStdZ", "freqBodyAccMagMean", "freqBodyAccMagStd", "freqBodyAccJerkMagMean", "freqBodyAccJerkMagStd", "freqBodyGyroMagMean", "freqBodyGyroMagStd", "freqBodyGyroJerkMagMean", "freqBodyGyroJerkMagStd")
#
# reshape and summarize data
# NOTE: I'm creating the "long" form of a tidy dataset rather than
# the "wide" form per Hadley Wickam's paper.
#

#
# first, I melt the columns
#
dfMelted <- melt(dfMeanStd, id.vars=c("subject", "activity"))

#
# now create a tbl_df (part of the dplyr package) in
# order to use the group_by and summarize dplyr functions
#
dfMeanStdTbl <- tbl_df(dfMelted)
dfGrouped <- group_by(dfMeanStdTbl, subject, activity, variable)

#
# create our final data frame by calculating the mean for
# each grouping of subject and activity, which results in
# a data frame with dimensions 11880 x 4; this matches what
# we would expect since there are 30 subjects x 6 activities x 66 variables
#
dfSummary <- summarize(dfGrouped, mean(value))
names(dfSummary) <- c("subject", "activity", "variable", "mean")

#
# write out the final dataset
#
write.table(dfSummary, "tidy-data.txt", row.name=FALSE)
