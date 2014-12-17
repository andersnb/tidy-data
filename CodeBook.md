
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
For details on how the raw data was transformed, see the README.md file in this repository.

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

"timeBodyAccMeanX"
	
	mean acceleration of the body in the X-axis in the time domain

"timeBodyAccMeanY"
	
	mean acceleration of the body in the Y-axis in the time domain

"timeBodyAccMeanZ"
	
	mean acceleration of the body in the Z-axis in the time domain

"timeBodyAccStdX"
	
	standard deviation of the acceleration of the body in the X-axis in the time domain

"timeBodyAccStdY"
	
	standard deviation of the acceleration of the body in the Y-axis in the time domain

"timeBodyAccStdZ"
	
	standard deviation of the acceleration of the body in the Z-axis in the time domain

"timeGravityAccMeanX"
	
	mean acceleration due to gravity in the X-axis in the time domain

"timeGravityAccMeanY"
	
	mean acceleration due to gravity in the Y-axis in the time domain

"timeGravityAccMeanZ"
	
	mean acceleration due to gravity in the Z-axis in the time domain

"timeGravityAccStdX"
	
	standard deviation of acceleration due to gravity in the X-axis in the time domain

"timeGravityAccStdY"
	
	standard deviation of acceleration due to gravity in the Y-axis in the time domain

"timeGravityAccStdZ"
	
	standard deviation of acceleration due to gravity in the Z-axis in the time domain

"timeBodyAccJerkMeanX"
	
	mean jerk acceleration of the body in the X-axis in the time domain

"timeBodyAccJerkMeanY"
	
	mean jerk acceleration of the body in the Y-axis in the time domain

"timeBodyAccJerkMeanZ"
	
	mean jerk acceleration of the body in the Z-axis in the time domain

"timeBodyAccJerkStdX"
	
	standard deviation of jerk acceleration of the body in the X-axis in the time domain

"timeBodyAccJerkStdY"
	
	standard deviation of jerk acceleration of the body in the Y-axis in the time domain

"timeBodyAccJerkStdZ"
	
	standard deviation of jerk acceleration of the body in the Z-axis in the time domain

"timeBodyGyroMeanX"

	mean angular velocity of the body in the X-axis in the time domain

"timeBodyGyroMeanY"

	mean angular velocity of the body in the Y-axis in the time domain

"timeBodyGyroMeanZ"

	mean angular velocity of the body in the Z-axis in the time domain

"timeBodyGyroStdX"

	standard deviation of the angular velocity of the body in the X-axis in the time domain

"timeBodyGyroStdY"

	standard deviation of the angular velocity of the body in the Y-axis in the time domain

"timeBodyGyroStdZ"

	standard deviation of the angular velocity of the body in the Z-axis in the time domain

"timeBodyGyroJerkMeanX"

	mean jerk angular velocity of the body in the X-axis in the time domain

"timeBodyGyroJerkMeanY"

	mean jerk angular velocity of the body in the Y-axis in the time domain

"timeBodyGyroJerkMeanZ"

	mean jerk angular velocity of the body in the Z-axis in the time domain

"timeBodyGyroJerkStdX"

	standard deviation of the jerk angular velocity of the body in the X-axis in the time domain

"timeBodyGyroJerkStdY"

	standard deviation of the jerk angular velocity of the body in the Y-axis in the time domain

"timeBodyGyroJerkStdZ"

	standard deviation of the jerk angular velocity of the body in the Z-axis in the time domain

"timeBodyAccMagMean"

	mean of the magnitude of the acceleration of the body in the time domain

"timeBodyAccMagStd"

	standard deviation of the magnitude of the acceleration of the body in the time domain

"timeGravityAccMagMean"

	mean of the magnitude of the acceleration of gravity in the time domain

"timeGravityAccMagStd"

	standard deviation of the magnitude of the acceleration of gravity in the time domain

"timeBodyAccJerkMagMean"

	mean of the magnitude of the jerk acceleration of the body in the time domain

"timeBodyAccJerkMagStd"

	standard deviation of the magnitude of the jerk acceleration of the body in the time domain

"timeBodyGyroMagMean"

	mean of the magnitude of the angular velocity of the body in the time domain

"timeBodyGyroMagStd"

	standard deviation of the magnitude of the angular velocity of the body in the time domain

"timeBodyGyroJerkMagMean"

	mean of the magnitude of the jerk angular velocity of the body in the time domain

"timeBodyGyroJerkMagStd"

	standard deviation of the magnitude of the jerk angular velocity of the body in the time domain

"freqBodyAccMeanX"
       
        mean acceleration of the body in the X-axis in the frequency domain

"freqBodyAccMeanY"
       
        mean acceleration of the body in the Y-axis in the frequency domain

"freqBodyAccMeanZ"
       
        mean acceleration of the body in the Z-axis in the frequency domain

"freqBodyAccStdX"
       
        standard deviation of the acceleration of the body in the X-axis in the frequency domain

"freqBodyAccStdY"
       
        standard deviation of the acceleration of the body in the Y-axis in the frequency domain

"freqBodyAccStdZ"
       
        standard deviation of the acceleration of the body in the Z-axis in the frequency domain

"freqBodyAccJerkMeanX"
       
        mean jerk acceleration of the body in the X-axis in the frequency domain

"freqBodyAccJerkMeanY"
       
        mean jerk acceleration of the body in the Y-axis in the frequency domain

"freqBodyAccJerkMeanZ"
       
        mean jerk acceleration of the body in the Z-axis in the frequency domain

"freqBodyAccJerkStdX"
        
        standard deviation of jerk acceleration of the body in the X-axis in the frequency domain

"freqBodyAccJerkStdY"
        
        standard deviation of jerk acceleration of the body in the Y-axis in the frequency domain

"freqBodyAccJerkStdZ"
        
        standard deviation of jerk acceleration of the body in the Z-axis in the frequency domain

"freqBodyGyroMeanX"

        mean angular velocity of the body in the X-axis in the frequency domain

"freqBodyGyroMeanY"

        mean angular velocity of the body in the Y-axis in the frequency domain

"freqBodyGyroMeanZ"

        mean angular velocity of the body in the Z-axis in the frequency domain

"freqBodyGyroStdX"

        standard deviation of the angular velocity of the body in the X-axis in the frequency domain

"freqBodyGyroStdY"

        standard deviation of the angular velocity of the body in the Y-axis in the frequency domain

"freqBodyGyroStdZ"

        standard deviation of the angular velocity of the body in the Z-axis in the frequency domain

"freqBodyAccMagMean"

        mean of the magnitude of the acceleration of the body in the frequency domain

"freqBodyAccMagStd"

        standard deviation of the magnitude of the acceleration of the body in the frequency domain

"freqBodyAccJerkMagMean"

        mean of the magnitude of the jerk acceleration of the body in the frequency domain

"freqBodyAccJerkMagStd"

        standard deviation of the magnitude of the jerk acceleration of the body in the frequency domain

"freqBodyGyroMagMean"

        mean of the magnitude of the angular velocity of the body in the frequency domain

"freqBodyGyroMagStd"

        standard deviation of the magnitude of the angular velocity of the body in the frequency domain

"freqBodyGyroJerkMagMean"

        mean of the magnitude of the jerk angular velocity of the body in the frequency domain

"freqBodyGyroJerkMagStd"

        standard deviation of the magnitude of the jerk angular velocity of the body in the frequency domain

