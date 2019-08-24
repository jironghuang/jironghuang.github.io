contract = twsCFD("IBUS500","SMART",currency = "USD")
reqMktData(tws, Contract=contract, snapshot = T)

contract = twsCurrency("AUD.CAD","SMART",currency = "USD")
reqMktData(tws, Contract=contract, snapshot = T)

#To get currency details
contract = twsCurrency("USD", "CAD")
reqMktData(tws, Contract=contract, snapshot = T)

#To get currency details
contract = twsCurrency("USD", "CAD")
reqHistoricalData(tws, Contract=contract, snapshot = T)