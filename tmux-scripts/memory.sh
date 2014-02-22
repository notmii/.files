#!/bin/bash
USED_MEMORY=$(free|grep "^Mem"|awk '{printf "%.0f", (($3 - $6 - $7) / $2) * 100}')
echo "MEM: $USED_MEMORY%"
