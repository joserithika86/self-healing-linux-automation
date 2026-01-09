#!/bin/bash

SERVICE="cron"
LOGFILE="../logs/health.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

STATUS=$(systemctl is-active $SERVICE)

if [ "$STATUS" != "active" ]; then
     echo "[$TIMESTAMP] $SERVICE is DOWN. Restarting..." >> $LOGFILE
     systemctl restart $SERVICE
     echo "[$TIMESTAMP] $SERVICE restarted successfully." >> $LOGFILE
else
      echo "[$TIMESTAMP] $SERVICE is running fine." >> $LOGFILE
fi
