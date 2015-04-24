# Introduction
This repo contains the run_analysis.R script developed to summarize the data collected from the accelerometers in the Samsung Galaxy S smartphone. This script is part of the Course Project of the Getting and Cleaning Data Course provided by Johns Hopkins University through Coursera MOOC. The data was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip . The script reads the data from the files described below:

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The files path must follow the structure described above in relation to the working directory the user set on his R environment.

# Script procedure
This script takes all data from test and train sets, merge them into one data frame and clean them. The goal of the script is provide, for later analysis, a tidy data for subjects and activity type.

According to the requirements, only measures with mean and standard deviation were taken into account.

# Output
The script outputs a data frame containing the average of each variable grouped by subject and activity performed.
