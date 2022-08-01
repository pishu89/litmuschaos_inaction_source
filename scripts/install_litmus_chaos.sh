#!/usr/bin/env bash

echo "⏳ starting installation of litmus chaos"

helm repo add litmuschaos https://litmuschaos.github.io/litmus-helm/

helm upgrade --install chaos litmuschaos/litmus --namespace=litmus

echo " ----------- "

echo "🐋 listing pods"

kubectl get pods -n litmus

echo " ----------- "

echo "📡 listing services"

kubectl get svc -n litmus

echo " ----------- "

echo "🖥️ listing external IP address"

internal_ip=`kubectl get po -l app.kubernetes.io/component=litmus-frontend -n litmus -o 'jsonpath={.items[0].status.hostIP}'`

ext_ip=`kubectl get node -l kubernetes.io/hostname=$internal_ip -o=jsonpath='{.items[0].status.addresses[?(@.type=="ExternalIP")].address}'`

echo $ext_ip

echo " ----------- "

echo "📬 listing node port"

node_port=`kubectl get svc chaos-litmus-frontend-service -n litmus -o 'jsonpath={.spec.ports[0].nodePort}'`

echo $node_port

echo " ----------- "

litmus_url=$ext_ip:$node_port

echo "🚀 Go to: $litmus_url to use LitmusChaos"