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

${RUNTIME} build -t nexus:latest -f Containerfile .
