#!/usr/bin/env python
# -*- coding: utf-8 -*-

import urllib
import pycurl
import re
import StringIO
import sys

def login(username, passward):
    url = 'http://uems.sysu.edu.cn/jwxt/j_unieap_security_check.do'

    ch = pycurl.Curl()
    ch.setopt(pycurl.URL, url)
    ch.setopt(pycurl.TIMEOUT, 5)
    ch.setopt(pycurl.POST, True)
    data = urllib.urlencode({'j_username': username, 'j_password': passward})
    ch.setopt(pycurl.POSTFIELDS, data)
    ret = StringIO.StringIO()
    ch.setopt(pycurl.WRITEFUNCTION, ret.write)
    # add header to ret value
    ch.setopt(pycurl.HEADER, True)

    try:
        ch.perform()
    except pycurl.error, e:
        return (False, 'timeout')

    ret_code = ch.getinfo(pycurl.HTTP_CODE)
    ch.close()
    if ret_code == 200:
        return (False, 'errorpass')
    else:
        ret_header = ret.getvalue()
        cookies = re.findall(r'^Set-Cookie: (.*);', ret_header, re.MULTILINE)
        cookie = cookies[0][11:]
        return (True, cookie)

if __name__ == '__main__':
    if len(sys.argv) == 3:
        a, b = login(sys.argv[1], sys.argv[2])
        print a
        print b
