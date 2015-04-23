run_analysis <- function (directory = String()) {
  require(dplyr)
  # Directory containing test data
  directoryTest <- paste0(directory,"/test/")
  # Loading test data into a data frame
  filenamesTest <- paste0(directoryTest, list.files(directoryTest, pattern = "txt",recursive=TRUE))
  filenamesTest
}