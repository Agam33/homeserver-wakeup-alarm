#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/scripts/colors.sh"

echo "${COLOR_RED}[INFO] Disabling timer..."
sudo systemctl disable --now wakeup.timer || true

echo "[INFO] Removing systemd symlinks..."
sudo rm -f /etc/systemd/system/wakeup.service
sudo rm -f /etc/systemd/system/wakeup.timer

echo "[INFO] Removing wakeup.sh script..."
sudo rm -f /usr/local/bin/wakeup.sh

echo "[INFO] Reloading systemd...${NO_COLOR}"
sudo systemctl daemon-reload


echo "=================================="
echo "[INFO] Verification"

if systemctl list-timers | grep wakeup; then
	echo "${COLOR_YELLOW}[WARN] wakeup timer still exists${NO_COLOR}"
else
	echo "${COLOR_GREEN}[OK] wakeup timer removed${NO_COLOR}"
fi

if systemctl list-unit-files | grep -q "^wakeup.service"; then
	echo "${COLOR_YELLOW}[WARN] wakeup service still exists${NO_COLOR}"
else
	echo "${COLOR_GREEN}[OK] wakeup service removed${NO_COLOR}"
fi

echo "${COLOR_GREEN}Uninstallation completed.${NO_COLOR}"



