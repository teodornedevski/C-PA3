# codebook for the Getting and Cleaning Data Project

varriables in the run_analysis.R script by alphabetical order:

### `activities`:
    Data frame of the activities indecies and their names used to re-label the activity names so they are readable. The second column is edited to remove any non-alpha-numeric characters from the names       
### `allData`:
    the dataframe that merges all of the data from the UCI 
### `filteredData`:
    the final dataframe that contains filtered data with appropriate row names that represent the mean or STD of a measurement from the UCI package, with its column names being the list `namesOfClasses`
### `indexesToKeep`:
    list of integers that indicates which columns are to be kept from the `allData` dataframe so that only columns containing fata about means and STDs is kept
### `labelsForDataSet`:
    a dataframe that is an additive merger of `labelsWithMean` and `labelsWithStd`
### `labelsGlobal`:
    a dataframe containing all labels for all of the data colums relating to measurements in the UCI dataset for the X files. this is later transformed into the `labelsSorted` and firther split into the `indexesToKeep` and `namesOfCols`  
### `labelsSorted`:
    a sorted dataframe of the data in `labelsForDataSet`, by their index column (V1)
### `labelsWithMean`:
    a filtered data frame of `labelsGlobal`, that has been filtered to only retain the entries pretaining to a mean of the measurements
### `labelsWithStd`:
    a filtered data frame of `labelsGlobal`, that has been filtered to only retain the entries pretaining to a Standard deviation of the measurements
### `means`:
    a dataframe which is based on `filteredData` where the measnof its numeral columns are calculated and recorded. This dataframe is transformed by transposition so that the names of each measurement is in the "Measurement" column, and the result of the mean is in the "Average" column
### `namesAN`:
    list of names of measurements for the X files, that contain only alpha numeric characters derrived from the transformtaion of the `namesOfCols` list, 
### `namesCleaned`:
    list of names of measurements for the X files, that contain only alpha numeric characters and have been made more readable derrived from the transformtaion of the `namesAN` list, 
### `namesOfClasses`:
    list of the names meant for the columns of the final dataframe, derrived by adding the final 2 names to `namesCleaned`
### `namesOfCols`:
    list of names of all of the measurements in the X files in the UCI dataset, derrived from the second column of `labelsSorted`
### `subjectTest`:
    Dataframe that contains the data loaded in from the subject_test.txt file, representing the subject from whiich the measurements wwere obtained from the original UCI dataset
### `SubjectTrain`:
    Dataframe that contains the data loaded in from the subject_train.txt file, representing the subject from whiich the measurements wwere obtained from the original UCI dataset
### `testData`:
    dataframe that contains the merged data from `Xtest`, `Ytest` and `SubjectTest` by appending the last two in their respective columns after the columns of the first
### `trainingData`:
    dataframe that contains the merged data from `Xtrain`, `Ytrain` and `SubjectTrain` by appending the last two in their respective columns after the columns of the first
### `Xtest`:
    Dataframe that contains the data loaded in from the X_test.txt file, representing sensor input, transformed from a vector entry from the original UCI dataset
### `Xtrain`:
    Dataframe that contains the data loaded in from the X_train.txt file, representing sensor input, transformed from a vector entry from the original UCI dataset
### `Ytest`: 
     Dataframe that contains the data loaded in from the y_test.txt file, representing the labels for the activity measured in teh original UCI dataset
### `Ytrain`:
     Dataframe that contains the data loaded in from the y_train.txt file, representing the labels for the activity measured in teh original UCI dataset




## Varriable Names for the output file ()
### `Measurement`: 
    Cleaned name of the mean and STD measurements derrived from the UCI dataset,
### `Average`:
    Mean of each mean and STD measurement from the UCI dataset
