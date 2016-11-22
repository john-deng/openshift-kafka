#!/bin/bash

echo ""

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"
path="$dir/data"
cat bootstrap/pv-template.yml | sed "s|/tmp/k8s-data|$path|" | kubectl create -f -
