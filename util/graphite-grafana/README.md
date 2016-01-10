Local grafana-graphite
======================

Build a metrics visualization viewer from scratch: 
```
> git clone https://github.com/kamon-io/docker-grafana-graphite.git
> cd docker-grafana-graphite
> ./build
> ./start
```

Login to `http://localhost` (linux) or `http://192.168.99.100` (MacOS via docker-machine) as `admin`@`admin`.

Import your dashboard via `http://192.168.99.100/import/dashboard`, select dashboard json to import, eg. `./dashboard-file-name-irrelevant.json`, click `save`/disk icon. Dashboard is saved under `http://192.168.99.100/dashboard/db/my-system-metrics`, where `my-system-metrics` is translated from json's title: "My System Metrics".
