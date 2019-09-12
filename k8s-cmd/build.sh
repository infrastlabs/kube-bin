#!/bin/bash

mkdir -p /down && cd /down
	##dcp
	src=https://github.com/docker/compose/releases/download/1.23.2/docker-compose-`uname -s`-`uname -m`
	dest=/down/docker-compose
	curl -L $src -o $dest; chmod +x $dest;
	##rbac-lookup
	src=https://github.com/reactiveops/rbac-lookup/releases/download/v0.2.1/rbac-lookup_0.2.1_Linux_x86_64.tar.gz
	curl -L $src | tar -C /tmp -xz #get and unpack
	mv /tmp/rbac-lookup /down/ && rm -rf /tmp/*
	
	##kubectl helm stern kustomize
	KUBE_LATEST_VERSION="v1.14.1"
	HELM_VERSION="v2.14.3"
	#kubectl
	wget -q https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -O kubectl
	chmod +x kubectl
	#helm
	wget -q https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz -O - | tar -xzO linux-amd64/helm > helm
	chmod +x helm
	#stern
	wget -q https://github.com/wercker/stern/releases/download/1.10.0/stern_linux_amd64 -O stern
	chmod +x stern
	#kustomize
	#wget -q https://github.com/kubernetes-sigs/kustomize/releases/download/v2.0.3/kustomize_2.0.3_linux_amd64 -O kustomize
	#chmod +x kustomize

	tree -h /down

apk add --no-cache git
mkdir -p /opt/k8s-client && cd /opt/k8s-client
	git clone https://github.com/jonmosco/kube-ps1.git
	git clone https://github.com/ahmetb/kubectx.git
	du -sh *
	
rm -f /build.sh
