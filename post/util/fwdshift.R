fwdshift <- function(mylag, x) {

  rbind(as.matrix(x[(mylag+1):nrow(x),]), matrix(NaN, mylag, ncol(x)))

}