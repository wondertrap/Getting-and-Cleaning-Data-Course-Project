Codebook
========================================================

Data Set Information
----------------------

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


Attribute Information
------------------------

For each record in the dataset it is provided: 
 - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
 - Triaxial Angular velocity from the gyroscope. 
 - A 561-feature vector with time and frequency domain variables. 
 - Its activity label. 
 - An identifier of the subject who carried out the experiment.

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


### Variable Descriptions

? = x,y,z = X, Y or Z direction

| Variable | Description
-----------|-------------
| subject | Subject ID
| activity | The activity performed
| timeBodyAccelerometer-MEAN-? | Mean time for acceleration of body for ? direction
| timeGravityAccelerometer-MEAN-? | Mean time of acceleration of gravity for ? direction
| timeBodyAccelerometerJerk-MEAN-? | Mean time of body acceleration jerk for ? direction
| timeBodyGyroscope-MEAN-? | Mean body gyroscope measurement for ? direction
| timeBodyGyroscopeJerk-MEAN-? | Mean jerk signal of body for ? direction
| timeBodyAccelerometerMagnitude-MEAN | Mean magnitude of body Acc
| timeGravityAccelerometerMagnitude-MEAN | Mean gravity acceleration magnitude
| timeBodyAccelerometerJerkMagnitude-MEAN | Mean magnitude of body acceleration jerk
| timeBodyGyroscopeMagnitude-MEAN | Mean magnitude of body gyroscope measurement
| timeBodyGyroscopeJerkMagnitude-MEAN | Mean magnitude of body body gyroscope jerk measurement
| frequencyBodyAccelerometer-MEAN-? | Mean frequency of body acceleration for ? direction
| frequencyBodyAccelerometerJerk-MEAN-? | Mean frequency of body accerlation jerk for ? direction
| frequencyBodyGyroscope-MEAN-? | Mean frequency of body gyroscope measurement for ? direction
| frequencyBodyAccelerometerMagnitude-MEAN | Mean frequency of body acceleration magnitude
| frequencyBodyAccelerometerJerkMagnitude-MEAN | Mean frequency of body acceleration jerk magnitude
| frequencyBodyGyroscopeMagnitude-MEAN | Mean frequency of magnitude of body gyroscope measurement
| frequencyBodyGyroscopeJerkMagnitude-MEAN | Mean frequency of magnitude of body gyroscope jerk measurement

