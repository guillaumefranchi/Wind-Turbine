rm(list = ls())

library(dplyr)

##----------- Importing the data

df2016<-read.csv("Documents/Wind Turbine/DATA/wind-farm-1-signals-2016.csv",sep=";")
df2017<-read.csv("Documents/Wind Turbine/DATA/data_wind_prod.csv",sep=";")

##---------- Concatenate the data

df<-rbind.data.frame(df2016,df2017)

##---------- Some modification

summary(df)

df$Turbine_ID<-as.factor(df$Turbine_ID)
df$Timestamp<-as.POSIXct(df$Timestamp, format="%Y-%m-%dT%H:%M:%S")

##---------- Exporting the data

write.table(x=df,file="wind-farm-totalsignals.csv",sep=";",row.names=FALSE)
