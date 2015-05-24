##read in the data files

##561 features (aka measurements-columns)
features <- read.table("features.txt")

##6 activities
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")

##training data including list of activities – Ytrain – and list of subjects
Xtrain <- read.table('./UCI HAR Dataset/train/X_train.txt')
Ytrain <- read.table ('./UCI HAR Dataset/train/Y_train.txt')
subject_train <- read.table ('./UCI HAR Dataset/train/subject_train.txt')

##testing data including list of activities – Ytest – and list of subjects
Xtest <- read.table('./UCI HAR Dataset/test/X_test.txt')
Ytest <- read.table('./UCI HAR Dataset/test/Y_test.txt')
subject_test <- read.table ('./UCI HAR Dataset/test/subject_test.txt')

##set column names equal to the features (aka measurements taken)
names(Xtest) = as.character(unlist(features[,2]))
names(Xtrain) = as.character(unlist(features[,2]))

##if want to verify columns now have descriptive titles
##names(Xtest)
##names(Xtrain)


##add left column for the activity covered by the test and give it a descriptive column name
mergedDataTest <- cbind(Ytest, Xtest)
names(mergedDataTest)[names(mergedDataTest) == 'V1'] <- 'activity'
mergedDataTrain <- cbind(Ytrain, Xtrain)
names(mergedDataTrain)[names(mergedDataTrain) == 'V1'] <- 'activity'


##add left column for the subject of the test and give it a descriptive column name
mergedDataTest <- cbind(subject_test, mergedDataTest)
names(mergedDataTest)[names(mergedDataTest) == 'V1'] <- 'subject'
mergedDataTrain <- cbind(subject_train, mergedDataTrain)
names(mergedDataTrain)[names(mergedDataTrain) == 'V1'] <- 'subject'

##if want to verify subject and activity are the two left columns
##names(mergedDataTest)
##names(mergedDataTrain)


##merge test and train data into one data set
mergedDataAll <- rbind(mergedDataTest, mergedDataTrain)

##inspect dimensions of test, training and merged data tables, dimensions of
##merged table should be sum of test+train rows and same number of columns
dim(mergedDataTest)
dim(mergedDataTrain)
dim(mergedDataAll)

##subset to include only those columns with mean or std in their names
stdMeanData <- (mergedDataAll [,c("subject", "activity", colnames(mergedDataAll)[grep("mean|std",colnames(mergedDataAll))])])

##dimensions should be same number of rows but much fewer rows
dim(stdMeanData)

##if want to verify all columns besides activity and subject have std or mean
##names(stdMeanData)

##apply descriptive activity labels (aka row labels) by first converting activity column from
##integer to a factor then assign labels to the numeric levels
stdMeanData$activity <- as.factor(stdMeanData$activity)
levels(stdMeanData$activity) = c("Walking", "Walking_Upstairs", "Walking_Downstairs", "Sitting", "Standing", "Laying")

##if want to verify that activity column now has descriptive titles vice numbers
##stdMeanData$activity

##calculate mean of the features for each activity-subject grouping
library(dplyr)
tidyData <- (stdMeanData %>% 
  group_by(activity, subject) %>% 
  summarise_each(funs(mean)))

##head(tidyData)
##tail(tidyData)

##check dimensions of final tidy data table, rows should be 
## 180 (6 activities x 30 subjects)
dim(tidyData)


##save final tidy data table to a text file for submission
write.table(tidyData, file = "tidyData.txt", row.name = FALSE)
