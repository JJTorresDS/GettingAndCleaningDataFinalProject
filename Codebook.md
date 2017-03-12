
# Code Book

This codebook summarizes the fields present in the "AverageValues.csv" file.

## Feature Description

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals 
tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant 
rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter 
with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into 
body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth 
filter with a corner frequency of 0.3 Hz. 

A Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, 
fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Within the "AverageValues.csv" file, only the "mean" and standard deviations of each feature were kept.



## Subjects and Activity Labels

* "Subject" : ID of the test subject
* "Activity" : Activity that was being performed when the measurements were taken.

## Measurement Names

* "tBodyAcMeanX"
* "tBodyAcMeanY"
* "tBodyAcMeanZ"
* "tBodyAcSTDX"
* "tBodyAcSTDY"
* "tBodyAcSTDZ"
* "tGravityAcMeanX"
* "tGravityAcMeanY"
* "tGravityAcMeanZ"
* "tGravityAcSTDX"
* "tGravityAcSTDY"
* "tGravityAcSTDZ"
* "tBodyAccJerMeanX"
* "tBodyAccJerMeanY"
* "tBodyAccJerMeanZ"
* "tBodyAccJerSTDX"
* "tBodyAccJerSTDY"
* "tBodyAccJerSTDZ"
* "tBodyGyrMeanX"
* "tBodyGyrMeanY"
* "tBodyGyrMeanZ"
* "tBodyGyrSTDX"
* "tBodyGyrSTDY"
* "tBodyGyrSTDZ"
* "tBodyGyroJerMeanX"
* "tBodyGyroJerMeanY"
* "tBodyGyroJerMeanZ"
* "tBodyGyroJerSTDX"
* "tBodyGyroJerSTDY"
* "tBodyGyroJerSTDZ"
* "tBodyAccMaMean"
* "tBodyAccMaSTD"
* "tGravityAccMaMean"
* "tGravityAccMaSTD"
* "tBodyAccJerkMaMean"
* "tBodyAccJerkMaSTD"
* "tBodyGyroMaMean"
* "tBodyGyroMaSTD"
* "tBodyGyroJerkMaMean"
* "tBodyGyroJerkMaSTD"
* "fBodyAcMeanX"
* "fBodyAcMeanY"
* "fBodyAcMeanZ"
* "fBodyAcSTDX"
* "fBodyAcSTDY"
* "fBodyAcSTDZ"
* "fBodyAccJerMeanX"
* "fBodyAccJerMeanY"
* "fBodyAccJerMeanZ"
* "fBodyAccJerSTDX"
* "fBodyAccJerSTDY"
* "fBodyAccJerSTDZ"
* "fBodyGyrMeanX"
* "fBodyGyrMeanY"
* "fBodyGyrMeanZ"
* "fBodyGyrSTDX"
* "fBodyGyrSTDY"
* "fBodyGyrSTDZ"
* "fBodyAccMaMean"
* "fBodyAccMaSTD"
* "fBodyBodyAccJerkMaMean"
* "fBodyBodyAccJerkMaSTD"
* "fBodyBodyGyroMaMean"
* "fBodyBodyGyroMaSTD"
* "fBodyBodyGyroJerkMaMean"
* "fBodyBodyGyroJerkMaSTD"