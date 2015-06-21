# CodeBook.md

The data for each of the variables represents the mean of selected variables from the original data, which was obtained in an experiment carried out on a group of 30 people in ages 19-48. Each person performed six activities while wearing a smartphone, allowing acceleration and angular velocity signals to be captured and processed with signal filters and a fast fourier transform to compute different direction and frequency signals. See [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) for more information about the experiment.

From the original data set, I selected variables that had an embedded *mean-()* or *std-()* in the variable name, renamed these variables by replacing the embedded text with -MEAN or -STD, and then appended the text to the end of the string. In the original experiment, the data is divided into two sets, training and test data; however, the data that I selected is the combination of both data sets. Finally, for each unique (subject, activity) pair, I computed the mean of each feature.  Therefore, all the values of each feature listed below represent the mean of either the mean or standard deviation of the measurements in the original data.

**subject** [*factor*] -- The subject in the activity: 1 - 30.

**activity** [*factor*] -- The activity: STANDING, SITTING, LAYING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS.

**tBodyAccX-MEAN** [*numeric*] -- The mean of the time signal for body acceleration in the X direction.

**tBodyAccY-MEAN** [*numeric*] -- The mean of the time signal for body acceleration in the Y direction.

**tBodyAccZ-MEAN** [*numeric*] -- The mean of the time signal for body acceleration in the Z direction.

**tBodyAccX-STD** [*numeric*] -- The standard deviation of the time signal for body acceleration in the X direction.

**tBodyAccY-STD** [*numeric*] -- The standard deviation of the time signal for body acceleration in the Y direction.

**tBodyAccZ-STD** [*numeric*] -- The standard deviation of the time signal for body acceleration in the Z direction.

**tGravityAccX-MEAN** [*numeric*] -- The mean of the time signal for gravitational acceleration in the X direction.

**tGravityAccY-MEAN** [*numeric*] -- The mean of the time signal for gravitational acceleration in the Y direction.

**tGravityAccZ-MEAN** [*numeric*] -- The mean of the time signal for gravitational acceleration in the Z direction.

**tGravityAccX-STD** [*numeric*] -- The standard deviation of the time signal for gravitational acceleration in the X direction.

**tGravityAccY-STD** [*numeric*] -- The standard deviation of the time signal for gravitational acceleration in the Y direction.

**tGravityAccZ-STD** [*numeric*] -- The standard deviation of the time signal for gravitational acceleration in the Z direction.

**tBodyAccJerkX-MEAN** [*numeric*] -- The mean of the time signal for jerk acceleration in the X direction.

**tBodyAccJerkY-MEAN** [*numeric*] -- The mean of the time signal for jerk acceleration in the Y direction.

**tBodyAccJerkZ-MEAN** [*numeric*] -- The mean of the time signal for jerk acceleration in the Z direction.

**tBodyAccJerkX-STD** [*numeric*] -- The standard deviation of the time signal for jerk acceleration in the X direction.

**tBodyAccJerkY-STD** [*numeric*] -- The standard deviation of the time signal for jerk acceleration in the Y direction.

**tBodyAccJerkZ-STD** [*numeric*] -- The standard deviation of the time signal for jerk acceleration in the Z direction.

**tBodyGyroX-MEAN** [*numeric*] -- The mean of the time signal for the angular velocity from the gyroscope in the X direction.

**tBodyGyroY-MEAN** [*numeric*] -- The mean of the time signal for the angular velocity from the gyroscope in the Y direction.

**tBodyGyroZ-MEAN** [*numeric*] -- The mean of the time signal for the angular velocity from the gyroscope in the Z direction.

**tBodyGyroX-STD** [*numeric*] -- The standard deviation of the time signal for angular velocity from the gyroscope in the X direction.

**tBodyGyroY-STD** [*numeric*] -- The standard deviation of the time signal for angular velocity from the gyroscope in the Y direction.

**tBodyGyroZ-STD** [*numeric*] -- The standard deviation of the time signal for angular velocity from the gyroscope in the Z direction.

**tBodyGyroJerkX-MEAN** [*numeric*] -- The mean of the time signal for jerk angular velocity from the gyroscope in the X direction.

**tBodyGyroJerkY-MEAN** [*numeric*] -- The mean of the time signal for jerk angular velocity from the gyroscope in the Y direction.

**tBodyGyroJerkZ-MEAN** [*numeric*] -- The mean of the time signal for jerk angular velocity from the gyroscope in the Z direction.

**tBodyGyroJerkX-STD** [*numeric*] -- The standard deviation of the time signal for jerk angular velocity from the gyroscope in the X direction.

**tBodyGyroJerkY-STD** [*numeric*] -- The standard deviation of the time signal for jerk angular velocity from the gyroscope in the Y direction.

**tBodyGyroJerkZ-STD** [*numeric*] -- The standard deviation of the time signal for jerk angular velocity from the gyroscope in the Z direction.

