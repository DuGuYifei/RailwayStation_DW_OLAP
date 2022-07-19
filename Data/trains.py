f = open('OldData/Train.csv', 'r', encoding='utf-8')
w = open('NewData/Trains.csv', 'w', encoding='utf-8')
trains = []
content = ' '

while content != '':
    content = f.readline()
    words = content.split(',')
    train = words[0]
    train_class = ''
    if train.startswith('EIC'):
        train_class = 'EIC'
    elif train.startswith('EIP'):
        train_class = 'EIP'
    elif train.startswith('IC'):
        train_class = 'IC'
    elif train.startswith('TLK'):
        train_class = 'TLK'
    w.write(f'{train},{train_class}\n')
f.close()
w.close()
