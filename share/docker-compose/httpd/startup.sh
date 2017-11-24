#!/bin/bash
# ----------
# startup service
#
# @author satoshi.kanazawa
# ----------

# start httpd
service httpd start

while true
do
    tail -f /dev/null
done
