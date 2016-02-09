function_assign = function(x){

# This function assigns labels to the activity for easy reading.

 df1 = data.frame(Activity=character(),stringsAsFactors=FALSE)

 d = NULL

 v1 = c(dim(x))

 for (i in 1:v1[1]){


 if (x[i,]=="1"){
 d = c("WALKING")
} else if (x[i,]=="2"){ 
 d = c("WALKING_UPSTAIRS")
} else if (x[i,]=="3"){
 d = c("WALKING_DOWNSTAIRS")
} else if (x[i,]=="4"){
 d = c("SITTING")
}else if (x[i,]=="5"){
 d = c("STANDING")
}else {
 d = c("LAYING")
}

  df1[i,] = d
   
}
 df1
 }
