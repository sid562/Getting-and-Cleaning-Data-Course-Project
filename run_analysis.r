## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set.
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


### Set Home directory
 home_dir <- "F:/Sid/r/working_directory/Cleaning course/Assignment/UCI HAR Dataset/"
 setwd(home_dir)

###load the data.table and reshape2 data packages.

 library (data.table)
 library (reshape2)	

####read the data
 X_test <- read.table("./test/X_test.txt")
 Y_test <- read.table("./test/Y_test.txt")
 subject_test <- read.table("./test/subject_test.txt")

 X_train <- read.table("./train/X_train.txt")
 Y_train <- read.table("./train/Y_train.txt")
 subject_train <- read.table("./train/subject_train.txt")

 activity_labeles <- read.table("./activity_labels.txt")

 features <- read.table("./features.txt")

######## 1 Merge the training and the test sets to create one data set.

 dataset <- rbind(X_test,X_train)
 subject <- rbind(subject_test,subject_train)
 activities <- rbind(Y_test,Y_train) 

######2.Extracts only the measurements on the mean and standard deviation for each measurement.
  
	features_mean_std <- grep("mean|std", features[,2])
	dataset <- dataset[,features_mean_std]

######4. Appropriately labels the data set with descriptive activity names.

####### Remove parantheses() from name of the features columns

      correctnames <- sapply(features[,2],function(x){gsub("[()]","", x)})
	names(dataset) <- correctnames[features_mean_std]
      names(subject) <- 'Subject'
	names(activities) <- 'Activity'
	
######## combine all the three dataset into one dataset

	DataSet <- cbind(dataset, subject, activities)

######3. Uses descriptive activity names to name the activities in the data set.
	
	act <- factor(DataSet$Activity)
	levels(act) <- activity_labeles[ ,2]
	DataSet$Activity <- act	

######5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


	melted_dataset <- melt(DataSet,(id.vars=c("Subject", "Activity")))
	
	casted_dataset <- dcast(melted_dataset, Subject + Activity ~ variable, mean)

	names(casted_dataset)[-c(1:2)] <- paste("mean of", names(casted_dataset)[-c(1:2)])
	
	write.table(casted_dataset, "tidy_data.txt", sep = ",")
