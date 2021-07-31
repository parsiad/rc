#!/usr/bin/env python

import argparse
import json
import sys
import urllib.request
import urllib.parse

_URL = 'https://api.waqi.info/feed/{location}/?token={token}'

parser = argparse.ArgumentParser(description='Get AQI from aqicn.org')
parser.add_argument('location', type=str)
parser.add_argument('--token', default='c7040e4acaa9793d5dbb5f5e7c82333951430123', type=str)
args = parser.parse_args()

location = urllib.parse.quote(args.location)

url = _URL.format(location=location, token=args.token)

res = urllib.request.urlopen(url, timeout=1)
res = res.read()
res = json.loads(res)

if res['status'] == 'error':
    print(-1)
    sys.exit(1)

print(res['data']['aqi'])
