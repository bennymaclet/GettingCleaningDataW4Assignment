# Getting Cleaning Data W4 Assignment

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit:

1. a tidy data set as described below;
a link to a Github repository with your script for performing the analysis; and
a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.
You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

The repo contains the run_analysis.R code and the 

Description of the run_analysis.R
It downloads the UCI HAR Dataset data set and puts the zip file working directrory. After it is downloaded, it unzips the file into the UCI HAR Dataset folder.
It loads the train and test data sets, the features names and the activity codes file.
It appends the two datasets into one data frame by using rbinds function
It extracts just the mean and standard deviation from the features data set and then it corrects features names by eliminating the parenthesis and the "-" expressions
It converts  thit to lower case using tolower and removes underscore using gsub. activity and subject column names are named for y and subj data sets, respectively.
The three data sets, x, y and subj, are merged. Then, it is exported as a txt file into the Project folder in the same working directory, named merged.txt.
The mean of activities and subjects are created into a separate tidy data set which is exported into the Project folder as txt file; this is named average.txt.
The R code contains str for easier preview of the two final data sets.
