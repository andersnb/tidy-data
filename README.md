
#		README for Tidy Data Project
Bill Anderson
15Dec2014

This README describes the repository for the tidy version of the *Human Activity Recognition Using Smartphones Dataset*.  This version of the dataset was created for the *Coursera Getting and Cleaning Data* class taught by professors at The Johns Hopkins University.

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

## Data Ingest and Transformations and Description of How the **run_analysis.R** Script Works
The file **run_analysis.R** in this repository can be used to generate the tidy dataset from the raw dataset. Below are the steps that the script takes to read and transform the raw data.

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
    standard deviation variables themselves.
    
11. Next, the activity ids were replaced with their character labels using
    the R *sub* function.

12. Then, the column/variable names were renamed to be more descriptive and to remove characters that can be problematic when using the in R (e.g., parentheses, and underscores). However, I did keep and add some capital letters since I think they improve readability of variable names.

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
See the CodeBook.md file in this repository for details about the data values.
