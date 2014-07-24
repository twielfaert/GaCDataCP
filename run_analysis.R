## Read the files from training and test set
X_test <- read.table('test/X_test.txt', header=F)
y_test <- read.table('test/y_test.txt', header=F)
subject_test <- read.table('test/subject_test.txt', header=F)
X_train <- read.table('train/X_train.txt', header=F)
y_train <- read.table('train/y_train.txt', header=F)
subject_train <- read.table('train/subject_train.txt', header=F)
activity_labels <- read.table('activity_labels.txt', header=F)
features <- read.table('features.txt', header=F)

## Combine training and test data
X_all <- rbind(X_test, X_train)
y_all <- rbind(y_test, y_train)
subject_all <- rbind(subject_test, subject_train)

## Select the variables representing mean() and std()
colnames(X_all) <- features[,2]
select <- c(grep("mean\\(", names(X_all)), grep("std\\(", names(X_all)))
select <- sort(select)
colSelection <- X_all[select]

## Remove the () from the variable names
colnames(colSelection) <- sub("\\(\\)", "", colnames(colSelection))

## Convert the activity numbers into labels
activity <- activity_labels[unlist(y_all),][2]

## Assign names to the "Activity" and "Subject" column
colnames(activity) <- "Activity"
colnames(subject_all) <- "Subject"

## Add the "Activity" and "Subject" column left from the data
data <- cbind(activity, colSelection)
data <- cbind(subject_all, data)


## Compute the means per Subject and Activity and create new data set
data2 <- aggregate(data[, c(-1, -2)], 
                   list(data$Subject, data$Activity), mean)
data2 <- data2[order(data2$Group.1),]

## Adapt the variable names for the data set with means
colnames(data2)[1:2] <- c("Subject", "Activity")
colnames(data2)[3:length(colnames(data2))] <- 
  paste0("mean.", colnames(data2)[3:length(colnames(data2))])