# docker-openharmony

To build the Dockerfile:

```bash
docker build -t openharmony-docker:latest .
```

To run the container:

```bash
docker run -it -v $(pwd):/home/openharmony openharmony-docker:latest
```
```

