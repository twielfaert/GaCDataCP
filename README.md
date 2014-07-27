This script processes the test and training set of the UCI_HAR data set. It should be run from the data directory using:
```
source('run_analys.R')
```

The script consists of the following steps:

1. Merge of the training and test set.
2. Selects the variables concerning 'mean' and 'standard deviation' from the data set.
3. Makes the variable names more readable.
4. Merges the measures with the test subjects and the activities.
5. Computes the mean of each variable per test subject and activity.
