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
data_test <- read.table("./UCI HAR Dataset/test/X_test.txt")

#
# read in the test subject ids
#
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
names(subject_test) <- c("subject")

#
# read in the test activity ids
#
activity_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
names(activity_test) <- c("activity")

#
# combine the subjects, activities, and data
#
df_test <- cbind(subject_test, activity_test, data_test)

#
# now read in the training data
#
data_train <- read.table("./UCI HAR Dataset/train/X_train.txt")

#
# read in the training subject ids
#
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
names(subject_train) <- c("subject")

#
# read in the training activity ids
#
activity_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
names(activity_train) <- c("activity")

#
# combine the subjects, activities, and data
#
df_train <- cbind(subject_train, activity_train, data_train)

#
# now combine the test and training data frames
#
df_all <- rbind(df_test, df_train)

#
# Now keep only the mean and std. dev. variables.
# I chose variables that had the name "mean" in them and also had an
# associated standard deviation ("std") with them. I ignored other
# columns with the name "mean" in them that didn't have an associated
# standard deviation column with them. This approach resulted in 66
# variables.
#
#
df_mean_std <- df_all[, c("subject", "activity", "V1", "V2", "V3", "V4", "V5", "V6", "V41", "V42", "V43", "V44", "V45", "V46", "V81", "V82", "V83", "V84", "V85", "V86", "V121", "V122", "V123", "V124", "V125", "V126", "V161", "V162", "V163", "V164", "V165", "V166", "V201", "V202", "V214", "V215", "V227", "V228", "V240", "V241", "V253", "V254", "V266", "V267", "V268", "V269", "V270", "V271", "V345", "V346", "V347", "V348", "V349", "V350", "V424", "V425", "V426", "V427", "V428", "V429", "V503", "V504", "V516", "V517", "V529", "V530", "V542", "V543")]

#
# replace activity numbers with strings
#
activity_labels <- read.table("/Users/andersnb/Downloads/coursera/UCI HAR Dataset/activity_labels.txt", stringsAsFactors=FALSE)
for (i in 1:nrow(activity_labels)) {
    df_mean_std$activity <- sub(activity_labels$V1[i], activity_labels$V2[i], 
                                df_mean_std$activity)
}

#
# modify column/variable names to be descriptive and be tidy (remove parens
# and dashes)
#
colnames(df_mean_std) = c("subject", "activity", "timeBodyAccMeanX", "timeBodyAccMeanY", "timeBodyAccMeanZ", "timeBodyAccStdX", "timeBodyAccStdY", "timeBodyAccStdZ", "timeGravityAccMeanX", "timeGravityAccMeanY", "timeGravityAccMeanZ", "timeGravityAccStdX", "timeGravityAccStdY", "timeGravityAccStdZ", "timeBodyAccJerkMeanX", "timeBodyAccJerkMeanY", "timeBodyAccJerkMeanZ", "timeBodyAccJerkStdX", "timeBodyAccJerkStdY", "timeBodyAccJerkStdZ", "timeBodyGyroMeanX", "timeBodyGyroMeanY", "timeBodyGyroMeanZ", "timeBodyGyroStdX", "timeBodyGyroStdY", "timeBodyGyroStdZ", "timeBodyGyroJerkMeanX", "timeBodyGyroJerkMeanY", "timeBodyGyroJerkMeanZ", "timeBodyGyroJerkStdX", "timeBodyGyroJerkStdY", "timeBodyGyroJerkStdZ", "timeBodyAccMagMean", "timeBodyAccMagStd", "timeGravityAccMagMean", "timeGravityAccMagStd", "timeBodyAccJerkMagMean", "timeBodyAccJerkMagStd", "timeBodyGyroMagMean", "timeBodyGyroMagStd", "timeBodyGyroJerkMagMean", "timeBodyGyroJerkMagStd", "freqBodyAccMeanX", "freqBodyAccMeanY", "freqBodyAccMeanZ", "freqBodyAccStdX", "freqBodyAccStdY", "freqBodyAccStdZ", "freqBodyAccJerkMeanX", "freqBodyAccJerkMeanY", "freqBodyAccJerkMeanZ", "freqBodyAccJerkStdX", "freqBodyAccJerkStdY", "freqBodyAccJerkStdZ", "freqBodyGyroMeanX", "freqBodyGyroMeanY", "freqBodyGyroMeanZ", "freqBodyGyroStdX", "freqBodyGyroStdY", "freqBodyGyroStdZ", "freqBodyAccMagMean", "freqBodyAccMagStd", "freqBodyBodyAccJerkMagMean", "freqBodyBodyAccJerkMagStd", "freqBodyBodyGyroMagMean", "freqBodyBodyGyroMagStd", "freqBodyBodyGyroJerkMagMean", "freqBodyBodyGyroJerkMagStd")
#
# reshape and summarize data
# NOTE: I'm creating the "long" form of a tidy dataset rather than
# the "wide" form per Hadley Wickam's paper.
#

#
# first, I melt the columns
#
df_melted <- melt(df_mean_std, id.vars=c("subject", "activity"))

#
# now create a tbl_df (part of the dplyr package) in
# order to use the group_by and summarize dplyr functions
#
df_mean_std_tbl <- tbl_df(df_melted)
df_grouped <- group_by(df_mean_std_tbl, subject, activity, variable)

#
# create our final data frame by calculating the mean for
# each grouping of subject and activity, which results in
# a data frame with dimensions 11880 x 4; this matches what
# we would expect since there are 30 subjects x 6 activities x 66 variables
#
df_summary <- summarize(df_grouped, mean(value))

#
# write out the final dataset
#
write.table(df_summary, "tidy-data.txt", row.name=FALSE)
