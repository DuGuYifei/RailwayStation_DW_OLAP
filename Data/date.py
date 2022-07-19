w = open('NewData/Date.csv', 'w', encoding='utf-8')

for i in range(20, 31):
    w.write(f',{20220100 + i},2022,1,{i},January\n')

for i in range(1, 28):
    w.write(f',{20220200 + i},2022,2,{i},February\n')

for i in range(1, 20):
    w.write(f',{20220300 + i},2022,3,{i},March\n')

w.close()

