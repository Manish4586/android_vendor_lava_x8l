#!/system/bin/busybox sh

echo "do preinstall job"
BUSYBOX="/system/bin/busybox"

if [ ! -e /data/data.notfirstrun ]; then
	$BUSYBOX touch /data/data.notfirstrun
	#copy customer file to sdcard 
	am startservice -n elink.com/elink.com.NvRAM
	while true
	do
		if [ -e /storage/sdcard0/DCIM ];then
			if [ -e /system/extra/ ];then
				$BUSYBOX cp -r  /system/extra/*  /storage/sdcard0/
				break 
			fi
		fi
	done

	while true
	do
		if [ -e /storage/sdcard0/DCIM ];then
			if [ -e /data/extra/ ];then
				$BUSYBOX cp -r  /data/extra/*  /storage/sdcard0/
				break 
			fi	
		fi	
	done
	#write mac bt address to nvram
	
fi

