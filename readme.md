# Getting and Cleaning Data

## readme.md

### This repository contains the following files:

run_analysis.R: R script to generate dataset tidydata.txt

codebook.rm: describes the dataset tidydata.txt

tidydata.txt: dataset generated from the run_analysis.R script

### Scenario of data collection

We collected data from the accelerometer and gyroscope of Samsung Galaxy S II smartphones from 30 volunteers. This volunteer was between 19 and 48 years old. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) using a smartphone (Samsung Galaxy S II) at the waist.

These data were prepared and organized for analysis in the tidydata.txt file.

### Creating the data set

Training and test data were merged. Only the mean and standard deviation variables were maintained. The first header line has been added. Columns were added with the names of the activities carried out by volunteers and their volunteers.

This script requires the dplyr package (version 0.4.3 was use

