train_class = {'EIP': '1', 'EIC': '2', 'IC': '3', 'TLK': '4'}

# each type of train have 64
train_number = 64

f = open('Train.csv', 'w', encoding='utf-8')

for i in range(1, train_number + 1):
    train = "EIP53" + "%02d" % i
    f.write(train + ',' + train_class['EIP'] + '\n')

for i in range(1, train_number + 1):
    train = "EIC52" + "%02d" % i
    f.write(train + ',' + train_class['EIC'] + '\n')

for i in range(1, train_number + 1):
    train = "IC51" + "%02d" % i
    f.write(train + ',' + train_class['IC'] + '\n')

for i in range(1, train_number + 1):
    train = "TLK83" + "%03d" % i
    f.write(train + ',' + train_class['TLK'] + '\n')

f.close()
