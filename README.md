# usb-exporter
Use lsusb, jc and jq to generate a textfile that is prometheus readable. Then use [IBM/textfile-exporter](https://github.com/IBM/textfile-exporter) to serve that textfile for prometheus.

## Requirements
- docker

## Usage
Create an .env file with your prometheus bind address and save it as .env in the same directory as this file.

### build
```
docker compose build --no-cache
```
### run
```
docker compose up -d --force-recreate --build --always-recreate-deps --remove-orphans
```

## Example Output
```
# HELP lsusb_device 
# TYPE lsusb_device untyped
lsusb_device{_hostname="ccdf6c1f97b1",description="Linux 6.8.0-55-generic xhci-hcd xHCI Host Controller",iProduct="xHCI Host Controller",iSerial="0000:00:14.0",id="1d6b:0002"} 0 1743007430
lsusb_device{_hostname="ccdf6c1f97b1",description="Linux 6.8.0-55-generic xhci-hcd xHCI Host Controller",iProduct="xHCI Host Controller",iSerial="0000:00:14.0",id="1d6b:0003"} 0 1743007430
```

## Notes

There is a lot of `Couldn't open device, some information will be missing`, yes this is normal because the container is not running with the permissions needed for some devices. Thats ok if you have still all other devices that you want to monitor.

## Thanks
- @[IBM/textfile-exporter](https://github.com/IBM/textfile-exporter)
