#!/bin/bash

set -euo pipefail

if systemctl is-active --quiet docker.service; then
  sudo systemctl stop docker.service docker.socket
else
  sudo systemctl start docker.socket docker.service
fi
