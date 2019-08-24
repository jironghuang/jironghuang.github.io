library(IBrokers)

##If using tws use twsConnect, gateway ibgconnect
# IBConn=twsConnect(clientId = 1234)
tws = twsConnect(clientId = 999, port = 7496)
id <- reqIds(tws)

##create fx contract, you can also do equities, futures, options etc
Contract2get = twsCurrency("NZD",currency = "USD")

##change the paste0 in enddate time to whatever end date you want for the historical data
test = reqHistoricalData(tws,Contract = Contract2get,whatToShow ='BID_ASK',useRTH = "0",barSize = '1 min',
                         duration="1 D",endDateTime = paste0(gsub("-","",reqCurrentTime(tws))," EST"))


Contract2get = twsSTK("VXX",currency = "USD")

##change the paste0 in enddate time to whatever end date you want for the historical data
test = reqHistoricalData(tws,Contract = Contract2get,whatToShow ='BID_ASK',useRTH = "0",barSize = '1 min',
                         duration="5 D",endDateTime = paste0(gsub("-","",reqCurrentTime(tws))," EST"))


##change the paste0 in enddate time to whatever end date you want for the historical data
Contract2get = twsSTK("VXX",currency = "USD")
data1 = reqHistoricalData(tws,Contract = Contract2get,whatToShow ='BID_ASK',useRTH = "0",barSize = '1 min',
                         duration="1 D",endDateTime = paste0(gsub("-","",reqCurrentTime(tws))," EST"))
data1 = data1[, c(1,4)]
names(data1) = c("Open", "Close")
# data1 = as.data.frame(data1)
# data1$Date = row.names(data1)
data1= subset(data1, select = c("Open", "Close")) 


Contract2get = twsSTK("VIIX",currency = "USD")
data2 = reqHistoricalData(tws,Contract = Contract2get,whatToShow ='BID_ASK',useRTH = "0",barSize = '1 min',
                          duration="1 D",endDateTime = paste0(gsub("-","",reqCurrentTime(tws))," EST"))
data2 = data2[, c(1,4)]
names(data2) = c("Open", "Close")
# data2 = as.data.frame(data2)
# data2$Date = row.names(data2)
data2 = subset(data2, select = c("Open", "Close")) 

data = merge(data1, data2)


reqRealTimeBars(tws, Contract2get, barSize='5')