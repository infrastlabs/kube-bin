##build on baseEnv: 45+ seconds save;
FROM infrastlabs/kube-bin:k3s-0-base as src
ENV VER=v1.0
ADD build.sh /
RUN sh /build.sh

##copy dist file: lite images size;
FROM infrastlabs/alpine-ext
MAINTAINER sam <sldevsir@126.com>
USER root
ENV DAPPER_SOURCE /go/src/github.com/rancher/k3s/
COPY --from=src ${DAPPER_SOURCE}/build ${DAPPER_SOURCE}/build 
#COPY --from=src ${DAPPER_SOURCE}/dist ${DAPPER_SOURCE}/dist

##run as root
USER root
WORKDIR /
