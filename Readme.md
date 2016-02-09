#Getting and Cleaning Data Course Project in R#



This project implements our skills in asessing and making a data set tidy using data manipulation skills in R. The main file is called 
**run_analysis.R.**



##run_analysis.R##



In this file, we read in all the relevant data sets, using **read.table()**. For instance, 

 
```train_set = read.table("X_train.txt")


   test_set = read.table("X_test.txt") ```,


and few more. These data frames are merged as per the instructions provided in the project. Moreover, this file sources the *three other .R* files, which are implementing the helper functions.



###function_assign.R###



The input of this function is the data frame, consisting of *numeric*  labels for the activities. The main job of this function is to  label the activity for easy reading. For instance, **1** refers to **WALKING**, **2** refers to **WALKING_UPSTAIRS**, etc.. The output of this function is a data frame. Some of the entries of this data frame are,


 
                 Activity

                  --------
                   
                  WALKING
  
                 
             WALKING_UPSTAIRS
  
                    
                 LAYING
  
  


### strip.R###



The goal of this function is to first select all the relevant features,(**mean and standard deviation** for each measurement) and assign proper names to the variables, as provided in **features.txt**.  The output of this function is a data frame, with the suitable names for the variables of interest. For example, some of the entries of the data frame include

 


                  B
                
               --------
                
          tBodyAcc-mean()-X
                
                
          tBodyAcc-mean()-Y 
                
                
          tBodyAcc-mean()-Z.

###shaping.R###



The goal of this function is to take the data set obtained in step 4 of the assignment, and use some strategies (melting and dcasting) to find the average of the each variable for each user and each activity. The output of this function is assigned to data frame, called **data_ID_activity_mean**. Some of the rows and few columns of the data frame  are shown below;







|   ID       |  Activity |   tBodyAcc-mean()-X   |  tBodyAcc-mean()-Y  |  tBodyAcc-mean()-Z |
|            |           |                       |                     |                    |  
|  --------  |-----------|  -------------------  |   ----------------  |  ------------------| 
|            |           |                       |                     |                    | 
|  1         | LAYING    |       0.2215982       |  -0.040513953       |   -0.1132036       |
|            |           |                       |                     |                    | 
|  1         | SITTING   |      0.2612376        |  -0.001308288       |   -0.1045442       |



Next, this data frame is loaded into a text file called **id_activity_std_mean_average.txt**, using **write.table()**.

