#!/bin/zsh

set -euo pipefail

ICON=""

CLR_RUNNING="#7dc4e4"   # blue
CLR_STOPPED="#6e738d"   # grey
CLR_TEXT="#a5adcb"

# ---------------------- CHECK DOCKER ----------------------

if ! systemctl is-active --quiet docker.service 2>/dev/null; then
  # Docker NOT running
  echo "%{F${CLR_STOPPED}}${ICON}%{F-} "
  exit 0
fi

# ---------------------- STATS ----------------------

STATS=$(docker stats --no-stream --format "{{.CPUPerc}} {{.MemUsage}}" 2>/dev/null || true)

if [[ -z "$STATS" ]]; then
  CPU=0
  MEM=0
else
  CPU=$(echo "$STATS" | awk '{gsub(/%/,"",$1); s+=$1} END {printf "%.0f", s}')
  MEM=$(echo "$STATS" | awk '
    {
      split($2, a, "/");
      gsub(/MiB|GiB/, "", a[1]);
      if ($2 ~ /GiB/) s += a[1] * 1024;
      else s += a[1];
    }
    END {printf "%.0f", s}
  ')
fi

# ---------------------- OUTPUT ----------------------

echo "%{F${CLR_RUNNING}}${ICON} %{F-} %{F${CLR_TEXT}}${CPU}% ${MEM}MB%{F-} "
