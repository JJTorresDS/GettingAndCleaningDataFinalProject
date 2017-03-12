
# Coursera - Getting and Cleaning Data Final Assignment
#set your working directory before proceeding 
#### Week 4 Assignment #####

#Set your working directory before proceeding

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

fileName <- "projectDataset.zip"

#Check if a file already exists, if not, download it
if(!file.exists(fileName)){
    download.file(url, fileName)
}

#Check if the there is an unzipped file named "UCI HAR Dataset", if there isnt, one, then unzip the file
if(!file.exists("UCI HAR Dataset")){
    unzip(fileName)
}

#Step 1: Merge the training and test sets ----

#Explore the files within the new "UCI" folder
dir("./UCI HAR Dataset")
#Exlore the train folder
dir("./UCI HAR Dataset/train")

#Explore the test folder
dir("./UCI HAR Dataset/test")

#load the "train.txt" and "test.txt" files from their
#corresponding folders
library(data.table)
train <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainSubj <- read.table("./UCI HAR Dataset/train/Subject_train.txt")
trainLab <- read.table("./UCI HAR Dataset/train/y_train.txt")

test <- read.table("./UCI HAR Dataset/test/X_test.txt")
testSubj <- read.table("./UCI HAR Dataset/test/Subject_test.txt")
testLab <- read.table("./UCI HAR Dataset/test/y_test.txt")

#create a train set with train, subject and activity label data
trainF <- cbind(trainSubj, trainLab, train)

#create a test set with test, subject and activity label data
testF <- cbind(testSubj, testLab, test)

library(dplyr)
#view the dimensions of the train and test set
dim(trainF)
dim(testF)
#compare the names of the columns to detect any possible mismatch
table(names(train) == names(test))

#merge the train and test set
full <- rbind(trainF, testF)

#compare the number of rows 
dim(full)[1] == nrow(train)+nrow(test)

#****** Step 1 of this assignment is now completed ********

#Step 2: Extract only the measurements on the mean and standard deviation for each measurement.----

#first we need to replace the current column names by the new column names
correctLabels <- read.table("./UCI HAR Dataset/features.txt")
head(correctLabels)
dim(correctLabels) # variable/feature names are in the second column
correctLabels[,2]
#update the variable names in the 'full' table
names(full) <- c("Subject", "Activity",as.character(correctLabels[,2]))
names(full)
#get the columns that reference the 'mean' or 'std'
#first print the values to check that the regexs are bringing back
#the correct results
grep(".*mean+[^Freq]|.*std()", names(full), value=T)

#now remove the 'value' parameter to store the numbers of the corresponding variables in the 'relevantVars' variable
relevantVars <- c(1,2,grep(".*mean+[^Freq]|.*std()", names(full)))

#store the result in a new data frame
fullMeanStd <- full[, relevantVars]
#take a glimpse at the result
glimpse(fullMeanStd)

#************* End of Step 2 ********************

#Step 3: Use desciptive activity names to name the activities in the set ----

#load the activity names file into a data frame
activityNames <- read.table("./UCI HAR Dataset/activity_labels.txt")
head(activityNames)
head(names(fullMeanStd))
#map the activity names by code number to the fullYSubj df
class(fullMeanStd$Activity)
class(activityNames$V1)

fullGoodLabels <- left_join(fullMeanStd,activityNames, by=c("Activity"="V1"))

fullGoodLabels$Activity <- fullGoodLabels$V2
fullGoodLabels$V2 <- NULL

#****** End of Step 3****************

#Step 4: Appropriately label de data set with descriptive variable names ----

#Handle "mean" column names
newnames <- gsub(".-mean(.*)+)|.-mean(.*)+-", "Mean",names(fullGoodLabels))
newnames

#Handle "std" column names
newnames <- gsub(".-std(.*)+-|.-std(.*)+)", "STD", newnames)
#replace the names of the full data frame
newnames
names(fullGoodLabels) <- newnames
names(fullGoodLabels)

#********* End of Step 4 **********

#Step 5: Average activity values ----
#From step 4, create a second independent tidy data set with the average of each variable for each activity and each subject.
library(reshape2)
names(fullGoodLabels)
#create a molten data frame to carry one row per measure using the
# "Subject" and "Activity" fields as the id
fullMolten <- melt(fullGoodLabels, id=c("Subject","Activity"))
dim(fullMolten)

#now, use the dcast function to create wide date set that contains
#the average value of each of the variables per unique identifier

fullMean <- dcast(fullMolten, Subject + Activity ~variable, mean)

write.csv(fullMean, "AverageValues.csv", row.names = F)

#*********** End of final Assignment **********