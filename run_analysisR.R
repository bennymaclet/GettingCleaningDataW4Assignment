#download the data.
setwd("C://Users//GettingAndCleaningData//Week4")
cdir <-getwd()
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#procedura per leggere tutti i files in una cartella in maniera anche ricorsiva
download.file(fileUrl,destfile="./Analysis/Dataset.zip")
unzip(zipfile="Dataset.zip",exdir="./Analysis")
path_rf <- file.path(cdir,"Analysis", "UCI HAR Dataset")
files<-list.files(path_rf, recursive=TRUE)

#load all the datafiles that are required for the analysis
dataS <-read.table(file.path(cdir,"Analysis", "UCI HAR Dataset", "test","subject_test.txt"),header = FALSE, sep = "", dec = ".")
Xtest <-read.table(file.path(cdir,"Analysis", "UCI HAR Dataset", "test","X_test.txt"),header = FALSE, sep = "", dec = ".")
Ytest <-read.table(file.path(cdir,"Analysis", "UCI HAR Dataset", "test", "y_test.txt"),header = FALSE, sep = "", dec = ".")

dataSTr <-read.table(file.path(cdir,"Analysis", "UCI HAR Dataset", "train","subject_train.txt"),header = FALSE, sep = "", dec = ".")
Xtrain <-read.table(file.path(cdir,"Analysis" ,"UCI HAR Dataset", "train","X_train.txt"),header = FALSE, sep = "", dec = ".")
Ytrain <-read.table(file.path(cdir,"Analysis", "UCI HAR Dataset", "train","y_train.txt"),header = FALSE, sep = "", dec = ".")

feat <-read.table(file.path(cdir,"Analysis", "UCI HAR Dataset","features.txt"),header = FALSE, sep = "", dec = ".")
actLab <- read.table(file.path(cdir,"Analysis", "UCI HAR Dataset","activity_labels.txt"),header = FALSE, sep = "", dec = ".")

# 1. Merges the training and the test sets to create one data set.
# Train and Test data frames are split by subject factor
# Thus, we only need to append the twos: 
  
  df <-rbind(Xtest, Xtrain)
  dS <-rbind(dataS, dataSTr)
  dA <- rbind(Ytest, Ytrain)
  
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# To complete the task:
#  a. we look for "mean" and "sd  expression in the feat data frame and extract the indexes code. 
  nfeatindex <- grep("mean|std",feat$V2)
#  b. we correct features names (eliminate the parenthesis and the "-" expressions)
  feat$V2 <-gsub("\\)", "", feat$V2)
  feat$V2 <-gsub("\\(", "", feat$V2)
  feat$V2 <-gsub("-", ".", feat$V2)

  names(df)<- feat[, 2] 
  df <-df[,nfeatindex]
  
#3. Use descritptive activity names to name the activity in the dataset
  activity<-factor(dA$V1, levels = actLab$V1, labels = actLab$V2)

# 4.Appropriately labels the data set with descriptive variable names.
  colnames(dS)<-"subject"
  TidyDataSet <- cbind(dS, activity, df)
  names(TidyDataSet) <- gsub('^t',"TimeDomain.",names(TidyDataSet))
  names(TidyDataSet) <- gsub('^f',"FrequencyDomain.",names(TidyDataSet))
  names(TidyDataSet) <- gsub('\\.mean',".Mean",names(TidyDataSet))
  names(TidyDataSet) <- gsub('\\.std',".StandardDeviation",names(TidyDataSet))
  names(TidyDataSet) <- gsub('Freq\\.',"Frequency.",names(TidyDataSet))
  
# 5. From the data set in step 4, creates a second, independent tidy data set with the average 
# of each variable for each activity and each subject.

Data2<-aggregate(TidyDataSet[,3:81], list(TidyDataSet$subject, TidyDataSet$activity), mean )
colnames(Data2)[1:2]<-c("subject", "Activity")

write.table(Data2, file = "tidyDataSet.txt",row.name=FALSE)
#