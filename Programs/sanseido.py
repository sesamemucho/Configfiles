#!/usr/bin/env python3
import requests
from bs4 import BeautifulSoup
import re
import sys

search_text = sys.argv[1]
url = f"https://www.sanseido.biz/User/Dic/Index.aspx?TWords={search_text}&st=0&DORDER=&DailyJJ=checkbox"
request = requests.get(url)
if request.status_code == 200:
    html = request.text
    soup = BeautifulSoup(html, "html.parser")
    word = soup.find(id="word").get_text().strip()
    body = soup.find(id="wordBody").get_text().strip()
    pronounciation = re.search("^\w*", word)
    kanji = re.search("［\w*］", word)
    # print("word: " + word)
    # print("body: " + body)
    # print("pronounciation: " + pronounciation.group())
    print(body)
    try:
        pass
        # print("kanji: " + kanji.group())
    except AttributeError:
        # print("no kanji available")
        pass



