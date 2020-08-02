
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile = "./project_gcd.zip")
dateDownloaded <- date()
zipF <- "./project_gcd.zip"
unzip(zipfile = zipF)
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
X_train_test <- merge(X_train, X_test, all = TRUE)
featuresData <- read.table("./UCI HAR Dataset/features.txt")
library(plyr)
library(dplyr)
library(tidyr)
featuresMeanStd <- filter(featuresData, grepl('mean()|std()',V2))
featuresMeanStdfixme <- filter(featuresMeanStd, !grepl('Freq()',V2))
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
y_train_test <- rbind(y_train, y_test)
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
y_train_test_label <- mapvalues(y_train_test$V1, from = activity_labels$V1, to = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING" ))
X_train_test4 <- select(X_train_test, featuresMeanStdfixme$V1)
names(X_train_test4) <- featuresMeanStdfixme$V2
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_train_test <- rbind(subject_train, subject_test)
dataset4 <- cbind(y_train_test_label, subject_train_test, X_train_test4)
colnames(dataset4)[2] <- "subject_train_test"
dataset5 <- dataset4 %>% unite(y_label_subject, y_train_test_label, subject_train_test) %>%
            group_by(y_label_subject) %>%
            dplyr::summarize_if(is.numeric,mean) %>%
            separate(y_label_subject, c("label", "subject"))
            

