# This the main R file for this project. Details can be found in the read.md
# file.

####################################################################
library(reshape2)

# First, read all the required data sets.

train_set = read.table("X_train.txt")

test_set = read.table("X_test.txt")

train_id = read.table("subject_train.txt")

test_id = read.table("subject_test.txt")

activity_train = read.table("y_train.txt")

activity_test = read.table("y_test.txt")

features_text = read.table("features.txt")

###########################################################################

names(train_id) = c("ID")

train_set_id = cbind(train_id,train_set)

names(test_id) = c("ID")

test_set_id = cbind(test_id,test_set)

# merge training and test set
train_test = rbind(train_set_id,test_set_id)


# merge the two activity sets
activity_train_test = rbind(activity_train,activity_test)

# label the activities using function_assign.R
df2 = function_assign(activity_train_test)

# Next merge train_test with df2, activity labels
train_test_new = cbind(train_test,df2)

# Select the columns contianing mean and std, with ID and activity label

v1 = c("ID","V1","V2","V3","V4","V5","V6","V41","V42","V43","V44","V45","V46",
"V81","V82","V83","V84","V85","V86","V121","V122","V123","V124","V125","V126",
"V161","V162","V163","V164","V165","V166","V201","V202","V214","V215","V227",
"V228","V240","V241","V253","V254","V266","V267","V268","V269","V270","V271",
"V345","V346","V347","V348","V349","V350","V424","V425","V426","V427","V428",
"V429","V503","V504","V516","V517","V529","V530","V542","V543","Activity")

train_test_mean_std = train_test_new[,v1]
df3 = strip(features_text,v1)
df3 = rbind("ID",df3)
df3 = rbind(df3,"Activity")
names(train_test_mean_std) = as.vector(df3[,1])
train_test_mean_std_new = train_test_mean_std
data_ID_activity_mean = shaping(train_test_mean_std_new)

write.table(data_ID_activity_mean,file="id_activity_std_mean_average.txt",sep=" ",col.names=TRUE,
row.names=FALSE)

