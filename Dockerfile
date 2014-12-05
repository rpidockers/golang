#
# jpodeszwik/rpi-golang Dockerfile
#
 
FROM sdhibit/rpi-raspbian 

# Install prerequisites
RUN \
  apt-get update && \
  apt-get install -y wget ca-certificates gcc

# Install golang
ENV GO_VERSION 1.3.3
RUN \
  wget https://storage.googleapis.com/golang/go$GO_VERSION.src.tar.gz && \
  tar -xvzf go$GO_VERSION.src.tar.gz && \
  cd go/src && \
  export GOARM=6 && \
  chmod +x make.bash && \
  ./make.bash && \
  rm /go$GO_VERSION.src.tar.gz

