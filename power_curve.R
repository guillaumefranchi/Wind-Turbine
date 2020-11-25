rm(list=ls())

###---------------- Libraries

library(dplyr)
library(ggplot2)

###--------------- Importing te data

df<-read.csv("wind-farm-totalsignals.csv",sep=";")

power<-read.csv("../DATA/Power_curve.csv",sep=",")
power<-power %>% rename(wind=Wind.speed..m.s.,kW=Power..kW.)

##---------- Sigmoid model for the power curve
test<-nls(kW~SSlogis(input=wind,Asym,xmid,scal),data = power)

pred<-predict(test,newdata = power$wind)
power$eval<-pred

##----------- PLot the power curve

ggplot(power)+aes(x=wind,y=kW)+
  geom_point()+geom_line(aes(y=eval))+
  ggtitle("Power curve of a turbine")+
  xlab("Wind Speed m/s")+ylab("Power Production kW")
  
###---------------- Function for the power
