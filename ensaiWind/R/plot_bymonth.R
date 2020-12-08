plot.bymonth<-function(df,x,y){
  #-- x and y are two characters
  #-- df is a data frame with a column Timestamp and Turbine_ID, and for one
  #-- year
  #-- df must contain columns with names x and y
  #-- It will then do a scatterplot for each month of the year of y in function
  #-- of x

  sel<- df %>% select(Turbine_ID,Timestamp,x,y)
  m<-c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")
  month_ID<-month(sel$Timestamp)
  month_ID<-as.factor(month_ID)
  levels(month_ID)<-m
  sel$Month_ID<-month_ID
  year<-year(sel$Timestamp[1])

  print(ggplot(sel)+aes_string(x=x,y=y,color="Turbine_ID")+
    geom_point()+ggtitle(paste("Year",year))+
    facet_wrap(.~Month_ID,ncol=3,nrow = 4))
}
