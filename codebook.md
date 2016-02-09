         
         
         
            
This codebook describes the R script, **run_analysis.R**. This R code comprises of following sections;
*	Reading data
*	Helper functions, and 
*	Data manipulation.

## Reading Data ##



 The data folder **"getdata-projectfiles-UCI HAR Dataset"** was unzipped into the working directory. Using the command read.table(filename) the relevant files were loaded into R. For example;

  train_set = read.table("X_train.txt"), test_set = read.table("X_test.txt")

Here, *train_set* and *test_set* refer to the training and test sets. Similarly, other files were read. They include;

 train_id = read.table("subject_train.txt"), test_id = read.table("subject_test.txt")

 activity_train = read.table("y_train.txt"),activity_test = read.table("y_test.txt"), and

 features_text = read.table("features.txt"). All of these objects were read as data frames.

Here:

   1. train_id refers to subject id in the training set,
   2. test_id refers to subject id in test set,
   3. activity_train refers to the activitylabels in training set,
   4. activity_test refers to activitylabels in test set,
   5. features_text refers to entire list of features, i.e.measurements. There are 561 measurements, which were taken on the subjects.

## Helper Functions ##


To avoid repetition of code and to make the code more readable, several auxiliary functions were implmented. They are *function_assign.R*,*strip.R*, and *shaping.R*.  These functions have been called in the main program,**run_analysis.R**. For more details regaridng these functions, please refer to the readme.md.


## Data Manipulation ##


The transformation of data consists of following steps:
1. To begin with, train_id is merged with train_set.Similarly, test_id is merged with test_set.

2. Next, we merge train_set and test_set to form train_test.
 
3. Then, the two activities set, activity_train and activity_test are merged together to get activity_train_test.

4. We call the function function_assign () on activity_train_test  to assign text labels to the activity labels(1,....,6). The text labels are provided in the file activity_labels.

5. After assigning text labels to the activities, we merge the activity_train_test and train_test to get the complete data set, called train_test_new. It is a data frame.

6. Next, we extract only those columns from train_test_new, which correspond to mean and standard deviation for each measurement.The resulting data frame is called train_test_mean_std.

7. Next, we call the strip() function on features_text, so as to label the variables appropriately. 

8. At this step, we have a data set, which contains only variables, corresponding to mean and standard deviations for each measurement. Moreover, all the variables are named appropriately, called train_test_mean_std_new.

9. Our next job was to melt the data set,(obtained in above step). Using function shaping() the data set was melted and then dcasted into a wide format, so that the average value of each variable for each user ID and activity can be calculated. 

10. The final tidy set with the required measurements  has 180 observations and 68 variables, and has been loaded into data_ID_activity_mean. This is a data frame, and some of its entries are shown below.

##Example##

  ID      Activity        tBodyAcc-mean()-X     tBodyAcc-mean()-Y      tBodyAcc-mean()-Z
| ----- | ----------- |  -------------------- | ------------------- |  ------------------
|  1    |     LAYING  |        0.2215982      |    -0.040513953     |     -0.1132036    
|       |             |                       |                     |
|  1    |    SITTING  |        0.2612376      |    -0.001308288     |    -0.1045442 


     
     
##Format##


     The final data set is a  data frame with 180 observations on 68 variables. Here **ID** is a numeric vector, **Activity** is a

     character vector, and rest variables are numeric vectors.

    
