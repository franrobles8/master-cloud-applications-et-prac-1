#!/bin/bash
# Randomly delete pods in a Kubernetes namespace.
set -ex

: ${DELAY:=30}
: ${NAMESPACE:=franrobles8}

while true; do
  kubectl \
    --namespace "${NAMESPACE}" \
    -o 'jsonpath={.items[*].metadata.name}' \
    get pods | \
    tr " " "\n" | \
    shuf | \
    head -n 1 |
    xargs -t \
    kubectl --namespace "${NAMESPACE}" delete pod
  sleep "${DELAY}"
done