R1=`cat /sys/class/net/wlan0/statistics/rx_bytes`
T1=`cat /sys/class/net/wlan0/statistics/tx_bytes`
sleep 1
R2=`cat /sys/class/net/wlan0/statistics/rx_bytes`
T2=`cat /sys/class/net/wlan0/statistics/tx_bytes`

TKBPS=`expr $T2 - $T1`
RKBPS=`expr $R2 - $R1`

TKBPS=`expr $TKBPS / 1024`
RKBPS=`expr $RKBPS / 1024`

printf "wlan0: T%dKB R%dKB" $TKBPS $RKBPS
