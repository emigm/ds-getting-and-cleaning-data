library("dplyr")

download_dataset <- function () {
    dir_path <- file.path(getwd(), "datasets")

    if (! file.exists(dir_path)) {
        dir.create(dir_path, mode="0755")
    }

    file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    file_path <- file.path(dir_path, 'getdata_projectfiles_UCI_HAR_dataset.zip')

    if (! file.exists(file_path)) {
        download.file(file_url, destfile=file_path, method="curl")
    }

    unzipped_dir_path <- file.path(dir_path, "UCI HAR Dataset")

    if (! file.exists(unzipped_dir_path)) {
        unzip(file_path, exdir=dir_path)
    }
}

get_activity_labels <- function () {
    # Read activity_labels.txt file.
    activity_labels <- read.table(
        "./datasets/UCI HAR Dataset/activity_labels.txt",
        sep="",
        col.names=c("activity_id", "activity_label")
    )

    activity_labels <- activity_labels %>%
        mutate(activity_label=tolower(activity_label))

    activity_labels
}

normalize_variable_name <- function (variable_name) {
    normalized_variable_name <- gsub("[()]", "", variable_name)
    normalized_variable_name <- gsub("[-,]", "_", normalized_variable_name)
    normalized_variable_name <- tolower(normalized_variable_name)

    normalized_variable_name
}

get_features <- function () {
    # Read features.txt file.
    features <- read.table(
        "./datasets/UCI HAR Dataset/features.txt",
        sep="",
        row.names="index",
        col.names=c("index", "name")
    )

    # Normalize feature names.
    normalized_features <- sapply(features$name, normalize_variable_name)

    normalized_features
}

process_train_dataset <- function () {
    # Read subject_train.txt file.
    subject_train <- read.table("./datasets/UCI HAR Dataset/train/subject_train.txt", sep="", col.names=c("subject"))

    # Read y_train.txt file.
    y_train <- read.table("./datasets/UCI HAR Dataset/train/y_train.txt", sep="", col.names=c("activity_id"))

    # Add both activity id and name to y_train dataset.
    activity_labels <- get_activity_labels()
    y_train <- merge(activity_labels, y_train, by.x="activity_id", by.y="activity_id")

    # Read X_train.txt file.
    features <- get_features()
    x_train <- read.table("./datasets/UCI HAR Dataset/train/X_train.txt", sep="", col.names=features)
    x_train <- x_train[, grep("mean|std", features)]

    # Add subject to x_train dataset.
    x_train <- cbind(subject_train, x_train)

    # Add both activity id and name to x_train dataset.
    train <- cbind(y_train, x_train)

    train
}

process_test_dataset <- function () {
    # Read subject_test.txt file.
    subject_test <- read.table("./datasets/UCI HAR Dataset/test/subject_test.txt", sep="", col.names=c("subject"))

    # Read y_test.txt file.
    y_test <- read.table("./datasets/UCI HAR Dataset/test/y_test.txt", sep="", col.names=c("activity_id"))

    # Add activity names to y_test dataset.
    activity_labels <- get_activity_labels()
    y_test <- merge(activity_labels, y_test, by.x="activity_id", by.y="activity_id")

    # Read X_train.txt file.
    features <- get_features()
    x_test <- read.table("./datasets/UCI HAR Dataset/test/X_test.txt", sep="", col.names=features)
    x_test <- x_test[, grep("mean|std", features)]

    # Add subject to x_test dataset.
    x_test <- cbind(subject_test, x_test)

    # Add both activity id and name to x_train.
    test <- cbind(y_test, x_test)

    test
}

run_analysis <- function() {
    # Download the dataset to analize.
    download_dataset()

    # Bind both the train and test datasets.
    train <- process_train_dataset()
    test <- process_test_dataset()
    bound_datasets <- rbind(train, test)

    # Create a tidy data set with the average of each variable for each activity and each subject.
    mean_by_activity_subject_dataset <- bound_datasets %>%
        select(-c("activity_id")) %>%
        group_by(activity_label, subject) %>%
        summarize_all(.funs=c(avg_by_act_subj="mean"))

    write.csv(
        mean_by_activity_subject_dataset,
        file = "./datasets/uci_har_dataset_avg_by_act_subj.csv",
        row.names=FALSE,
        na=""
    )
}
