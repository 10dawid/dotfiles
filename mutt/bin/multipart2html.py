#!/usr/bin/env python3

import sys
import re
import base64
import email.parser
import email.policy

bp = email.parser.BytesParser(policy=email.policy.default)
m = bp.parse(sys.stdin.buffer)

cids = {}
html = None

for part in m.walk():
    if html is None and part.get_content_type() == "text/html":
        html = part
    elif part["content-id"] is not None:
        cid = part["content-id"][1:-1]
        cids[cid] = part

if html is not None:
    src_cid_re = re.compile(r'src="(cid:([^"]+))"')
    html = html.get_content()
    new_html = ""
    start = 0
    for m in src_cid_re.finditer(html):
        #print(m.start(1), m.end(1), m.group(1))
        cid = m.group(2)
        #print(cid)
        part = cids.get(cid)
        if part is None:
            data = ""
        else:
            data = f"data:{part.get_content_type()};base64," + base64.b64encode(part.get_content()).decode("ascii")
        new_html += html[start:m.start(1)] + data
        start = m.end(1)
    new_html += html[start:]
    print(new_html)
