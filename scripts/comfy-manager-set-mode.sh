#!/usr/bin/env bash
set -e

MODE=${1:-local}

echo "Setting ComfyUI Manager network mode to: $MODE"

if [ -f "/root/.config/ComfyUI/Manager/config.ini" ]; then
  sed -i "s/^network_mode=.*/network_mode=$MODE/" /root/.config/ComfyUI/Manager/config.ini
else
  mkdir -p /root/.config/ComfyUI/Manager
  echo "[general]" > /root/.config/ComfyUI/Manager/config.ini
  echo "network_mode=$MODE" >> /root/.config/ComfyUI/Manager/config.ini
fi
