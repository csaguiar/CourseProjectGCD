run_analysis <- function (directory = String()) {
  require(dplyr)
  # Features list
  filenameFeatures <-paste0(directory,"/features.txt")
  features <- read.table(filenameFeatures,col.names=c("ID","name"),stringsAsFactors = FALSE)
  
  # Activity list
  filenameActivity <-paste0(directory,"/activity_labels.txt")
  activities <- read.table(filenameActivity,col.names=c("ID","name"),stringsAsFactors = FALSE)
  
  # Filtering features for only variables with "mean()" or "std()" in its description
  features <- features[which(grepl("-mean()",features$name) | grepl("-std()",features$name)),]
  
  # Clean names to remove "mean()", "std()", "-" and "()""
  features$name <- gsub("\\(\\)","",features$name)
  features$name <- gsub("-","",features$name)
  
  # Filenames containing test and train data
  filenameVarTest <- paste0(directory,"/test/X_test.txt")
  filenameVarTrain <- paste0(directory,"/train/X_train.txt")
  
  # Filenames containing test and train activity labels
  filenameActvTest <- paste0(directory,"/test/y_test.txt")
  filenameActvTrain <- paste0(directory,"/train/y_train.txt")

  # Filenames containing test and train subject labels
  filenameSubjTest <- paste0(directory,"/test/subject_test.txt")
  filenameSubjTrain <- paste0(directory,"/train/subject_train.txt")
  
  # Read both data and rbind them
  data <- rbind(read.table(filenameVarTest),read.table(filenameVarTrain))
  
  # Filter data for selected features
  data <- data[,features$ID]
  
  # rbind activity labels and subject labels
  actvData <- rbind(read.table(filenameActvTest),read.table(filenameActvTrain))
  subjData <- rbind(read.table(filenameSubjTest),read.table(filenameSubjTrain))
  
  # cbind to gather all data read
  data <- cbind(subjData,cbind(actvData,data))
  
  # Variables names
  namesCols <- features$name
  
  # Add subject and activity to names
  namesCols <- c("subject","activity",namesCols)
  
  # Name data frame collumns
  colnames(data) <- namesCols
  
  # Label activity
  data$activity = activities[data$activity,2]
  
  # Grouping data by subject and activity
  data <- group_by(data, subject, activity)
  
  # Take average of each group for all variables
  data <- summarise_each(data,funs(mean))
  
  # return the final table
  data
}