**tBodyAccMag-MEAN** [*numeric*] -- The mean of the time signal for the magnitude of the body acceleration.

**tBodyAccMag-STD** [*numeric*] -- The standard deviation of the time signal for the magnitude of the body acceleration.

**tGravityAccMag-MEAN** [*numeric*] -- The mean of the time signal for the magnitude of the gravitational acceleration.

**tGravityAccMag-STD** [*numeric*] -- The standard deviation of the time signal for the magnitude of the gravitational acceleration.

**tBodyAccJerkMag-MEAN** [*numeric*] -- The mean of the time signal for the magnitude of the jerk body acceleration.

**tBodyAccJerkMag-STD** [*numeric*] -- The standard deviation of the time signal for the magnitude of the jerk body acceleration.

**tBodyGyroMag-MEAN** [*numeric*] -- The mean of the time signal for the magnitude of the angular velocity from the gyroscope.

**tBodyGyroMag-STD** [*numeric*] -- The standard deviation of the time signal for the magnitude of angular velocity from the gyroscope.

**tBodyGyroJerkMag-MEAN** [*numeric*] -- The mean of the time signal for the magnitude of the jerk angular velocity from the gyroscope.

**tBodyGyroJerkMag-STD** [*numeric*] -- The standard deviation of the time signal for the magnitude of the jerk angular velocity from the gyroscope.

**fBodyAccX-MEAN** [*numeric*] -- The mean of the frequency signal for body acceleration in the X direction.

**fBodyAccY-MEAN** [*numeric*] -- The mean of the frequency signal for body acceleration in the Y direction.

**fBodyAccZ-MEAN** [*numeric*] -- The mean of the frequency signal for body acceleration in the Z direction.

**fBodyAccX-STD** [*numeric*] -- The standard deviation of the frequency signal for body acceleration in the X direction.

**fBodyAccY-STD** [*numeric*] -- The standard deviation of the frequency signal for body acceleration in the Y direction.

**fBodyAccZ-STD** [*numeric*] -- The standard deviation of the frequency signal for body acceleration in the Z direction.

**fBodyAccJerkX-MEAN** [*numeric*] -- The mean of the frequency signal for jerk body acceleration in the X direction.

**fBodyAccJerkY-MEAN** [*numeric*] -- The mean of the frequency signal for jerk body acceleration in the Y direction.

**fBodyAccJerkZ-MEAN** [*numeric*] -- The mean of the frequency signal for jerk body acceleration in the Z direction.

**fBodyAccJerkX-STD** [*numeric*] -- The standard deviation of the frequency signal for jerk body acceleration in the X direction.

**fBodyAccJerkY-STD** [*numeric*] -- The standard deviation of the frequency signal for jerk body acceleration in the Y direction.

**fBodyAccJerkZ-STD** [*numeric*] -- The standard deviation of the frequency signal for jerk body acceleration in the Z direction.

**fBodyGyroX-MEAN** [*numeric*] -- The mean of the frequency signal for angular velocity from the gyroscope in the X direction.

**fBodyGyroY-MEAN** [*numeric*] -- The mean of the frequency signal for angular velocity from the gyroscope in the Y direction.

**fBodyGyroZ-MEAN** [*numeric*] -- The mean of the frequency signal for angular velocity from the gyroscope in the Z direction.

**fBodyGyroX-STD** [*numeric*] -- The standard deviation of the frequency signal for angular velocity from the gyroscope in the X direction.

**fBodyGyroY-STD** [*numeric*] -- The standard deviation of the frequency signal for angular velocity from the gyroscope in the Y direction.

**fBodyGyroZ-STD** [*numeric*] -- The standard deviation of the frequency signal for angular velocity from the gyroscope in the Z direction.

**fBodyAccMag-MEAN** [*numeric*] -- The mean of the frequency signal for the magnitude of the body acceleration.

**fBodyAccMag-STD** [*numeric*] -- The standard deviation of the frequency signal for the magnitude of the body acceleration.

**fBodyBodyAccJerkMag-MEAN** [*numeric*] -- The mean of the frequency signal for the magnitude of the jerk body acceleration.

**fBodyBodyAccJerkMag-STD** [*numeric*] -- The standard deviation of the frequency signal for the magnitude of the jerk body acceleration.

**fBodyBodyGyroMag-MEAN** [*numeric*] -- The mean of the frequency signal for the magnitude of the angular velocity from the gyroscope.

**fBodyBodyGyroMag-STD** [*numeric*] -- The standard deviation of the frequency signal for the magnitude of the angular velocity from the gyroscope.

**fBodyBodyGyroJerkMag-MEAN** [*numeric*] -- The mean of the frequency signal for the magnitude of the jerk angular velocity from the gyroscope.

**fBodyBodyGyroJerkMag-STD** [*numeric*] -- The mean of the frequency signal for the magnitude of the jerk angular velocity from the gyroscope.
