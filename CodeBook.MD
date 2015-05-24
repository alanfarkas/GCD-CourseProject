Coursera: Getting and Cleaning Data - Project CodeBook

This code book describes the variables and data used in this analysis as well as any transformations that were performed in cleaning up the data.

The data was obtained from the site:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The project data used:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Data Catalog:
Subject - Integer code assigned to unnamed test subject
Activity - Description of measured activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
Measurements - 66 individual metrics, either STD Deviation or Means.

Data Summary:
The data set is summarized by Subject and Activity and holds the averages of all the captured metrics related to Std Deviation or Mean.
68 variables across 10,299 rows.

The run_analysis.R script performs the following steps to cleanse the date and produce the final data set:

Step 1: Merge the training and test sets into one data set
Step 2: Pull in column & row headers, and other descriptors
Step 3: Set column names (features)
Step 4: Just keep "std" and "mean" columns
Step 5: Set row header (subject)
Step 6: Set row header (activities)
Step 7: Create tidy data set and write it out to text file
Step 8: Display file data set

