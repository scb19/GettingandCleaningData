# Getting and Cleaning Data
Course 3 Project


## How the script run_analysis.R works?
- We download the file project_gcd.zip and unzip it
- We read the files X_train.txt and X_test then assign them respectively to variables X_train and X_test
- We merge the two variables X_train and X_test into a new variable X_train_test
- We read the file features.txt and assign it to a variable featuresData
- featuresMeanStdfixme is a vector containing only the measurements on the mean and standard deviation for each measurement
- We read the files Y_train.txt and Y_test then assign them respectively to variables Y_train and Y_test
- We merge the two variables Y_train and Y_test into a new variable Y_train_test 
- We read the file activity_labels.txt and assign it to a variable activity_labels
- y_train_test_label: vector of activity labels "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"
- X_train_test4: data of X_train_test corresponding to the features containing mean() or std()
- names(X_train_test4): extract the names of variables in X_train_test4
- We read the files subject_train.txt and subject_test.txt then assign them respectively to variables subject_train and subject_test
- We merge the two variables subject_train and subject_test into a new variable subject_train_test
- dataset4: add the vector columns y_train_test_label and subject_train_test to the data set X_train_test4
- colnames(dataset4)[2] <- "subject_train_test": name the second column of dataset4
- dataset5: from dataset4, we get the final tidy data set 
