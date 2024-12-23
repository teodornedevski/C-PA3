# run_analysis.R - README

## Overview

`run_analysis.R` processes raw data from a wearable device study, extracts mean and standard deviation measurements, replaces activity labels with descriptive names, and computes averages for each measurement. The script outputs a tidy dataset and a summary of average measurements.

The steps in this script correspond to the steps outlined in the **Project Description for Getting and Cleaning Data**.

## Input Files

The script reads data from the following input files:
- **X_train.txt** – Training data with raw measurements (features).
- **y_train.txt** – Activity labels for the training dataset.
- **subject_train.txt** – Subject IDs for the training dataset.
- **X_test.txt** – Test data with raw measurements (features).
- **y_test.txt** – Activity labels for the test dataset.
- **subject_test.txt** – Subject IDs for the test dataset.
- **features.txt** – Feature names corresponding to the measurements.
- **activity_labels.txt** – Activity labels with corresponding descriptive names.

## Output Files

- **meansDS.txt** – A file with the average values of each measurement, grouped by activity and subject.
- **CodeBook.md** – A markdown file describing the variables and data transformations used in the analysis.

## Script Workflow

The script follows these steps, which correspond to the steps outlined in the **Project Description for Getting and Cleaning Data**:

1. **Reading and Merging Data**:
   - Reads the training and test datasets (`X_train.txt`, `X_test.txt`, etc.).
   - Merges the training and test data into a single dataset (`allData`).

2. **Extracting Mean and Standard Deviation Measurements**:
   - Filters columns to retain only those related to mean and standard deviation measurements.
   - Combines the relevant columns with activity and subject data.

3. **Replacing Activity Labels with Descriptive Names**:
   - Replaces the numeric activity labels with descriptive names using `activity_labels.txt`.

4. **Labeling Data with Descriptive Names**:
   - Cleans and standardizes the column names for readability (e.g., capitalizing "mean" and "std").

5. **Creating a Dataset of Averages**:
   - Computes the average of each measurement (ignoring `Activity` and `Test Subject`).
   - Outputs the results to `meansDS.txt`.

## Additional Files

- **CodeBook.md**: Describes the dataset variables, including feature names and transformations.
- **meansDS.txt**: Contains the average measurements grouped by activity and subject.

## How to Run

1. Place the dataset in the `./ProjectDataset/` directory.
2. Run the script in R:
   ```r
   source("run_analysis.R")
