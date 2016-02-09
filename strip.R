strip = function(features_text,v1){

# The strip function helps to identify the features, which are 
# required for the project.

df3 = data.frame(B=character(),stringsAsFactors=FALSE)

remove = c("ID","Activity")
v2_new = v1 [! v1 %in% remove]
v2 = as.numeric(gsub("V","",as.character(v2_new)))
  for (k in 1:length(v2)){
      ll = v2[k]
      cc = features_text[ll,2]
     # print (class(cc))
      df3[k,] = as.character(cc)
      #print (df3)
  }     
  df3
}