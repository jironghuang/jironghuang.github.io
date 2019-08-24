calculateReturns <- function(prices, mylag) {
  # How do we add help manual?
 ret<-rbind(matrix(NaN, mylag, ncol(prices)), diff(prices, mylag)/prices[1:(nrow(prices)-mylag),])
  
  
}
  