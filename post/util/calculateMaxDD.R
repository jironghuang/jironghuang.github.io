calculateMaxDD <- function(cumret) {
  # Assume compounded cumulative return as input
  highwatermark <- rep(0, length(cumret))
  highwatermark
  drawdown <- rep(0, length(cumret))
  drawdownduration <- rep(0, length(cumret))
  
  for (t in 2:length(cumret)) {
    highwatermark[t] <- max(highwatermark[t-1], cumret[t]) 
    drawdown[t] <- (1+cumret[t])/(1+highwatermark[t])-1
    if (drawdown[t]==0) {
      drawdownduration[t]=0 
    } else {
      drawdownduration[t]=drawdownduration[t-1]+1
    }  
  }
  
  maxDD <- min(drawdown)
  maxDDD <- max(drawdownduration)
  return(c(maxDD, maxDDD))
  
}