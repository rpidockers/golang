#
# jpodeszwik/rpi-golang Dockerfile
#
 
FROM cellofellow/rpi-arch

# Update system
RUN \
  pacman -Syu --noconfirm

# Build go
ENV GO_VERSION 1.3.3
RUN \
  pacman -S wget gcc --noconfirm && \
  wget https://storage.googleapis.com/golang/go$GO_VERSION.src.tar.gz && \
  tar -xvzf go$GO_VERSION.src.tar.gz && \
  cd go/src && \
  export GOARM=6 && \
  chmod +x make.bash && \
  ./make.bash && \
  cd / && \
  rm go$GO_VERSION.src.tar.gz && \
  pacman -Rs wget gcc --noconfirm && \
  pacman -Sc --noconfirm

