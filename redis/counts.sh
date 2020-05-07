#!/bin/bash

echo "$(date --rfc-3339=seconds)"

redis-cli -a password client list | grep -oE \
  "([[:digit:]]{1,3}\.){3}[[:digit:]]{1,3}" | sort | uniq -c

