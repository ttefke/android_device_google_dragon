#!/vendor/bin/sh

LOG_FILE="/data/vendor/touchfwup/rmi4update.txt"

echo -n "Updater date/time: " > ${LOG_FILE}
date >> ${LOG_FILE}
echo "Pre-update Firmware version:" >> ${LOG_FILE}
/vendor/bin/rmi4update.dragon -d /dev/hidraw0 -p >> ${LOG_FILE} 2>&1

/vendor/bin/rmi4update.dragon -d /dev/hidraw0 /vendor/firmware/synaptics.img >> ${LOG_FILE} 2>&1

echo "Post-update Firmware version:" >> ${LOG_FILE}
/vendor/bin/rmi4update.dragon -d /dev/hidraw0 -p >> ${LOG_FILE} 2>&1

chmod a+r ${LOG_FILE}
