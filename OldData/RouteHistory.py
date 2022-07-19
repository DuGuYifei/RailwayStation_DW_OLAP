from random import choice

seat_row = 14
seat_column = 4
seat_carriage = seat_column * seat_row
SeatNum_list = [6 * seat_carriage, 7 * seat_carriage, 8 * seat_carriage, 9 * seat_carriage, 10 * seat_carriage]
# fake distance = 10km * abs(station1 ordinal - station2 ordinal)

f1 = open("Route1.csv", 'w', encoding='utf-8')
f2 = open("Route2.csv", 'w', encoding='utf-8')
f3 = open("RouteSubset1.csv", 'w', encoding='utf-8')
f3_1 = open("RouteSubset2.csv", 'w', encoding='utf-8')
ID_R = 1

f4 = open("Station.csv", 'r', encoding='utf-8')
station = ' '
station_list = []
while station != '':
    station = f4.readline()
    station = station.strip('\n')
    station = station.strip(',')
    station_list.append(station)
f4.close()

with open('routes.csv', mode='r', encoding='utf-8') as file_object:
    d_list = []
    # iteration for the route to ensure every route has train in use for similar amount
    train_id = 1
    for line in file_object:
        stations = line.split(',')
        Departure_Hub_EndName_go = stations[0] + ' - ' + stations[3] + ' - ' + stations[7]
        Departure_Hub_EndName_back = stations[7] + ' - ' + stations[3] + ' - ' + stations[0]

        if d_list.count(Departure_Hub_EndName_go) or d_list.count(Departure_Hub_EndName_back) > 0:
            print("they are same")
        d_list.append(Departure_Hub_EndName_go)
        d_list.append(Departure_Hub_EndName_back)

        Train = ["EIP53" + "%02d" % train_id, "EIC52" + "%02d" % train_id, "IC51" + "%02d" % train_id,
                 "TLK83" + "%03d" % train_id]
        train_id += 1

        Departure_Time_Hours_Go = ["8:00", "10:00", "12:00", "14:00"]
        Departure_Time_Hours_Back = ["10:00", "12:00", "14:00", "16:00"]

        for date in range(20220201, 20220229):
            for i in range(len(Train)):
                Departure_Time = f"{date}" + ' ' + Departure_Time_Hours_Go[i]
                Amount_Seat = choice(SeatNum_list)
                f1.write(Departure_Hub_EndName_go + ',' +
                         f"{Amount_Seat}" + ',' + Train[i] + ',' + Departure_Time + ',\n')

                for start in range(7):
                    for end in range(start + 1, 8):
                        f3.write(
                            f"{ID_R},{station_list.index(stations[start]) + 1},{start + 1},"
                            f"{station_list.index(stations[end]) + 1},{end + 1}," + f"{abs(start - end) * 10}" + '\n')

                ID_R += 1

                Departure_Time = f"{date}" + ' ' + Departure_Time_Hours_Back[i]
                Amount_Seat = choice(SeatNum_list)
                f1.write(Departure_Hub_EndName_back + ',' +
                         f"{Amount_Seat}" + ',' + Train[i] + ',' + Departure_Time + ',\n')

                for start in range(7, 0, -1):
                    for end in range(start - 1, -1, -1):
                        f3.write(
                            f"{ID_R},{station_list.index(stations[start]) + 1},{start + 1},"
                            f"{station_list.index(stations[end]) + 1},{end + 1}," + f"{abs(start - end) * 10}" + '\n')
                ID_R += 1

# the same with above but for a lot of small parameter doesn't wanna change, I didn't make it be def function
# below is just for the second time slot.
with open('routes.csv', mode='r', encoding='utf-8') as file_object:
    d_list = []
    # iteration for the route to ensure every route has train in use for similar amount
    train_id = 1
    for line in file_object:
        stations = line.split(',')
        Departure_Hub_EndName_go = stations[0] + ' - ' + stations[3] + ' - ' + stations[7]
        Departure_Hub_EndName_back = stations[7] + ' - ' + stations[3] + ' - ' + stations[0]

        if d_list.count(Departure_Hub_EndName_go) or d_list.count(Departure_Hub_EndName_back) > 0:
            print("they are same")
        d_list.append(Departure_Hub_EndName_go)
        d_list.append(Departure_Hub_EndName_back)

        Train = ["EIP53" + "%02d" % train_id, "EIC52" + "%02d" % train_id, "IC51" + "%02d" % train_id,
                 "TLK83" + "%03d" % train_id]
        train_id += 1

        Departure_Time_Hours_Go = ["8:00", "10:00", "12:00", "14:00"]
        Departure_Time_Hours_Back = ["10:00", "12:00", "14:00", "16:00"]

        for date in range(20220301, 20220319):
            for i in range(len(Train)):
                Departure_Time = f"{date}" + ' ' + Departure_Time_Hours_Go[i]
                Amount_Seat = choice(SeatNum_list)
                f2.write(Departure_Hub_EndName_go + ',' +
                         f"{Amount_Seat}" + ',' + Train[i] + ',' + Departure_Time + ',\n')
                for start in range(7):
                    for end in range(start + 1, 8):
                        f3_1.write(
                            f"{ID_R},{station_list.index(stations[start]) + 1},{start + 1},"
                            f"{station_list.index(stations[end]) + 1},{end + 1}," + f"{abs(start - end) * 10}" + '\n')
                ID_R += 1

                Departure_Time = f"{date}" + ' ' + Departure_Time_Hours_Back[i]
                Amount_Seat = choice(SeatNum_list)
                f2.write(Departure_Hub_EndName_back + ',' +
                         f"{Amount_Seat}" + ',' + Train[i] + ',' + Departure_Time + ',\n')
                for start in range(7, 0, -1):
                    for end in range(start - 1, -1, -1):
                        f3_1.write(
                            f"{ID_R},{station_list.index(stations[start]) + 1},{start + 1},"
                            f"{station_list.index(stations[end]) + 1},{end + 1}," + f"{abs(start - end) * 10}" + '\n')
                ID_R += 1

f1.close()
f2.close()
f3.close()
f3_1.close()
