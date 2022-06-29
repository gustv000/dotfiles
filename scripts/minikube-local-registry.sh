#!/bin/bash
docker run --name registry-proxy --rm -d --network=host alpine ash -c "apk add socat && socat TCP-LISTEN:5000,reuseaddr,fork TCP:$(minikube ip):5000"
kubectl port-forward --namespace kube-system service/registry 5000:80
trap "echo Stopping registry-proxy container && docker stop registry-proxy && echo" EXIT
