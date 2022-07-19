w = open('NewData/Time.csv', 'w', encoding='utf-8')

for i in range(0, 23):
    for j in range(0, 59):
        w.write(f',{i},{j}\n')
w.close()
