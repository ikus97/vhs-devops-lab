#!/bin/bash

set -e

if command -v podman &> /dev/null; then
    RUNTIME="podman"
elif command -v docker &> /dev/null; then
    RUNTIME="docker"
else
    echo "podman or docker not found"
    exit 1
fi

mkdir -p /tn_devops/nexus

if ${RUNTIME} ps -a --format "{{.Names}}" | grep -q "^nexus$"; then
    ${RUNTIME} stop nexus || true
    ${RUNTIME} rm nexus || true
fi

${RUNTIME} run \
    --name nexus \
    --detach \
    --restart always \
    --publish 18081:8081 \
    --volume /tn_devops/nexus:/opt/nexus/sonatype-work:Z \
    nexus:latest
