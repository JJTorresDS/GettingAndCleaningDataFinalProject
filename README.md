# Getting and Cleaning Data - Final Project

This folder contains the final project for the "Getting and Cleaning Data" course.

## AverageVAlues.csv

This file contains the average "mean" and "standard deviation" measurements of each feature 
in the data set.

## Codebook.md

This file contains the codebook for the "AverageValues.csv" file.

## run_analysis.R

This script downloads data from  the following [link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
   This script is self contained and transforms the data to obtain the average value of each measurement for each subject and each activity. For further details on the involved steps, please refer to the "run_analysis.R" script.  

The R script performs the following actions:

1. Downloads the data set into the working directory.
2. Loads the train, test, activity and subject data sets.
3. Merges the the aforementioned data sets into one data frame.
4. Extracts keeps only the "Mean" and "Standard Deviation" measurements.
5. Loads the "features.txt" file to replace the "activity codes" with descriptive activity names.
6. Renames de variables with descriptive variable names.
7. Creates a tidy data set named "AverageValues.txt", with the average of each variable for each activity and each subject, and saves it in the active working directory.
