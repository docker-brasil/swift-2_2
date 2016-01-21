FROM ubuntu:14.04

#
# Esta imagem foi baseada nesta: https://github.com/swiftdocker/docker-swift
#

MAINTAINER João Antonio Ferreira "joao.parana@gmail.com"

ENV REFRESHED_AT 2016-01-21

# Ver Downloads para Ubuntu 14.04 em https://swift.org/download/
# https://swift.org/builds/
# ubuntu1404
# /swift-
# 2.2-SNAPSHOT-2016-01-11-a
# /swift-
# 2.2-SNAPSHOT-2016-01-11-a
# -ubuntu14.04.tar.gz

ENV SWIFT_VERSION  2.2-SNAPSHOT-2016-01-11-a
ENV SWIFT_PLATFORM ubuntu1404

# Install related packages
RUN apt-get update && \
    apt-get install -y build-essential git curl wget clang libedit-dev python2.7

# Install others packages
RUN apt-get update && \
    apt-get install -y python2.7-dev libicu52 rsync libxml2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Swift keys
RUN wget -q -O - https://swift.org/keys/all-keys.asc | gpg --import - && \
    gpg --keyserver hkp://pool.sks-keyservers.net --refresh-keys Swift

# Install Swift Ubuntu 14.04 Snapshot
RUN SWIFT_ARCHIVE_NAME=swift-$SWIFT_VERSION-$SWIFT_PLATFORM && \
    SWIFT_URL=https://swift.org/builds/$(echo "$SWIFT_PLATFORM" | tr -d .)/swift-$SWIFT_VERSION/$SWIFT_ARCHIVE_NAME.tar.gz && \
    wget $SWIFT_URL && \
    wget $SWIFT_URL.sig && \
    gpg --verify $SWIFT_ARCHIVE_NAME.tar.gz.sig && \
    tar -xvzf $SWIFT_ARCHIVE_NAME.tar.gz --directory / --strip-components=1 && \
    rm -rf $SWIFT_ARCHIVE_NAME* /tmp/* /var/tmp/*

# Set Swift Path
ENV PATH /usr/bin:$PATH

# Print Installed Swift Version
RUN echo "Running swift --version"
RUN swift --version

CMD ["/bin/bash"]
