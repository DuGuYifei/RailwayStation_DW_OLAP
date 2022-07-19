import pandas as pd

data = pd.read_csv('OldData/Ticket2.csv', header=None)
for i in range(0, 4019139):
    data[1].values[i] += 387072

data.to_csv('OldData/Ticket3.csv',header=None,index=None)