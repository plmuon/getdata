README
=======

The script for the course project is called run_analysis.R. Usage:
* Download and unzip the course project's data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Start R with the working directory being the directory of the unzipped data, i.e. 'UCI HAR Dataset'.
* Source the run_analysis.R script. Assuming it is in the directory above, exectute `source("../run_analysis.R")`
* This will produce the required output file as "averages.txt" in the current working directory.

## How the script works
run_analysis.R first reads all relevant files with read.table. We read the actual data, but also the features.txt and activity_labels.txt. features.txt is used to read the column names; these names are used to select only the mean and standard deviation columns, and to set the column names. activity_labels.txt is used to translate the activities from integer (range 1:6) into a text.

We "grep" the appropriate column numbers and names, then extract these columns from x_test and x_train.

Then (line 24-26) the test and training data are joined. Line 29 sets all column names from the features.txt file names. Line 31,32 clean these names up a bit.

Line 35 translates the activity integers into the respective texts.

Before calculating the averages, lines 38-40 verify that all data is present and no data are missing (na).

Then we produce the average using the aggregate function, computing the mean by activity and subject. In the result (r), we set the first column names to descriptive names.

Line 48 then writes the output file, using write.table as prescribed.
