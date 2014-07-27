This script processes the test and training set of the UCI_HAR data set. The working directory should be set to the Samsung data directory. The script can be executed from the R terminal with the following command:
```
source('run_analysis.R')
```

The script goes through the following steps:

1. Merge of the training and test set.
2. Selects the variables concerning 'mean' and 'standard deviation' from the data set.
3. Makes the variable names more readable.
4. Merges the measures with the test subjects and the activities.
5. Computes the mean of each variable per test subject and activity.

Step 1-4 result in an data frame named 'data'.
The output of step 5 is stored in 'data2'.
