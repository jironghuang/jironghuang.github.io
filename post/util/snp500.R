#https://www.businessinsider.com/how-to-use-a-pairs-trading-strategy-with-etfs-2013-2/?IR=T

source("R/util/cointegration.R")

#Try cointegration strategy against respective sector ETFs
snp500 = read.csv("R/util/snp500_list.csv", stringsAsFactors = F)

#Tabulate by sectors & industries
table(snp500$GICS.Sector)
# Consumer Discretionary           Consumer Staples                     Energy                 Financials                Health Care                Industrials 
# 80                         33                         31                         68                         63                         67 
# Information Technology                  Materials                Real Estate Telecommunication Services                  Utilities 
# 75                         24                         32                          3                         29 

table(snp500$GICS.Sub.Industry)

#Find cointegration pairs in a list of indexes
fin = pair(snp500$Ticker.symbol[which(snp500$GICS.Sector == "Financials")])
tele = pair(snp500$Ticker.symbol[which(snp500$GICS.Sector == "Telecommunication Services")])
drinks = pair(snp500$Ticker.symbol[which(snp500$GICS.Sub.Industry == "Soft Drinks")])
adv = pair(snp500$Ticker.symbol[which(snp500$GICS.Sub.Industry == "Advertising")])

pair_industry = function(industry){
  combi = pair(snp500$Ticker.symbol[which(snp500$GICS.Sub.Industry == industry)])
  return(combi)
}


#Run a loop to see cointegrated relationships
ind = unique(snp500$GICS.Sub.Industry)

#Store all cointegrated pairs
data = sapply(ind, pair_industry)

#Concatenate all dataframes
data_agg = do.call("rbind", data)

#Test sector ETFs
pair(c("RWR", "XLB", "XLI", "XLY", "XLP", "XLE", "XLF", "XLU", "XLV", "XLK", "IYT"))


