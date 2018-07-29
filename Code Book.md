# Code Book

## Pre Analysis

This script will set the working directory and load the required packages

1. Read data and Merge
 * X_test : values of variables in test

 * Y_test : activity ID in test

 * subject_test : subject IDs for test

 * X_train : values of variables in train

 * Y_train : activity ID in train
 
 * subject_train : subject IDs for train

 * activity_labels : Description of activity IDs in y_test and y_train

 * features : description(label) of each variables in X_test and X_train

 * dataset : bind of X_train and X_test

 * subject : bind of X_train and X_test

 * activities : bind of Y_train and Y_test

2. Extract only mean() and std()
Create a vector of only mean and std labels, then use the vector to subset dataSet.

 * features_mean_std : a vector of only mean and std labels extracted from 2nd column of features.
 * dataset : at the end of this step, dataSet will only contain mean and std variables.

3. Changing Column label of dataSet
Create a vector of "clean" feature names by getting rid of "()" at the end. Then, will apply that to the dataSet to rename column labels.

 * correctnames : a vector of "clean" feature names

4. Adding Subject and Activity to the dataSet
Combine test data and train data of subject and activities, then give descriptive lables. Finally, bind with dataSet. At the end of this step, DataSet has 2 additonal columns 'subject' and 'activties' in the right side.

 * DataSet <- cbind(dataset, subject, activities)

5. Rename ID to activity name
Group the activity column of dataSet as "act", then rename each levels with 2nd column of activity_levels. Finally apply the renamed "act" to DataSet's activity column.

 * act: factored activity column of dataSet

6. Output tidy data
In this part, dataSet is melted to create tidy data. It will also add [mean of] to each column labels for better description. Finally output the data as "tidy_data.txt"

 * melted_dataset : melted tall and skinny dataSet
 * casted_dataset : casete baseData which has means of each variables
