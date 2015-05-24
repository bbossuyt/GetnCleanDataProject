# GetnCleanDataProject
Course Project for Coursera Getting and Cleaning Data Class
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Getting and Cleaning Data Course Project
Version 1.0
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Bernard Bossuyt, Student
https://github.com/bbossuyt/Getting_and_Cleaning_Data_Project/
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
This ReadMe file describes my interpretation of the assignment
and of the data that was provided for processing.

The original project information is available at this website:
https://class.coursera.org/getdata-014/human_grading/view/courses/
973501/assessments/3/submissions

The original data came from https://d396qusza40orc.cloudfront.net
/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. The POCs can be 
reached at: activityrecognition@smartlab.ws. Details there go deeper 
than is needed to understand the objectives of this project.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Interpretation of the description of the experiments:
=====================================================

30 subjects volunteered to conduct the experiments. No names are
provided, there are assigned numbers 1-30.
--21 were randomly selected to be grouped for forming the 
training data.
--the other 9 were then grouped to form the test data.

There were six activities (WALKING, WALKING_UPSTAIRS, 
WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) conducted.

Thousands of measurements were taken as subjects performed
multiple activities.

 
Information about the data files:
=========================================
** Important: don't confuse files whose names begin with "X_" and
"Y_" as trying to create an X-Y axis mapping!! They do NOT.

- Test and Train data follow the same description (remember, that
subjects were picked at random to create the two groups).

- Files that begin with "X_" are the actual measurements from each
experiment.

- The file "features.txt" lists the different kinds of measurements taken.
It is used to provide column labels to the "X_" files.

- Files that begin with "Y_" lists the activity (ex: WALKING) that
was performed during the corresponding experiment. They have numbers
which are mapped to the descriptive names in "activity_labels.txt".

- Files that begin with "subject_" lists the number (1-30) of the
volunteer that performed the corresponding experiment. There is no
mapping to subjects' names.


Project objective:
===========================================
Goal of this project is to achieve 'tidy Data' so that we can do
statistical analysis by subject and by activity. This requires 
binding the contents of the "Y_" and "subject_" files with the 
corresponding experiment measurements ("X_" files).

Project deliverables:
============================================
1. 'Tidy data set' with the average of each mean and standard 
deviation variable for each activity and each subject.
2. Github repository with the script for performing the analysis.
3. Code book that describes the variables, the data, and the
transformations and work performed to clean up the data.

How the script works:
=============================================
The script has numerous comments so additional details are there.
The script also has numerous 'verification' steps that have been
commented out. Remove the hashtags if you wish to perform them.

Here is a summary of how the script works:
1. The numerous data files needed are pulled in using the 
read.table function in R.
2. Column headers are added to the measurements so we can select
the desired columns in a later step.
3. The human subject's number and the correct activity are 
linked to the experiment using the cbind function in R.
4. The test and train data tables are merged together via rbind.
5. The full data set is subsetted by selecting those measurement
columns with mean or std in their names.
6. Convert the activity numbers into the descriptive activity labels.
7. Calculate the mean of the measurements grouped by activity and 
subject.
8. Write the final 'tidy' data set to a file using write.table.
