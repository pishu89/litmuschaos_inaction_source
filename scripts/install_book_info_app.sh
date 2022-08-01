#!/usr/bin/env bash

echo "⏳ starting installation of book info app..."

helm upgrade --install bookinfo ../deployments/helm/bookinfo/ -f ../deployments/helm/bookinfo/values.yaml --namespace=bookinfo