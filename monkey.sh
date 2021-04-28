#!/bin/bash
# Randomly delete pods in a Kubernetes namespace.

: ${DELAY:=30}
: ${NAMESPACE:=default}

while true; do
  kubectl \
    --namespace "${NAMESPACE}" \
    -o 'jsonpath={.items[*].metadata.name}' \
    get pods -l app=webapp | \
    tr " " "\n" | \
    shuf | \
    head -n 1 |
    xargs -t --no-run-if-empty \
    kubectl --namespace "${NAMESPACE}" delete pod
  sleep "${DELAY}"
done