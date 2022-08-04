import pandas as pd
import pandas_datareader as web
import numpy as np
import matplotlib.pyplot as plt
import mplfinance as mpl
import math
#import pprint

symbol=input()
Stock_name=input()
# Get the stock quote
df = web.DataReader(symbol, data_source='yahoo',start='2022-01-14',end='2022-07-14')
#Now Plotting the data

# print(df)
duration = df.shape[0]
#print(df.iloc[0][1])


delta_p = []
delta_t = []
i = 1
while (i < duration):
	deltaP = (df.iloc[i][3]-df.iloc[i-1][3])*100 / df.iloc[i-1][3]
	delta_p.append(deltaP)

	deltaT = (df.iloc[i][3]-df.iloc[i][2])*100 / df.iloc[i][3]
	delta_t.append(deltaT)

	i = i+1

print('% changes with respect to previous closing price --> ',delta_p[:10])
print('\n% changes with respect to previous opening price --> ',delta_t[:10])

# mx = max(deltaT)
# mn = min(deltaT)
# range = mx - mn
# noi = math.sqrt(len(deltaT))
# width_of_intervals = range/noi
plt.hist(delta_t)
plt.show()

# mpl.plot(df, type="candle", mav =(7,14), title = f"{Stock_name}", style="yahoo", volume=True)








# Function to fetch individual stock data
#def StockData(symbol):
#	data   =
#	Ltp    = float(nsepy.get_quote(symbol)["data"][0]["lastPrice"].replace(",",""))
#	Open   = float(nsepy.get_quote(symbol)["data"][0]["open"].replace(",",""))
#	high   = float(nsepy.get_quote(symbol)["data"][0]["dayHigh"].replace(",",""))
#	low    = float(nsepy.get_quote(symbol)["data"][0]["ldayLow"].replace(",",""))
#	Volume = float(nsepy.get_quote(symbol)["data"][0]["totalTradeVolume"].replace(",",""))
#	Vwap   = float(nsepy.get_quote(symbol)["data"][0]["averagePrice"].replace(",",""))

#	pprint.pprint(data)


