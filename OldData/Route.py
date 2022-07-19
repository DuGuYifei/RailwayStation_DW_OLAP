from random import choice

station_list = []
with open('Station.csv', mode='r', encoding='utf-8') as file_object:
    for line in file_object:
        station = line.strip()
        station_list.append(station)

# print(station_list)

number = 64
numberStation = 8

f = open('routes.csv', 'w', encoding='utf-8')

route_list = []
for i in range(number):
    route = []
    for j in range(numberStation):
        station = choice(station_list)
        while route.count(station):
            station = choice(station_list)
        route.append(station)
    while route_list.count(route):
        route = []
        for j in range(numberStation):
            station = choice(station_list)
            while route.count(station):
                station = choice(station_list)
            route.append(station)

    for station in route:
        f.write(station + ',')
    f.write('\n')

f.close()

