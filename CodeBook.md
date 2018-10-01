<h2> Getting and Cleaning Data Project</h2>

The data that is output from the 'run_analysis.R' script is stored in 'tidy_data.txt'. This dataset describes 30 volunteers aged 19-48 that each performed 6 activities while wearing a smartphone. These activities are labelled in the dataset as WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING. The data comes from smartphone accelerometer and gyroscope sensors.

<b>Raw data</b>: The raw data that was merged came from UCI HAR Dataset/test/X_test.txt and UCI HAR Dataset/train/X_train.txt. They were in space-delimited format without headers. The raw headers are from UCI HAR Dataset/features.txt

<b>Processed data</b>: All columns pertaining to mean and standard deviation were extracted from the merged datasets. The average of each variable (row) for each activity (column) was then output into the final tidy_data.txt file.

<b>Header information:</b>

- `activityId`: Subject identifier
-  `activityLabel`: 1 of the 6 performed activities. Can include WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING or LAYING.

The remaining headers contain <b>Mean</b> or <b>Standard Deviation</b> values of <b>Time Domain Body</b> or <b>Frequency</b> data, measured by either an <b>Accelerometer</b> or <b>Gyroscope</b>, in the <b>X</b>, <b>Y</b>, or <b>Z</b> directions. There are also <b>Gravity</b>,<b>Jerk</b>, or <b>Magnitude</b> attributes that comprise the angular velocity measurements taken. These keywords describe all the different ways measurements were taken together.
