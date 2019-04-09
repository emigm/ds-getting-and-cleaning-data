==================================================================
Human Activity Recognition Averaged by Activity and Subject
Version 1.0
==================================================================
Emiliano G. Molina
==================================================================

Scripts.
======================================

The run_analysis.R script has functions to process the Human Activity Recognition Using Smartphones dataset to obtain the uci_har_dataset_avg_by_act_subj dataset.

The functions are:
- download_dataset: It downloads the Human Activity Recognition Using Smartphones dataset from https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI HAR Dataset.zip and it stores it in the datasets directory in your working directory.
- get_activity_labels: It reads 'activity_labels.txt'.
- normalize_variable_name: It normalizes the feature names.
- get_features: It reads 'features.txt' and normalize their names using 'normalize_variable_name' function.
- process_train_dataset: It processes the train dataset.
- process_test_dataset: It processes the test dataset.
- run_analysis: It performs the complete analysis over the Human Activity Recognition Using Smartphones dataset to obtain the uci_har_dataset_avg_by_act_subj dataset.
The details about this process are in 'CodeBook.md'.
