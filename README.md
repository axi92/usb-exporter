# usb-prometheus-file
Use lsusb jc and jq to generate a textfile that is prometheus readable. Then use [IBM/textfile-exporter](https://github.com/IBM/textfile-exporter) to serve that textfile for prometheus.

## Requirements
- docker

## Usage
### build
```
docker compose build --no-cache
```
### run
```
docker compose up --force-recreate --build --always-recreate-deps --remove-orphans
```

## Notes

There is a lot of `Couldn't open device, some information will be missing`, yes this is normal because the container is not running with the permissions needed for some devices. Thats ok if you have still all other devices that you want to monitor.

## Thanks
- @[IBM/textfile-exporter](https://github.com/IBM/textfile-exporter)
