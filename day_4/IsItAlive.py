from bs4 import BeautifulSoup
import requests
import re
import sys

# url = "https://stackoverflow.com/"

url = input("Enter URL (https://example.com/): ")

page = requests.get(url)
data = page.text
soup = BeautifulSoup(data)

# print(soup)

urls_list = []
for link in soup.find_all('a'):
    if "https" in str(link.get('href')):
        # print(link.get('href'))
        urls_list.append(link.get('href'))

# print(urls_list)
print(len(urls_list))

for stats  in urls_list:
    req = requests.get(stats)
    print("{} --> [{}]".format(stats,req.status_code))

