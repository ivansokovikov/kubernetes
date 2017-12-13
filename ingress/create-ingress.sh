#!/bin/sh

export NAMESPACE=shared-ingress

# wait to delet resources
sleep 15

kubectl delete namespace $NAMESPACE --ignore-not-found=true

kubectl create namespace $NAMESPACE

kubectl create sa oraclebmc-provisioner -n=$NAMESPACE

kubectl create -f https://raw.githubusercontent.com/nagypeter/kubernetes/master/ingress/nginx-default-backend-deployment.yaml -n=$NAMESPACE

kubectl create -f https://raw.githubusercontent.com/nagypeter/kubernetes/master/ingress/nginx-default-backend-service.yaml -n=$NAMESPACE

kubectl create -f https://raw.githubusercontent.com/nagypeter/kubernetes/master/ingress/nginx-ingress-controller-deployment.yaml -n=$NAMESPACE

kubectl create -f https://raw.githubusercontent.com/nagypeter/kubernetes/master/ingress/nginx-ingress-controller-service.yaml -n=$NAMESPACE
