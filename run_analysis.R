# Download the file
setwd("/Users/benchan/gitsrc/Getting and cleaning data/")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./Dataset.zip", method = "curl")

# Unzip the file
unzip(zipfile = "./Dataset.zip", exdir = "./data")

# Get the list of files
path <- file.path("./data", "UCI HAR Dataset")
files <- list.files(path = path, recursive = TRUE)
files

# Read the Activity files
dataActivityTest <- read.table(file = "data/UCI HAR Dataset/test/y_test.txt", header = FALSE)

dataActivityTrain <- read.table(file = "data/UCI HAR Dataset/train/y_train.txt", header = FALSE)

# Read the Subject files
dataSubjectTest <- read.table(file = "data/UCI HAR Dataset/test/subject_test.txt", header = FALSE)

dataSubjectTrain <- read.table(file = "data/UCI HAR Dataset/train/subject_train.txt", header = FALSE)

# Read the Features files
dataFeaturesTest <- read.table(file = "data/UCI HAR Dataset/test/X_test.txt", header = FALSE)

dataFeaturesTrain <- read.table(file = "data/UCI HAR Dataset/train/X_train.txt", header = FALSE)

# Concatenate the data tables by rows
dataActivity <- rbind(dataActivityTrain, dataActivityTest)

dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)

dataFeatures <- rbind(dataFeaturesTrain, dataFeaturesTest)

# Set names to variables
names(dataActivity) <- c("Activity")

names(dataSubject) <- c("Subject")

dataFeaturesNames <- read.table(file = "data/UCI HAR Dataset/features.txt", header = FALSE)

names(dataFeatures) <- dataFeaturesNames[, 2]

# Merges the training and the test sets to create one data set
Data <- cbind(dataFeatures, dataSubject, dataActivity)

# Subset Name of Features by measurements on the mean and standard deviation
subdataFeaturesNames <- dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]

# Extracts only the measurements on the mean and standard deviation for each measurement
selectNames <- c(as.character(subdataFeaturesNames), "Subject", "Activity")

Data <- subset(Data, select = selectNames)

# Read descriptive activity names from "activity_lables.txt"
# Uses descriptive activity names to name the activities in the data set
activityLables <- read.table(file = "data/UCI HAR Dataset/activity_labels.txt", header = FALSE)

Data$Activity <- factor(Data$Activity, labels = activityLables[, 2])

# Appropriately labels the data set with descriptive variable names
names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))

# Create a second, independent tidy data set with the average of each variable for each activity and each subject
library(plyr)
Data2 <- aggregate(. ~Subject + Activity, Data, mean)
Data2 <- Data2[order(Data2$Subject, Data2$Activity),]
write.table(Data2, file = "tidydata.txt",row.name=FALSE)
