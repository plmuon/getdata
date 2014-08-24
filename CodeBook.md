Code book
=======

The original data, from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, contain a detailed description of the experiment used to obtain the data in README.txt, and a description of the columns and their names in features_info.txt.

The following describes how the output file, the tidy data set "averages.txt" was derived from the original data:
* training and test data were merged
* only the columns whose names end in -mean() or -std() were selected and are present in the output.
* the output file contains a header line listing the column names
* the first column, activity, contains the texts of the activities as provided in the original data
* the second column, subject, identifies one of the 30 (numbered) test persons.
* the other columns contain the mean value of the measurements for the activity and test subject.
** e.g. the third column, tBodyAccMagMean, contains the mean value of the tBodyAccMag-mean() measurements for the activity and test subject.
* the column names for the measurements were cleaned up a little bit:
** the original column names contains a measurements, followed by -mean(), -max() etc (see features_info.txt in the test data zip file).
** the braces were removed
** the - was removed
** mean and std were capitalized
** e.g. the original column name tBodyAccMag-mean() was renamed to tBodyAccMagMean
