rm(list=ls())

###--------------- Estimation of the normal production

power.eval<-function(wind){
  ##---------- Coefficients estimated by a non-linear regression
  a<-2014.625
  b<-8.19199
  c<-1.318577
  return(a/(1+exp((b-wind)/c)))
}
