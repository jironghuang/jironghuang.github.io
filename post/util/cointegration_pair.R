# https://www.r-bloggers.com/time-series-cointegration-in-r/
library(tseries)
cointegration<-function(x,y)
{
  vals<-data.frame(x,y)
  beta<-coef(lm(vals[,2]~vals[,1]+0,data=vals))[1]
  return((adf.test(vals[,2]-beta*vals[,1], alternative="stationary", k=0))$p.value)
}