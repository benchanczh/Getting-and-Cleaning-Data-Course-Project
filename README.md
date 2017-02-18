# Getting-and-Cleaning-Data-Course-Project
This is the course project for the Getting and Cleaning Data Coursera course. The R script, run_analysis.R, does the following:

###1.Download the file and put the file in the data folder

###2.Unzip the file

###3.unzipped files are in the folderUCI HAR Dataset.

  * Values of Varible Activity consist of data from “Y_train.txt” and “Y_test.txt”

  * Values of Varible Subject consist of data from “subject_train.txt” and subject_test.txt"

  * Values of Varibles Features consist of data from “X_train.txt” and “X_test.txt”

  * Names of Varibles Features come from “features.txt”

  * Levels of Varible Activity come from “activity_labels.txt”

###4.Read data from the files into the variables

###5.Subset Name of Features by measurements on the mean and standard deviation

###6.Subset the data frame Data by seleted names of Features

###7.Check the structures of the data frame Data

###8.Read descriptive activity names from “activity_labels.txt”

###9.facorize Variale activity in the data frame Data using descriptive activity names

###10.In the former part, variables activity and subject and names of the activities have been labelled using descriptive names.In this part, Names of Feteatures will labelled using descriptive variable names.

  * prefix t is replaced by time

  * Acc is replaced by Accelerometer

  * Gyro is replaced by Gyroscope

  * prefix f is replaced by frequency

  * Mag is replaced by Magnitude

  * BodyBody is replaced by Body

###11.Creates a second,independent tidy data set and ouput it as "tidydata.txt"
