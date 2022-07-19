f = open("../Station.csv", 'r', encoding='utf-8')

line_list = []

for i in range(100):
    line = f.readline()
    line = line.strip(',')
    line = line.strip('\n')
    line_list.append(line)

f.close()

f = open('ExcelStations.csv', 'r', encoding='utf-8')

count = 0
for i in range(113):
    line = f.readline()
    line = line.strip('\n')
    line1 = line.replace(' ', '-')

    if line_list.count(line) == 0 and line_list.count(line1) == 0:
        count += 1
        print(line)

print(count)
f.close()
