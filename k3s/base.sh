#!/usr/bin/env bash
set +e

#domain="mirrors.ustc.edu.cn"
domain="mirrors.aliyun.com"
echo "http://$domain/alpine/v3.8/main" > /etc/apk/repositories
echo "http://$domain/alpine/v3.8/community" >> /etc/apk/repositories

apk add --no-cache git 

#docker
apk -U --no-cache add bash git gcc musl-dev  vim less file curl wget ca-certificates jq linux-headers zlib-dev tar zip squashfs-tools npm coreutils \
    python3 py3-pip python3-dev openssl-dev libffi-dev libseccomp libseccomp-dev make
pip3 install 'tox==3.6.0'
apk -U --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/main/ add sqlite-dev sqlite-static
#apk -U --no-cache add sqlite-dev sqlite-static

mkdir -p /go/src/golang.org/x && \
    cd /go/src/golang.org/x && git clone https://github.com/golang/tools && \
    git -C /go/src/golang.org/x/tools checkout -b current aa82965741a9fecd12b026fbb3d3c6ed3231b8f8 && \
    go install golang.org/x/tools/cmd/goimports
#rm -rf /go/src /go/pkg  ##

rm -f /base.sh