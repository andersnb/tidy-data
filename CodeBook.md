
#		Code Book for Wearable Computing Dataset
Bill Anderson
15Dec2014

## Origin of Data

Human Activity Recognition Using Smartphones Dataset
Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit<E0> degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

For more information about this dataset contact: activityrecognition@smartlab.ws

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

## Data Ingest and Transformations
Below are the steps that were used to read and transform the data.

1. The test data values (contained in "test/X_test.txt") were read in.

2. The test subject ids (contained in "test/subject_test.txt") were read in.

3. The test activity ids (contained in "test/y_test.txt") were read in.

4. The test data, subject, and activity values were combined using the R
   *cbind* function.

5. The training data values (contained in "train/X_train.txt") were read in.

6. The training subject ids (contained in "train/subject_train.txt") were
   read in.

7. The training activity ids (contained in "train/y_train.txt") were read in.

8. The training data, subject, and activity values were combined using the
   R *cbind* function.

9. The test and training data frames were combined using the R *rbind*
   function.

10. Only the mean and standard deviation variables were kept from the 
    combined data frame.  I chose the variables that had the word "mean"
    in them and that also had an associated standard deviation plus the
    standard deviation values themselves.
    
11. Next, the activity ids were replaced with their character labels using
    the R *sub* function.

12. Then, the column/variable names were renamed to be more descriptive.

13. Next, the data was reshaped by melting the variables into two columns
    (the variable name and the variable value) to create a long tidy data
    set per Hadley Wickham's paper on tidy data(**http://vita.had.co.nz/papers/tidy-data.pdf**).

14. Then, the data was grouped by subject and activity and the mean of
    all the combinations of subject, activity, and variable, were calculated
    using the *summarize* function.

15. Finally, the data was written out using the *write.table* function.
    
## Reading in the Data
The following R command can be used to read in the tidy dataset to a data frame:

df <- read.table("tidy-data.txt", header=TRUE)

## Column Descriptions

**column 1:** *"subject"*      The id of the subject(person) who was wearing the
                         device when the measurements were taken. Ranges 
                         from 1 to 30.

**column 2:** *"activity"*     The name of the activity performed by the subject. Contains one of the following six labels: "WALKING
"
                         "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", 
                         "STANDING", "LAYING".

**column 3:** *"variable"*     The name of the measurement taken. The possible 
                         variables are described below.

**column 4:** *"mean(value)"*  The mean of the variable measured for the subject 
                         and activity of the row. Note that all values are
                         normalized to be in the range of -1 to 1 and there
                         are no units (according to the class TA).


### Variable Descriptions (column 3)
**Note: In the original dataset, all values were normalized to be in the range of -1 to 1 and there are no units (according to the class TA).**

"tBodyAcc-mean()-X"
	
	mean acceleration of the body in the X-axis in the time domain

"tBodyAcc-mean()-Y"
	
	mean acceleration of the body in the Y-axis in the time domain

"tBodyAcc-mean()-Z"
	
	mean acceleration of the body in the Z-axis in the time domain

"tBodyAcc-std()-X"
	
	standard deviation of the acceleration of the body in the X-axis in the time domain

"tBodyAcc-std()-Y"
	
	standard deviation of the acceleration of the body in the Y-axis in the time domain

"tBodyAcc-std()-Z"
	
	standard deviation of the acceleration of the body in the Z-axis in the time domain

"tGravityAcc-mean()-X"
	
	mean acceleration due to gravity in the X-axis in the time domain

"tGravityAcc-mean()-Y"
	
	mean acceleration due to gravity in the Y-axis in the time domain

"tGravityAcc-mean()-Z"
	
	mean acceleration due to gravity in the Z-axis in the time domain

"tGravityAcc-std()-X"
	
	standard deviation of acceleration due to gravity in the X-axis in the time domain

"tGravityAcc-std()-Y"
	
	standard deviation of acceleration due to gravity in the Y-axis in the time domain

"tGravityAcc-std()-Z"
	
	standard deviation of acceleration due to gravity in the Z-axis in the time domain

"tBodyAccJerk-mean()-X"
	
	mean jerk acceleration of the body in the X-axis in the time domain

"tBodyAccJerk-mean()-Y"
	
	mean jerk acceleration of the body in the Y-axis in the time domain

"tBodyAccJerk-mean()-Z"
	
	mean jerk acceleration of the body in the Z-axis in the time domain

"tBodyAccJerk-std()-X"
	
	standard deviation of jerk acceleration of the body in the X-axis in the time domain

"tBodyAccJerk-std()-Y"
	
	standard deviation of jerk acceleration of the body in the Y-axis in the time domain

"tBodyAccJerk-std()-Z"
	
	standard deviation of jerk acceleration of the body in the Z-axis in the time domain

"tBodyGyro-mean()-X"

	mean angular velocity of the body in the X-axis in the time domain

"tBodyGyro-mean()-Y"

	mean angular velocity of the body in the Y-axis in the time domain

"tBodyGyro-mean()-Z"

	mean angular velocity of the body in the Z-axis in the time domain

"tBodyGyro-std()-X"

	standard deviation of the angular velocity of the body in the X-axis in the time domain

