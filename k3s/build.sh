#!/usr/bin/env bash
set +e

dir=/go/src/github.com/rancher/k3s/ && mkdir -p $dir
    git clone https://github.com/huapox/fk-k3s-custom $dir

cd $dir && ls -lh && git branch -a
cd scripts
    bash ./download
    bash ./build
    #./package
    #build/out/data.tar.gz + k3s
    bash ./package-cli  ##

rm -f /build.sh