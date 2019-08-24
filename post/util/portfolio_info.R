#Note: Function to get portfolio info
# tws = twsConnect(clientId = 999, port = 7496)
# id <- reqIds(tws)

#Get ticker and position
position_info = function(i){
  portfolio_value = data.frame(ticker = accountInfo[[i]]$contract$symbol, 
                               position = accountInfo[[i]]$portfolioValue$position)  
  return(portfolio_value)
}

#Get portfolio info
portfolio_info = function(){
  
accountInfo = reqAccountUpdates(tws)[[2]]
len = length(accountInfo)
portfolio = rbind.fill(lapply(1:len, position_info))

return(portfolio)
#If == 0-->length(which(portfolio$ticker == "AAPL"))
}