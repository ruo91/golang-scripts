#!/bin/bash
export SRC_DIR=/opt
export GO_ARCH=linux-amd64
export GOROOT=$SRC_DIR/go
curl -XGET https://github.com/golang/go/tags | grep tag-name > /tmp/golang_tag \
 && sed -e 's/<[^>]*>//g' /tmp/golang_tag > /tmp/golang_ver \
 && GO_VER=`sed -e 's/      go/go/g' /tmp/golang_ver | head -n 1` && rm -f /tmp/golang_* \
 && curl -LO "https://storage.googleapis.com/golang/$GO_VER.$GO_ARCH.tar.gz" \
 && tar -C $SRC_DIR -xzf go*.tar.gz && rm -rf go*.tar.gz \
 && echo '' >> /etc/profile \
 && echo '# Golang' >> /etc/profile \
 && echo "export GOROOT=$GOROOT" >> /etc/profile \
 && echo 'export PATH=$PATH:$GOROOT/bin' >> /etc/profile \
 && echo '' >> /etc/profile