"tBodyGyro-std()-Y"

	standard deviation of the angular velocity of the body in the Y-axis in the time domain

"tBodyGyro-std()-Z"

	standard deviation of the angular velocity of the body in the Z-axis in the time domain

"tBodyGyroJerk-mean()-X"

	mean jerk angular velocity of the body in the X-axis in the time domain

"tBodyGyroJerk-mean()-Y"

	mean jerk angular velocity of the body in the Y-axis in the time domain

"tBodyGyroJerk-mean()-Z"

	mean jerk angular velocity of the body in the Z-axis in the time domain

"tBodyGyroJerk-std()-X"

	standard deviation of the jerk angular velocity of the body in the X-axis in the time domain

"tBodyGyroJerk-std()-Y"

	standard deviation of the jerk angular velocity of the body in the Y-axis in the time domain

"tBodyGyroJerk-std()-Z"

	standard deviation of the jerk angular velocity of the body in the Z-axis in the time domain

"tBodyAccMag-mean()"

	mean of the magnitude of the acceleration of the body in the time domain

"tBodyAccMag-std()"

	standard deviation of the magnitude of the acceleration of the body in the time domain

"tGravityAccMag-mean()"

	mean of the magnitude of the acceleration of gravity in the time domain

"tGravityAccMag-std()"

	standard deviation of the magnitude of the acceleration of gravity in the time domain

"tBodyAccJerkMag-mean()"

	mean of the magnitude of the jerk acceleration of the body in the time domain

"tBodyAccJerkMag-std()"

	standard deviation of the magnitude of the jerk acceleration of the body in the time domain

"tBodyGyroMag-mean()"

	mean of the magnitude of the angular velocity of the body in the time domain

"tBodyGyroMag-std()"

	standard deviation of the magnitude of the angular velocity of the body in the time domain

"tBodyGyroJerkMag-mean()"

	mean of the magnitude of the jerk angular velocity of the body in the time domain

"tBodyGyroJerkMag-std()"

	standard deviation of the magnitude of the jerk angular velocity of the body in the time domain

"fBodyAcc-mean()-X"
       
        mean acceleration of the body in the X-axis in the frequency domain

"fBodyAcc-mean()-Y"
       
        mean acceleration of the body in the Y-axis in the frequency domain

"fBodyAcc-mean()-Z"
       
        mean acceleration of the body in the Z-axis in the frequency domain

"fBodyAcc-std()-X"
       
        standard deviation of the acceleration of the body in the X-axis in the frequency domain

"fBodyAcc-std()-Y"
       
        standard deviation of the acceleration of the body in the Y-axis in the frequency domain

"fBodyAcc-std()-Z"
       
        standard deviation of the acceleration of the body in the Z-axis in the frequency domain

"fBodyAccJerk-mean()-X"
       
        mean jerk acceleration of the body in the X-axis in the frequency domain

"fBodyAccJerk-mean()-Y"
       
        mean jerk acceleration of the body in the Y-axis in the frequency domain

"fBodyAccJerk-mean()-Z"
       
        mean jerk acceleration of the body in the Z-axis in the frequency domain

"fBodyAccJerk-std()-X"
        
        standard deviation of jerk acceleration of the body in the X-axis in the frequency domain

"fBodyAccJerk-std()-Y"
        
        standard deviation of jerk acceleration of the body in the Y-axis in the frequency domain

"fBodyAccJerk-std()-Z"
        
        standard deviation of jerk acceleration of the body in the Z-axis in the frequency domain

"fBodyGyro-mean()-X"

        mean angular velocity of the body in the X-axis in the frequency domain

"fBodyGyro-mean()-Y"

        mean angular velocity of the body in the Y-axis in the frequency domain

"fBodyGyro-mean()-Z"

        mean angular velocity of the body in the Z-axis in the frequency domain

"fBodyGyro-std()-X"

        standard deviation of the angular velocity of the body in the X-axis in the frequency domain

"fBodyGyro-std()-Y"

        standard deviation of the angular velocity of the body in the Y-axis in the frequency domain

"fBodyGyro-std()-Z"

        standard deviation of the angular velocity of the body in the Z-axis in the frequency domain

"fBodyAccMag-mean()"

        mean of the magnitude of the acceleration of the body in the frequency domain

"fBodyAccMag-std()"

        standard deviation of the magnitude of the acceleration of the body in the frequency domain

"fBodyBodyAccJerkMag-mean()"

        mean of the magnitude of the jerk acceleration of the body in the frequency domain

"fBodyBodyAccJerkMag-std()"

        standard deviation of the magnitude of the jerk acceleration of the body in the frequency domain

"fBodyBodyGyroMag-mean()"

        mean of the magnitude of the angular velocity of the body in the frequency domain

"fBodyBodyGyroMag-std()"

        standard deviation of the magnitude of the angular velocity of the body in the frequency domain

"fBodyBodyGyroJerkMag-mean()"

        mean of the magnitude of the jerk angular velocity of the body in the frequency domain

"fBodyBodyGyroJerkMag-std()"

        standard deviation of the magnitude of the jerk angular velocity of the body in the frequency domain

