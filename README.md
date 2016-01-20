# docker-swift

![swift](https://raw.githubusercontent.com/hamin/EventSource.Swift/master/swift-logo.png)


### An Ubuntu 14.04 Docker image for [Swift](https://swift.org).

#### You can find the Docker Hub repo here: [https://hub.docker.com/r/dockerbrasil/swift-2_2/](https://hub.docker.com/r/dockerbrasil/swift-2_2/)


### Docker Instructions

##### Pull the Docker Image From Docker Hub:

```bash
docker pull dockerbrasil/swift-2_2
```

##### Create a container from the Image and attach it:

```bash
docker run -i -t --name swiftfun dockerbrasil/swift-2_2:latest /bin/bash
```

##### To start your container and attach your image later:

Start your image with name `swiftfun`

```bash
docker start swiftfun
```

and then attach it

```bash
docker attach swiftfun
```

## Contributions

Contributions via pull requests are welcome and encouraged :)
