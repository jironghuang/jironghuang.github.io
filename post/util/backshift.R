backshift <- function(mylag, x) {
  rbind(matrix(NaN, mylag, ncol(x)), as.matrix(x[1:(nrow(x)-mylag),]))
  
}