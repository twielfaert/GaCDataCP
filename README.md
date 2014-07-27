This script processes Human Activity Recognition Using Smartphones Dataset to a 'tidy' data set. The working directory should be set to the data directory first. Subsequently, the script can be executed from the R terminal with the following command:
```
source('run_analysis.R')
```

The script processes the raw data as follows:

1. Merge of the training and test set.
2. Extract the variables concerning 'mean()' and 'sd()' (standard deviation) from the data set.
3. Make the variable names better readable by removing parentheses.
4. Add the corresponding Subject ids and Activity names the measures.
5. Compute the mean of each variable per test subject and activity.

Step 1-4 result in an data frame named 'data'.
The output of step 5 is stored in 'data2'.
