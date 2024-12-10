#!/usr/bin/sh
FREE_CPU=$(top -n 1 | grep "CPU(s)" | awk 'function abs(x) { return (x < 0) ? -x : x }{print abs($2+$4-100)}');
CPU_USAGE=$(top -n 1 | grep "CPU(s)" | awk '{print $2+$4}');

FREE_MEMORY=$(free -h | grep "Mem.:" | awk '{print $4}');
MEMORY_USED=$(free -h | grep "Mem.:" | awk '{print $3}');

SPACE_FREE=$(df -h | grep "/dev/sdb2" | awk '{print $4}');
DISK_USED=$(df -h | grep "/dev/sdb2" | awk '{print $3}');

TOP5_CPU=$(top -b -n 1 | grep -i "^[ ]*[0-9]" | head -n 5 | awk '{print $12}');
TOP5_RAM=$(top -b -n 1 -o %MEM | grep -i "^[ ]*[0-9]" | head -n 5 | awk '{print $12}');

echo " - FREE CPU:  " ${FREE_CPU}"%" "/" " - " "CPU USAGE:  " ${CPU_USAGE}"%";

echo " - FREE SPACE:" ${FREE_MEMORY}  "/" " - " "MEMORY USED:" ${MEMORY_USED};

echo " - FREE SPACE:" ${SPACE_FREE}   " /" " - " "DISK USED:  " ${DISK_USED};

echo "==============================================================";

echo "TOP 5 CPU PROCESS";
echo ${TOP5_CPU};

echo "==============================================================";

echo "TOP 5 RAM PROCESS";
echo ${TOP5_RAM};

echo "==============================================================";
