## Code Book
### The Data
#### From Original Data Summary:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

#### Clean Data:
For the clean data, the training and test sets were combined, only measurements on mean and standard deviation were extracted,
descriptive activity names were provides, and descriptive variable names were provided.
Finally create a tidy data set which contains the average for each variable for each subject 
and each activity the data is grouped by subject and activity. Then the average is
calculated for each variable for each group.
See README.md for specifics of procedures used to clean the data.

### Variables
subject
```
Identifies the subject who performed the activity for each sample. 
Its range is from 1 to 30.
```

activity
```
Identifies the activity being performed during the sample.
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
```

timebodyaccelerationmeanxaxis,
timebodyaccelerationmeanyaxis,
timebodyaccelerationmeanzaxis
```
Mean value of the time body acceleration on the x, y, and z axis
normalized and bounded within [-1,1]
```

timebodyaccelerationstandarddeviationxaxis,
timebodyaccelerationstandarddeviationyaxis,
timebodyaccelerationstandarddeviationzaxis
```
Standard deviation of the time body acceleration on the x, y, and z axis
normalized and bounded within [-1,1]
```

timegravityaccelerationmeanxaxis,
timegravityaccelerationmeanyaxis,
timegravityaccelerationmeanzaxis
```
Mean value of the time gravity acceleration on the x, y, and z axis
normalized and bounded within [-1,1]
```

timegravityaccelerationstandarddeviationxaxis,
timegravityaccelerationstandarddeviationyaxis,
timegravityaccelerationstandarddeviationzaxis
```
Standard deviation of the time gravity acceleration on the x, y, and z axis
normalized and bounded within [-1,1]
```

timebodyaccelerationjerkmeanxaxis,
timebodyaccelerationjerkmeanyaxis,
timebodyaccelerationjerkmeanzaxis
```
Mean value of the time body acceleration jerk on the x, y, and z axis
normalized and bounded within [-1,1]
```

timebodyaccelerationjerkstandarddeviationxaxis,
timebodyaccelerationjerkstandarddeviationyaxis,
timebodyaccelerationjerkstandarddeviationzaxis
```
Standard deviation of the time body acceleration jerk on the x, y, and z axis
normalized and bounded within [-1,1]
```

timebodygyromeanxaxis,
timebodygyromeanyaxis,
timebodygyromeanzaxis
```
Mean value of the time body gyro acceleration on the x, y, and z axis
normalized and bounded within [-1,1]
```

timebodygyrostandarddeviationxaxis,
timebodygyrostandarddeviationyaxis,
timebodygyrostandarddeviationzaxis
```
Standard deviation of the time body gyro on the x, y, and z axis
normalized and bounded within [-1,1]
```

timebodygyrojerkmeanxaxis,
timebodygyrojerkmeanyaxis,
timebodygyrojerkmeanzaxis
```
Mean value of the time body gyro jerk acceleration on the x, y, and z axis
normalized and bounded within [-1,1]
```

timebodygyrojerkstandarddeviationxaxis,
timebodygyrojerkstandarddeviationyaxis,
timebodygyrojerkstandarddeviationzaxis
```
Standard deviation of the time body gyro jerk on the x, y, and z axis
normalized and bounded within [-1,1]
```

timebodyaccelerationmagnitudemean
```
Mean value of time body acceleration magnitude
normalized and bounded within [-1,1]
```

timebodyaccelerationmagnitudestandarddeviation
```
Standard deviation of time body acceleration magnitude
normalized and bounded within [-1,1]
```

timegravityaccelerationmagnitudemean
```
Mean value of time gravity acceleration magnitude
normalized and bounded within [-1,1]
```

timegravityaccelerationmagnitudestandarddeviation
```
Standard deviation of time gravity acceleration magnitude
normalized and bounded within [-1,1]
```

timebodyaccelerationjerkmagnitudemean
```
Mean value of time body acceleration jerk magnitude
normalized and bounded within [-1,1]
```

timebodyaccelerationjerkmagnitudestandarddeviation
```
Standard deviation of time body acceleration jerk magnitude
normalized and bounded within [-1,1]
```

timebodygyromagnitudemean
```
Mean value of time body gyro magnitude
normalized and bounded within [-1,1]
```

timebodygyromagnitudestandarddeviation
```
Standard deviation of time body gyro magnitude
normalized and bounded within [-1,1]
```

timebodygyrojerkmagnitudemean
```
Mean value of time body gyro jerk magnitude
normalized and bounded within [-1,1]
```

timebodygyrojerkmagnitudestandarddeviation
```
Standard deviation of time body gyro jerk magnitude
normalized and bounded within [-1,1]
```

frequencybodyaccelerationmeanxaxis,
frequencybodyaccelerationmeanyaxis,
frequencybodyaccelerationmeanzaxis
```
Mean value of the frequency body acceleration on the x, y, and z axis
normalized and bounded within [-1,1]
```

frequencybodyaccelerationstandarddeviationxaxis,
frequencybodyaccelerationstandarddeviationyaxis,
frequencybodyaccelerationstandarddeviationzaxis
```
Standard deviation of the frequency body acceleration on the x, y, and z axis
normalized and bounded within [-1,1]
```

frequencybodyaccelerationjerkmeanxaxis,
frequencybodyaccelerationjerkmeanyaxis,
frequencybodyaccelerationjerkmeanzaxis
```
Mean value of the frequency body acceleration jerk on the x, y, and z axis
normalized and bounded within [-1,1]
```

frequencybodyaccelerationjerkstandarddeviationxaxis,
frequencybodyaccelerationjerkstandarddeviationyaxis,
frequencybodyaccelerationjerkstandarddeviationzaxis
```
Standard deviation of the frequency body acceleration jerk on the x, y, and z axis
normalized and bounded within [-1,1]
```

frequencybodygyromeanxaxis,
frequencybodygyromeanyaxis,
frequencybodygyromeanzaxis
```
Mean value of the frequency body gyro on the x, y, and z axis
normalized and bounded within [-1,1]
```

frequencybodygyrostandarddeviationxaxis,
frequencybodygyrostandarddeviationyaxis,
frequencybodygyrostandarddeviationzaxis
```
Standard deviation of the frequency body gyro on the x, y, and z axis
normalized and bounded within [-1,1]
```

frequencybodyaccelerationmagnitudemean
```
Mean value of frequency body acceleration magnitude
normalized and bounded within [-1,1]
```

frequencybodyaccelerationmagnitudestandarddeviation
```
Standard deviation of frequency body acceleration magnitude
normalized and bounded within [-1,1]
```

frequencybodybodyaccelerationjerkmagnitudemean
```
Mean value of frequency body body acceleration jerk magnitude
normalized and bounded within [-1,1]
```

frequencybodybodyaccelerationjerkmagnitudestandarddeviation
```
Standard deviation of frequency body body acceleration jerk magnitude
normalized and bounded within [-1,1]
```

frequencybodybodygyromagnitudemean
```
Mean value of frequency body body gyro magnitude
normalized and bounded within [-1,1]
```

frequencybodybodygyromagnitudestandarddeviation
```
Standard deviation of frequency body body gyro magnitude
normalized and bounded within [-1,1]
```

frequencybodybodygyrojerkmagnitudemean
```
Mean value of frequency body body gyro jerk magnitude
normalized and bounded within [-1,1]
```

frequencybodybodygyrojerkmagnitudestandarddeviation
```
Standard deviation of frequency body body gyro jerk magnitude
normalized and bounded within [-1,1]
```