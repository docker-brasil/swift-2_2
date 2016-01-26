# docker-swift

![swift](https://raw.githubusercontent.com/hamin/EventSource.Swift/master/swift-logo.png)


### An Ubuntu 14.04 Docker image for [Swift](https://swift.org).

#### You can find the Docker Hub repo here: [https://hub.docker.com/r/dockerbrasil/swift-2_2/](https://hub.docker.com/r/dockerbrasil/swift-2_2/)


### Docker Instructions

##### Pull the Docker Image From Docker Hub:

```bash
docker pull dockerbrasil/swift-2_2
```

##### Create a container from the Image and run ...

To see help message:

```bash
docker run -i -t --rm --name swiftfun dockerbrasil/swift-2_2 --help
```

Or to run Swift REPL / Debuger

```bash
docker run -i -t --rm --name swiftfun dockerbrasil/swift-2_2 swift
```
Now you can use de Swift REPL.

```swift
let greeting = "Hello!"
  greeting: String = "Hello!"
let answer = "forty-two"
  answer: String = "forty-two"
"Hi!".re»
  Available completions:
    removeAll() -> Void
    removeAll(keepCapacity: Bool) -> Void
    removeAtIndex(i: Index) -> Character
    removeRange(subRange: Range<Index>) -> Void
    replaceRange(subRange: Range<Index>, with: C) -> Void
    replaceRange(subRange: Range<Index>, with: String) -> Void
    reserveCapacity(n: Int) -> Void
:quit

```

You can use TAB key » to see all availables completions

Use `:quit` to Quit the REPL


## Contributions

Contributions via pull requests are welcome and encouraged :)
