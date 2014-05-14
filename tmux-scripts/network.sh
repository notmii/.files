interface=$1
R1=`cat /sys/class/net/$interface/statistics/rx_bytes`
T1=`cat /sys/class/net/$interface/statistics/tx_bytes`
sleep 1
R2=`cat /sys/class/net/$interface/statistics/rx_bytes`
T2=`cat /sys/class/net/$interface/statistics/tx_bytes`

TKBPS=`expr $T2 - $T1`
RKBPS=`expr $R2 - $R1`

TKBPS=`expr $TKBPS / 1024`
RKBPS=`expr $RKBPS / 1024`

printf "$interface: T%dKB R%dKB" $TKBPS $RKBPS
