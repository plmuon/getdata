# GettingData Course Project.

# read all relevant files
x_test <- read.table("test/X_test.txt", )
act_test <- read.table("test/y_test.txt")
sub_test <- read.table("test/subject_test.txt")
x_train <- read.table("train/X_train.txt")
act_train <- read.table("train/y_train.txt")
sub_train <- read.table("train/subject_train.txt")
features <- read.table("features.txt")
act_labels <- read.table("activity_labels.txt")

# extract measurements on the mean and std.dev for each measurement
# these are all columns with feature ending in mean() or std()
# (note: https://class.coursera.org/getdata-006/forum/thread?thread_id=43 
# "what colums are measurements on the mean and standard deviation")
features <- features[grep("(mean|std)\\(\\)$",features$V2),]

# extract the columns features[,1]
meanstd_test <- x_test[,features[,1]]
meanstd_train <- x_train[,features[,1]]

# append test and train rows
data <- rbind(meanstd_test, meanstd_train)
act <- rbind(act_test,act_train)
sub <- rbind(sub_test,sub_train)

# set the column names directly to the strings from the features file, column 2
names(data) <- features[,2]
# clean the names: remove (), remove - and capitalize the word after it (Mean of Std)
names(data) <- gsub('\\(\\)','',names(data))
names(data) <- gsub('-(.)','\\U\\1',names(data),perl=T)

# translate into text from the file activity_labels.txt
act_txt <- act_labels[act[[1]],2]

# verify there's no missing data
stopifnot(all(colSums(is.na(data))==0))
stopifnot(any(is.na(act_txt))==F)
stopifnot(any(is.na(sub))==F)

# mean by activity,subject
r <- aggregate(data, by=list(act_txt,sub[[1]]), FUN=mean)
# set column labels
names(r)[1:2] <- c("activity","subject")

# create txt file, with write.table using row.name=FALSE as specified
write.table(r, file="averages.txt", row.names=F)
