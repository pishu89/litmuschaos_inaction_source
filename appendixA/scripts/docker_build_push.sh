#!/usr/bin/env bash

docker buildx build --platform linux/amd64 -t aarushik93/details --push ../src/details
docker buildx build --platform linux/amd64 -t aarushik93/productpage --push ../src/productpage
docker buildx build --platform linux/amd64 -t aarushik93/ratings --push ../src/ratings
docker buildx build --platform linux/amd64 -t aarushik93/reviews --push ../src/reviews/reviews-wlpcfg