#! /bin/bash
ls -lha
mkdir data
while true; do
  date
  hostname=$(hostname) && lsusb -v | jc --lsusb | jq -r '.[] | "lsusb_device{description=\"\(.description)\",id=\"\(.id)\",iProduct=\"\(.device_descriptor.iProduct.description)\",iSerial=\"\(.device_descriptor.iSerial.description)\",_hostname=\"'$hostname'\"} 0 \(now|floor)"' > ./data/usb-prometheus.prom
  sleep 5
done