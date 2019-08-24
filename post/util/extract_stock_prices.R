#Note: Extracting time series data
df_crawl_time_series = function(spTicker, start, end){
  
  #Include try catch, error
  tryCatch({
    
    # start <- as.Date("1950-01-01")
    # end <- as.Date("2020-10-01")
    getSymbols(spTicker,from = start, to = end)
    
    #Remove ^
    spTicker = gsub("\\^", "", spTicker)
    
    stock_price = as.data.frame(get(spTicker))  
    
    stock_price$Date = row.names(stock_price)
    
    names(stock_price) = c("Open", "High", "Low", "Close", "Volume", "Adj.Close", "Date")
    stock_price = subset(stock_price, select = c("Date", "Open", "High", "Low", "Close", "Volume", "Adj.Close"))
    # write.csv(stock_price, paste0("./R/App/Data/output/", spTicker, ".csv"), row.names = F)
    
    return(stock_price)
    
  }, error=function(e){})
}