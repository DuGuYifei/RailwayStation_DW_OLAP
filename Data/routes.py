f = open('OldData/Route1.csv', 'r', encoding='utf-8')
sb = open('NewData/Routes.csv', 'w', encoding='utf-8')

content = ' '
id_r = 0

while content != '':
    content = f.readline()
    words = content.split(',')
    if words == ['']:
        break
    id_r = id_r + 1
    name = words[1]
    seat = int(words[2])
    train = words[3]
    seat_c = ""
    if seat > 480:
        seat_c = "large"
    elif seat > 420:
        seat_c = "medium"
    else:
        seat_c = "small"
    distance = "medium"
    sb.write(f'{id_r},{name},{seat_c},{distance},{train},0\n')
f.close()

f = open('OldData/Route2.csv', 'r', encoding='utf-8')

content = ' '
while content != '':
    content = f.readline()
    words = content.split(',')
    if words == ['']:
        break
    id_r = id_r + 1
    name = words[1]
    seat = int(words[2])
    train = words[3]
    seat_c = ""
    if seat > 480:
        seat_c = "large"
    elif seat > 420:
        seat_c = "medium"
    else:
        seat_c = "small"
    distance = "medium"
    sb.write(f'{id_r},{name},{seat_c},{distance},{train},0\n')
f.close()
sb.close()
