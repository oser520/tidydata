#===================================================================================#
# @file:    run_analysis.R
# @author:  Omar Serrano
# @date:    2015-06-21
# @version: 1
#
# This script contains a function that creates a tidy data set from a set of files
# that contain multiple features relating to tri-axial measurements obtained from
# the sensors on phones carried by people as they performed different activities,
# such as walking, or, but not limited to, walking downstairs. More information can
# be found at the following links:
#  1) http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#  2) https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#===================================================================================#

# run_analysis reads a set of files with sensor data and creates a tidy data frame.
#
# @param dirname The directory where the input files are located. If no argument is
#  provided then 'UCI HAR Dataset' is used.
# @param return_df boolean to return tidy data frame, with default value True.
# @param write_data boolean to write tidy data frame to disk, with default value True
# @param write_dest the destination file where data frame should be written to if
#  write data is true. Default is tidydata.txt in current working directory. If the
#  named file already exists then the file is overwritten.
# @param attr_file boolean to write the names of the attributes to a text file, which
#  can be used to create a code book.
# @param ... arguments passed to write.table if write_data is true. row.names=F and
#  quote=F are already used by default. 
# @return if return_df is true, then the tidy data frame is returned.
run_analysis <- function(dirname = 'UCI HAR Dataset',
                         return_df=T,
                         write_data=F,
                         write_dest='tidydata.txt',
                         attr_file=F,
                         ...)
{
	# check first four arguments are valid
	if (!is.character(dirname) || !nzchar(dirname)
		|| !is.logical(return_df) || !is.logical(write_data)
		|| !is.character(write_dest) || !nzchar(write_dest)
		|| !is.logical(attr_file))
	{
		stop('bad argument(s)')
	}

	# test if all necessary files exist and return list of file names
	fnames <- test_files_exist(dirname)

	df <- read.table(fnames$attr, colClasses=c('integer', 'character'))

	# The line of code below extracts the indexes we want to keep (i.e., mean and
	# standard deviation values) by matching on feature names that contain either
	# -mean() or -std().
	attr_idx <- grep('-(mean|std)\\(\\)', df[,2]) 

	# The two lines of code below use regular expressions to change the names of the
	# features, such that the part of the name that is std(), std()-, mean(), or
	# mean()-, is replaced by -STD or -MEAN, but appended to the end of the name
	re_exp <- '-(mean|std)\\(\\)-?(.*)\\Z' 
	attr_names <- sub(re_exp, '\\2-\\U\\1', df[attr_idx, 2], fixed=F, perl=T)
	
	# read activity labels
	activity_labels <- read.table(fnames$activity)[,2]

	# read training data
	train_sub <- read.table(fnames$train_subject, colClasses = 'factor')
	train_activity <- read.table(fnames$train_activity, colClasses = 'factor')
	train_train <- read.table(fnames$train_train, colClasses = 'numeric')

	# read test data
	test_sub <- read.table(fnames$test_subject, colClasses = 'factor')
	test_activity <- read.table(fnames$test_activity, colClasses = 'factor')
	test_train <- read.table(fnames$test_train, colClasses = 'numeric')

	# filter training attributes we want
	train_train = train_train[,attr_idx]
	test_train = test_train[,attr_idx]

	# map activity number to activity label
	train_activity <- sapply(train_activity, function(a) activity_labels[a])
	test_activity <- sapply(test_activity, function(a) activity_labels[a])

	# column bind info
	train_df <- data.frame(train_sub, train_activity, train_train)
	test_df <- data.frame(test_sub, test_activity, test_train)

	# combine all info
	info <- rbind(train_df, test_df)

	# get set of (subject, activity) pairs
	sub_act <- info[,c(1,2)]
	sub_activity_pair <- as.matrix(unique(sub_act))
	matrow <- nrow(sub_activity_pair)

	# create matrix with the average value of each measurement for each unique pair
	# (subject, activity)
	avg_info <- matrix(nrow=matrow, ncol=length(attr_names))
	for (i in 1:matrow)
	{
		select_rows <- apply(sub_act, 1, function(r) all(r == sub_activity_pair[i,]))
		select_df <- info[select_rows, (3:ncol(info))]
		avg_info[i,] <- apply(select_df, 2, mean)
	}

	# update attr_names
	attr_names <- c('subject', 'activity', attr_names)
	if (attr_file) write.table(attr_names, file="attr_names.txt", row.names=F,
								quote=F, col.names=F)

	# create data frame with information about the average values
	avg_info <- data.frame(sub_activity_pair, avg_info)
	names(avg_info) <- attr_names
	rownames(avg_info) <- 1:nrow(avg_info)

	# write data
	if (write_data) write.table(avg_info, file=write_dest, quote=F, row.names=F, ...)
			
	# return data frame
	if (return_df) avg_info
}

# Tests if all necessary files exists. Terminates the process if any file does not
# exist. Even if this detects that the file exists, the file may not exist any 
# longer by the time we try to access it, but this is an unlikely event, and it is
# better than not testing at all, because we do not want to do any work if any
# pieces are missing.
#
# @param dirname the root directory where we can find files
# @return the list of file names that we need
test_files_exist <- function(dirname)
{
	fnames <- list()
	# root directory file names
	fnames$root <- dirname
	fnames$attr <- make_fname(fnames$root, 'features.txt')
	fnames$activity <- make_fname(fnames$root, 'activity_labels.txt')

	# training file names
	fnames$train <- make_fname(fnames$root, 'train')
	files <- c('subject_train.txt', 'X_train.txt', 'y_train.txt')
	files <- make_fname(fnames$train, files)
	fnames$train_subject <- files[1]
	fnames$train_train <- files[2]
	fnames$train_activity <- files[3]

	# test file names
	fnames$test <- make_fname(fnames$root, 'test')
	files <- gsub('train','test', files)
	fnames$test_subject <- files[1]
	fnames$test_train <- files[2]
	fnames$test_activity <- files[3]

	# test files exist
	lapply(fnames, file_exists_err)

	# return list of file names
	fnames
}

# Tests if file exists, and terminates program if id does not.
#
# @param file the file name that we are testing
file_exists_err <- function(file)
{
	if (!file.exists(file))
	{
		err_msg <- paste('can not find ', file, sep='')
		stop(err_msg)
	}
}

# Concatenates directory and file name in a portable manner, using the native file
# name separator.
#
# @param ... directory,file names, and other arguments passed on to paste.
# @return long file names, which at the very least should be reachable from current
#  working directory.
make_fname <- function(...) paste(..., sep=.Platform$file.sep)
