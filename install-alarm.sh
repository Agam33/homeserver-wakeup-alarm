#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/scripts/colors.sh"

sudo install -m 644 \
	"${SCRIPT_DIR}/scripts/colors.sh" \
	/usr/local/bin/colors.sh

echo "${COLOR_BLUE}[INFO] Installing Alarm...${NO_COLOR}"
sudo install -m 755 \
	"${SCRIPT_DIR}/scripts/wakeup.sh" \
	/usr/local/bin/wakeup.sh

echo "${COLOR_BLUE}[INFO] Creating systemd symlinks...${NO_COLOR}"
sudo ln -sf \
	"${SCRIPT_DIR}/wakeup.service" \
	/etc/systemd/system/wakeup.service

sudo ln -sf \
	"${SCRIPT_DIR}/wakeup.timer" \
	/etc/systemd/system/wakeup.timer

echo "${COLOR_BLUE}[INFO] Reloading systemd...${NO_COLOR}"
sudo systemctl daemon-reload

echo "${COLOR_BLUE}[INFO] Enabling timer...${NO_COLOR}"
sudo systemctl enable --now wakeup.timer

echo "${COLOR_GREEN}[INFO] Installation completed.${NO_COLOR}"

echo
echo "Next scheduled run:"
systemctl list-timers wakeup.timer

echo "${COLOR_GREEN}Success!${NO_COLOR}"
