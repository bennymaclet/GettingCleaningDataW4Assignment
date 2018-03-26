# Getting Cleaning Data W4 Assignment

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit:

1. a tidy data set as described below;
2. a link to a Github repository with your script for performing the analysis; 
3. a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.

You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

The repo contains the run_analysis.R code and the 

Description of the run_analysis.R

1. It downloads the UCI HAR Dataset data set and puts the zip file working directrory. After it is downloaded, it unzips the file into the UCI HAR Dataset folder.
2. It loads the train and test data sets, the features names, and the activity codes file.
3. It appends the two datasets into one data frame by using rbinds function
4. It extracts just the mean and standard deviation from the features data set and then it corrects features names by eliminating the parenthesis and the "-" expressions
5. It appropriately changes the name of the selected features in order to be more explicit and desriptive
5. It averages the data by subject and activity. A new tidy data frame is created and exported in the project folder as txt file. 

