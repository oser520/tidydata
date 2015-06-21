# tidydata

The content in this repo is my solution to an assignment for [Getting and Cleaning Data](https://class.coursera.org/getdata-015). In a nutshell, the assignment required that we create a **tidy** data set from the [Human Activity Recognition Using Smartphones Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) [HARUSD]. Besides this README, the repo contains the following, each of which is described below:

- **run_analysis.R** The [R](https://en.wikipedia.org/?title=R_(programming_language)) script that creates the tidy data set.
- **CodeBook.md** A codebook that describes the data in the tidy data set.
- **tidydata.txt** The tidy data created by run_analysis.

### run_anlysis.R

The script creates a function that works on this [data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). The data contains time and frequency domain signals measuring human activity on multiple subjects and 6 different activities. *run_analysis* reads multiple files contained in HARUSD, gathers the information for the subjects, activity labels, and measurements for each activity and each subject, targets the subset of the measurement features that measure a mean or standard deviation, and then computes the mean of these features for each activity and each subject. Thus, a set of observations in the HARUSD corresponding to a unique pair *(subject, activity)* maps to a single observation in the tidy data set.

### CodeBook.md

CodeBook.md contains a more detailed description of the data in HARUSD and the tidy data set.

### tidydata.txt

The optional output file obtained by invoking the function *run_analysis* after source-ing run_analysis.R, which represents a table with 180 observations and 68 variables.
