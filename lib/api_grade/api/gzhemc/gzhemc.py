#!/usr/bin/env python
# -*- coding: utf-8 -*-

import urllib
import pycurl
import re
import StringIO
import json
import logging
import sys

__version__ = '0.1'

LOGIN_TIMEOUT = 15
REQUEST_TIMEOUT = 25

logging.basicConfig(level=logging.DEBUG,
                    format='%(asctime)s [%(process)d] [%(levelname)s] %(message)s',
                    datefmt='%Y-%m-%d %H:%M:%S')

logging.disable(logging.CRITICAL)
logging.debug('Debugging mode enabled.')

# ----------------
# Basic functions
# ----------------

def login(username, passward):
    url = 'https://cas.gzhu.edu.cn/cas_server/login;jsessionid=ysAS5ABQVP0PblVm7RHMPkDLmW_LpxyNes0A?service=https%3A%2F%2Fcas.gzhu.edu.cn%3A443%2Fshunt%2Findex.jsp'

    ch = pycurl.Curl()
    ch.setopt(pycurl.URL, url)
    ch.setopt(pycurl.TIMEOUT, LOGIN_TIMEOUT)
    ch.setopt(pycurl.POST, True)
    data = urllib.urlencode({'_eventId': 'submit', 'lt': '181D0CD2474A44AF56EA692A9BA3854A12F30FE6540C4A92C25366BC9391947963DFAA97312FD23BA38A43064033AEBC', 'username': username, 'password': passward, 'submit': '登录'})
    ch.setopt(pycurl.POSTFIELDS, data)
    ret = StringIO.StringIO()
    ch.setopt(pycurl.WRITEFUNCTION, ret.write)
    # add header to ret value
    ch.setopt(pycurl.HEADER, True)

    try:
        ch.perform()
    except pycurl.error, e:
        logging.error('%s, %s', e[0], e[1])
        return (False, 'timeout')

    ret_code = ch.getinfo(pycurl.HTTP_CODE)
    ch.close()
    if ret_code == 200:
        logging.debug('Login errorpass: %s %s', username, passward)
        return (False, 'errorpass')
    else:
        ret_header = ret.getvalue()
        cookies = re.findall(r'^Set-Cookie: (.*);', ret_header, re.MULTILINE)
        cookie = cookies[0][11:]
        logging.debug('Login success: %s %s', username, passward)
        return (True, cookie)


if __name__ == '__main__':
    if len(sys.argv) == 4 and sys.argv[1] == 'login':
        a, b = login(sys.argv[2], sys.argv[3])
        print a
        print b