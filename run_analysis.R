# Step 1
# combining data into one large dataset

## reading and combining data from the train files:
Xtrain <- read.table("./ProjectDataset/train/X_train.txt", header = FALSE )
Ytrain <- read.table("./ProjectDataset/train/y_train.txt", header = FALSE, col.names = c("Activity"))
SubjectTrain <- read.table("./ProjectDataset/train/subject_train.txt", header = FALSE, col.names = c("Test Subject"))

trainingData <- cbind(Xtrain, Ytrain, SubjectTrain)

## reading and combining data from the test files:
Xtest <- read.table("./ProjectDataset/test/X_test.txt", header = FALSE )
Ytest <- read.table("./ProjectDataset/test/y_test.txt", header = FALSE, col.names = c("Activity"))
subjectTest <- read.table("./ProjectDataset/test/subject_test.txt", header = FALSE, col.names = c("Test Subject"))

testData <- cbind(Xtrain, Ytrain, SubjectTrain)

## binding all of the test and train data in a large dataset

allData <- rbind(trainingData, testData)

# Step 2
# extracting data with only mean and STD measurements

## reading in and processing the labels for each of the values

labelsGlobal <- read.table("./ProjectDataset/features.txt")

### take out varriables of not needed items (i.e. include the varriables that only have mean or median)
labelsWithMean <- labelsGlobal[grep("mean", labelsGlobal$V2, ignore.case = TRUE), ]
labelsWithStd <- labelsGlobal[grep("std", labelsGlobal$V2, ignore.case = TRUE), ]
labelsForDataSet <- rbind(labelsWithMean, labelsWithStd)

### remove data points that calculate the angle of a mean or std: (angle is not required to be saved)
labelsForDataSet <- labelsForDataSet[grep("^angle", labelsForDataSet$V2, invert = TRUE), ]

### sort the labels by the index
labelsSorted <- sort_by.data.frame(labelsForDataSet, labelsForDataSet$V1)

### extract only the column number of the features we want to keep
indexesToKeep <- labelsSorted$V1
namesOfCols <- labelsSorted$V2


## keeping only columns with mean and std measurements and the Activity and Subject data
## the indexes of the activity and subject data are 562 and 563
filteredData <- allData[c(indexesToKeep, 562, 563)]

# Step 3
# Replacing the activity labels with descriptive names

## loading in the names of the activities and tidying the names:
activities <- read.table("./ProjectDataset/activity_labels.txt")
activities$V2 <- lapply(activities$V2, function(x) {gsub("_", " ", x)})

## replace the labels of the activities with their names
filteredData$Activity <- cut(filteredData$Activity, breaks = c(0, activities$V1), labels = activities$V2 )


# Step 4:
# Labeling Data Set with Descriptive names 

## lading in the names from a previous step and cleaning them 

### remove non-alpha numerics
namesAN <- lapply(namesOfCols, function (x) {gsub('[^0-9a-zA-Z\\s]','', x)})

### capitalize the Mean and STD to improve readability
namesAN <- lapply(namesAN, function (x) {gsub('mean','Mean', x)})
namesCleaned <- lapply(namesAN, function (x) {gsub('std','STD', x)})

### append the names of the last 2 columns :
namesOfClasses <- c(namesCleaned, "ActivityName", "TestSubject")

## change colnames of the dataset:
names(filteredData) <- namesOfClasses

#Step 5
#create a dataset of averages

## calculate means and store in a 1 col data frame (ignoring the non-measurement data - Activity and participant)
means <- data.frame(colMeans(filteredData[c(1:79)]))
means <- cbind(row.names(means), means)
colnames(means) <- c ("Measurement", "Average")

## export dataframe of means
write.table(means, file="meansDS.txt", row.names = FALSE)









