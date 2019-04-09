==================================================================
Human Activity Recognition Averaged by Activity and Subject
Version 1.0
==================================================================
Emiliano G. Molina
==================================================================

Study Design.
======================================

The uci_har_dataset_avg_by_act_subj dataset has been created based on the version 1 of the Human Activity Recognition Using Smartphones dataset. The latter can be downloaded from https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI HAR Dataset.zip. Also, the details about the experiments to build the source dataset are available in 'README.txt' in UCI HAR Dataset.zip.

Code Book.
======================================

The variables selected for the uci_har_dataset_avg_by_act_subj dataset are the result of a summarization process applied to the variables in Human Activity Recognition Using Smartphones dataset. It worths to point out that this process does not change the variable units in the source dataset. 

The transformations and summarizartions are:
1. Normalize the activity labels by applying the following rules:
- Use lowercase.
2. Merge the activity labels and both the training and the test sets to use descriptive activity names to name the activities in the data sets.
3. Normalize the feature names by applying the following rules:
- Use lowercase.
- Remove parentheses.
- Replace dashes and commas by underscores.
4. Merge the feature names and both the training and the test sets to use descriptive columns names to name the columuns in the data sets.
5. Merge the subjects and both the training and the test sets to identify to whom each measurement belongs.
6. Extracts only the columns on the mean and standard deviation for each measurement.
7. Merge the training and the test sets to create one data set.
8. Calculates the average of each variable for each activity and each subject.

The set of summarized variables are:
- activity_label: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.
- subject: Identifier for each of the 30 volunteers.
- tbodyacc_mean_x_avg_by_act_subj
- tbodyacc_mean_y_avg_by_act_subj
- tbodyacc_mean_z_avg_by_act_subj
- tbodyacc_std_x_avg_by_act_subj
- tbodyacc_std_y_avg_by_act_subj
- tbodyacc_std_z_avg_by_act_subj
- tgravityacc_mean_x_avg_by_act_subj
- tgravityacc_mean_y_avg_by_act_subj
- tgravityacc_mean_z_avg_by_act_subj
- tgravityacc_std_x_avg_by_act_subj
- tgravityacc_std_y_avg_by_act_subj
- tgravityacc_std_z_avg_by_act_subj
- tbodyaccjerk_mean_x_avg_by_act_subj
- tbodyaccjerk_mean_y_avg_by_act_subj
- tbodyaccjerk_mean_z_avg_by_act_subj
- tbodyaccjerk_std_x_avg_by_act_subj
- tbodyaccjerk_std_y_avg_by_act_subj
- tbodyaccjerk_std_z_avg_by_act_subj
- tbodygyro_mean_x_avg_by_act_subj
- tbodygyro_mean_y_avg_by_act_subj
- tbodygyro_mean_z_avg_by_act_subj
- tbodygyro_std_x_avg_by_act_subj
- tbodygyro_std_y_avg_by_act_subj
- tbodygyro_std_z_avg_by_act_subj
- tbodygyrojerk_mean_x_avg_by_act_subj
- tbodygyrojerk_mean_y_avg_by_act_subj
- tbodygyrojerk_mean_z_avg_by_act_subj
- tbodygyrojerk_std_x_avg_by_act_subj
- tbodygyrojerk_std_y_avg_by_act_subj
- tbodygyrojerk_std_z_avg_by_act_subj
- tbodyaccmag_mean_avg_by_act_subj
- tbodyaccmag_std_avg_by_act_subj
- tgravityaccmag_mean_avg_by_act_subj
- tgravityaccmag_std_avg_by_act_subj
- tbodyaccjerkmag_mean_avg_by_act_subj
- tbodyaccjerkmag_std_avg_by_act_subj
- tbodygyromag_mean_avg_by_act_subj
- tbodygyromag_std_avg_by_act_subj
- tbodygyrojerkmag_mean_avg_by_act_subj
- tbodygyrojerkmag_std_avg_by_act_subj
- fbodyacc_mean_x_avg_by_act_subj
- fbodyacc_mean_y_avg_by_act_subj
- fbodyacc_mean_z_avg_by_act_subj
- fbodyacc_std_x_avg_by_act_subj
- fbodyacc_std_y_avg_by_act_subj
- fbodyacc_std_z_avg_by_act_subj
- fbodyacc_meanfreq_x_avg_by_act_subj
- fbodyacc_meanfreq_y_avg_by_act_subj
- fbodyacc_meanfreq_z_avg_by_act_subj
- fbodyaccjerk_mean_x_avg_by_act_subj
- fbodyaccjerk_mean_y_avg_by_act_subj
- fbodyaccjerk_mean_z_avg_by_act_subj
- fbodyaccjerk_std_x_avg_by_act_subj
- fbodyaccjerk_std_y_avg_by_act_subj
- fbodyaccjerk_std_z_avg_by_act_subj
- fbodyaccjerk_meanfreq_x_avg_by_act_subj
- fbodyaccjerk_meanfreq_y_avg_by_act_subj
- fbodyaccjerk_meanfreq_z_avg_by_act_subj
- fbodygyro_mean_x_avg_by_act_subj
- fbodygyro_mean_y_avg_by_act_subj
- fbodygyro_mean_z_avg_by_act_subj
- fbodygyro_std_x_avg_by_act_subj
- fbodygyro_std_y_avg_by_act_subj
- fbodygyro_std_z_avg_by_act_subj
- fbodygyro_meanfreq_x_avg_by_act_subj
- fbodygyro_meanfreq_y_avg_by_act_subj
- fbodygyro_meanfreq_z_avg_by_act_subj
- fbodyaccmag_mean_avg_by_act_subj
- fbodyaccmag_std_avg_by_act_subj
- fbodyaccmag_meanfreq_avg_by_act_subj
- fbodybodyaccjerkmag_mean_avg_by_act_subj
- fbodybodyaccjerkmag_std_avg_by_act_subj
- fbodybodyaccjerkmag_meanfreq_avg_by_act_subj
- fbodybodygyromag_mean_avg_by_act_subj
- fbodybodygyromag_std_avg_by_act_subj
- fbodybodygyromag_meanfreq_avg_by_act_subj
- fbodybodygyrojerkmag_mean_avg_by_act_subj
- fbodybodygyrojerkmag_std_avg_by_act_subj
- fbodybodygyrojerkmag_meanfreq_avg_by_act_subj
- angletbodyaccmean_gravity_avg_by_act_subj
- angletbodyaccjerkmean_gravitymean_avg_by_act_subj
- angletbodygyromean_gravitymean_avg_by_act_subj
- angletbodygyrojerkmean_gravitymean_avg_by_act_subj
- anglex_gravitymean_avg_by_act_subj
- angley_gravitymean_avg_by_act_subj
- anglez_gravitymean_avg_by_act_subj

The complete list of features and variables of each feature in the Human Activity Recognition Using Smartphones dataset is available in 'features_info.txt' and 'features.txt'.
