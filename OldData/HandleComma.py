def add_comma(file):
    lines = []
    f = open(file, 'r', encoding='utf-8')
    for each_line in f:
        each_line_list = list(each_line)
        each_line_list.insert(0, ',')
        lines.append(each_line_list)
    f.close()

    f = open(file, 'w', encoding='utf-8')
    for each_line in lines:
        f.writelines("".join(each_line))
    f.close()


def remove_comma(file):
    lines = []
    f = open(file, 'r', encoding='utf-8')
    for each_line in f:
        each_line_list = list(each_line)
        each_line_list.pop(len(each_line_list) - 2)
        lines.append(each_line_list)
    f.close()

    f = open(file, 'w', encoding='utf-8')
    for each_line in lines:
        f.writelines("".join(each_line))
    f.close()


# add_comma("ConsistentWithExcel_Station.csv")
remove_comma("Route1.csv")
remove_comma("Route2.csv")
add_comma("Train_class.csv")
add_comma("Station.csv")
add_comma("CustomerName.csv")
add_comma("Route1.csv")
add_comma("Route2.csv")
add_comma("RouteSubset1.csv")
add_comma("RouteSubset2.csv")
add_comma("Ticket1.csv")
add_comma("Ticket2.csv")
