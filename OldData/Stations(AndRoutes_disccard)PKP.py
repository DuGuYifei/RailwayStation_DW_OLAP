import requests
from bs4 import BeautifulSoup

# it gets them from today only, so might be wise to run it in the morning hehe, might be more pages so its TODO for me
stations = []
f = open("Station.csv", "w", encoding='utf-8')
f2 = open("routes.csv", "w", encoding='utf-8')
page_number = 1
for page_number in range(1, 6):
    content = requests.get(f"https://portalpasazera.pl/KatalogStacji?p={page_number}")
    soup = BeautifulSoup(content.text, 'lxml')
    try:
        divTag = soup.find_all("div", class_="popular-stations_item abt-focusable")
        # print(divTag)
        for tag in divTag:
            span = tag.find("span")
            stationName = span.text
            stations.append(stationName)
            f.write(stationName + '\n')
            # print(stationName)
            href = tag.find("a")
            # print(f"https://portalpasazera.pl{href['href']}")
            url = f"https://portalpasazera.pl{href['href']}"
            site = requests.get(url)
            soup2 = BeautifulSoup(site.text, 'lxml')
            try:
                routeTags = soup2.find_all("div", class_="col-2 col-12--phone")
                for route in routeTags:
                    span = route.find_all("span")
                    # First column: station - second is starting station of route, then ending station of route
                    # print(stationName + ";" + span[2].text + ";" + span[3].text)
                    spanIndex = 2
                    a = stationName
                    while spanIndex < len(span):
                        a = a + ',' + span[spanIndex].text
                        spanIndex += 1
                    print(a)
                    # f2.write(stationName + "," + span[2].text + "," + span[3].text + ',\n')
            except TypeError:
                print(TypeError)
    except TypeError:
        print(TypeError)
        pass

f.close()
f2.close()

# url="https://portalpasazera.pl/KatalogStacji?stacja={station_name}&p={page_number}"
