shaping = function(z){

# The shaping function first melts anmd then casts the skinny data 
# set into a wide format with the mean of each variable for each subject
# and activity. 

 z_melt = melt(z,id.vars=c("ID","Activity"))
 z_mean = dcast(z_melt,ID+Activity~variable,mean)

 z_mean

 }