###--------------- Determining the data frame of interest for a certain period

window.failure<-function(df,date.fail,days){
  #-- df is the data frame containing all the data of interest
  #-- date.fail is the date of failure
  #-- days is the number of days for the windows

  min.date<-date.fail-3600*24*days
  res<-df[which(min.date<=df$Timestamp & df$Timestamp<=date.fail),]
  return(res)
}
