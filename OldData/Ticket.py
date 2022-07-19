from random import choice
import datetime
import random

# departure_time: assume need 10 minutes to arrive each next station
number_customer = 1000 + 1
seat_row = 14
seat_column = 4
col_id = {0: 'A', 1: 'B', 2: 'C', 3: 'D'}
interval_in_route = 7
distance_unit = 10

start_station_go = []
start_station_back = []
end_station_go = []
end_station_back = []

for start in range(7):
    for end in range(start + 1, 8):
        start_station_go.append(start)
        end_station_go.append(end)

for start in range(7, 0, -1):
    for end in range(start - 1, -1, -1):
        start_station_back.append(start)
        end_station_back.append(end)


def random_time(time_str):
    e_time = datetime.datetime.strptime(time_str, '%Y%m%d %H:%M')
    s_time = e_time - datetime.timedelta(days=5)
    # print(datetime.datetime.strftime(random.random() * (e_time - s_time) + s_time, format("%Y%m%d %H:%M:%S")))
    return datetime.datetime.strftime(random.random() * (e_time - s_time) + s_time, format("%Y%m%d %H:%M:%S"))


def sell_ticket(route_file_name, ticket_file_name, first_length=0):
    f_route = open(route_file_name, 'r', encoding='utf-8')
    line = f_route.readline()
    seat_num_list = []
    depart_time_list = []
    while line != '':
        line_list = line.split(',')
        seat_num = int(line_list[1])
        seat_num_list.append(seat_num)
        depart_time_list.append(line_list[3])
        line = f_route.readline()
    f_route.close()

    f_ticket = open(ticket_file_name, 'w', encoding='utf-8')

    for route_id in range(0, len(seat_num_list)):
        print(route_id)
        remaining_tickets = [seat_num_list[route_id]] * 28
        is_back = route_id % 2
        depart_time_train = depart_time_list[route_id]
        total_distance = int(seat_num_list[route_id]) * interval_in_route * distance_unit
        passenger_distance = 0
        random_list = list(range(1, 29))
        for id_customer in range(1, number_customer):
            if remaining_tickets.count(0) == 28:
                break

            index_1_28 = choice(random_list)
            start_station = start_station_go[index_1_28 - 1]
            end_station = end_station_go[index_1_28 - 1]

            if is_back:
                start_station = start_station_back[index_1_28 - 1]
                end_station = end_station_back[index_1_28 - 1]
                remaining_tickets[index_1_28 - 1] -= 1
                for remaining_tickets_index in range(28):
                    if start_station_back[remaining_tickets_index] > end_station and \
                            end_station_back[remaining_tickets_index] < start_station:
                        remaining_tickets[remaining_tickets_index] -= 1
                        if remaining_tickets[remaining_tickets_index] == 0:
                            random_list.remove(remaining_tickets_index + 1)
                            # print(f"-------{remaining_tickets_index}--{id_customer}--sell out-")

            else:
                for remaining_tickets_index in range(28):
                    if start_station_go[remaining_tickets_index] < end_station and \
                            end_station_go[remaining_tickets_index] > start_station:
                        remaining_tickets[remaining_tickets_index] -= 1
                        if remaining_tickets[remaining_tickets_index] == 0:
                            random_list.remove(remaining_tickets_index + 1)
                            # print(f"-------{remaining_tickets_index}--{id_customer}--sell out-")

            id_sr = route_id * 28 + index_1_28

            if is_back:
                depart_time = (7 - start_station_back[index_1_28 - 1]) * 10
            else:
                depart_time = start_station_back[index_1_28 - 1] * 10

            depart_time = datetime.datetime.strftime(datetime.datetime.strptime(depart_time_train, '%Y%m%d %H:%M') +
                                                     datetime.timedelta(minutes=depart_time), "%Y%m%d %H:%M")
            sales_time = random_time(depart_time)
            carriage = "%02d" % (id_customer // (seat_row * seat_column) + 1)
            col = col_id[id_customer % seat_column]
            row = "%02d" % ((id_customer // 4 + 1) % seat_row)
            seat = carriage + row + col

            f_ticket.write(f"{id_sr + first_length},{id_customer},{depart_time},{seat},{sales_time}\n")

            passenger_distance += abs(start_station - end_station) * distance_unit
            occupancy_rate = passenger_distance / total_distance
            # print(occupancy_rate)

            if occupancy_rate >= 0.6:
                if random.random() < 0.5:
                    break
            elif occupancy_rate >= 0.55:
                if random.random() < 0.4:
                    break
            elif occupancy_rate >= 0.5:
                if random.random() < 0.2:
                    # print(occupancy_rate)
                    break
            elif occupancy_rate >= 0.45:
                if random.random() < 0.1:
                    # print(occupancy_rate)
                    break
            elif occupancy_rate >= 0.4:
                if random.random() < 0.05:
                    # print(occupancy_rate)
                    break

    f_ticket.close()


sell_ticket("Route1.csv", "Ticket1.csv")
sell_ticket("Route2.csv", "Ticket2.csv", 28 * 64 * 2 * 4) # 这里错了，应该再乘28天（2月）
