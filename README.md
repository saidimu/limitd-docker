# limitd-docker
Docker files for [auth0/limitd](https://github.com/auth0/limitd), a simple daemon for rate limiting.

### How to Use
```
docker run -d --name limitd saidimu/limitd-docker:latest
```

This will run `limitd` in the background, using the example `limitd.yml`.

To see the container logs `docker logs limitd`:
```
{"name":"limitd","hostname":"3f05b557147a","pid":7,"level":20,"address":"0.0.0.0","family":"IPv4","port":9001,"msg":"server started","time":"2015-03-25T15:08:51.271Z","v":0}
```

Data will be persisted within the container. If you delete the container the data disappears as well.

### How to persist data outside the container

The `Dockerfile` mounts a volume on `/data` that can be used from a different data container.

1. Create a data-only container:
```
docker run -d -v /data --name limitd_data saidimu/limitd-docker:latest true
```

2. Use the volume from `limitd_data` in the `limitd` container:
```
docker run -d --volumes-from limitd_data --name limitd saidimu/limitd-docker:latest
```
