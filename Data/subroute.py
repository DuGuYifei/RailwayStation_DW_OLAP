f = open('OldData/RouteSubset1.csv', 'r', encoding='utf-8')
sb = open('NewData/Subroutes.csv', 'w', encoding='utf-8')

content = ' '
id_sr = 0
while content != '':
    content = f.readline()
    words = content.split(',')
    if words == ['']:
        break
    id_sr = id_sr + 1
    id_r = words[1]
    start = words[3]
    end = words[5]
    sb.write(f'{id_sr},{id_r},{start},{end}\n')
f.close()

f = open('OldData/RouteSubset2.csv', 'r', encoding='utf-8')

content = ' '
while content != '':
    content = f.readline()
    words = content.split(',')
    id_sr = id_sr + 1
    id_r = words[1]
    start = words[3]
    end = words[5]
    sb.write(f'{id_sr},{id_r},{start},{end}\n')
f.close()
sb.close()
