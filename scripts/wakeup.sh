#!/bin/bash

set -euo pipefail

RTC_DEVICE="/sys/class/rtc/rtc0/wakealarm"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/colors.sh"

# Clear any existing RTC wake alarm.
echo "[INFO] Clearing existing wake alarm..."
echo 0 > "$RTC_DEVICE"

WAKEUP_TIME="07:00"
CURRENT_HOUR=$(date +%H)

# Schedule the next wake-up at 07.00 AM
# If the current time is before 07.00, use today.
# Otherwise, schedule it for tomorrow.
if [ "$CURRENT_HOUR" -lt 7 ]; then
	WAKE_TIME=$(date -d "${WAKEUP_TIME} today" +%s)
else
	WAKE_TIME=$(date -d "${WAKEUP_TIME} tomorrow" +%s)
fi

# Configure the RTC wake alarm.
echo "[INFO] Setting wake alarm to: $(date -d "@$WAKE_TIME")"
echo "$WAKE_TIME" > "$RTC_DEVICE"

#!/bin/bash

set -euo pipefail

RTC_DEVICE="/sys/class/rtc/rtc0/wakealarm"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/colors.sh"

# Clear any existing RTC wake alarm.
echo "[INFO] Clearing existing wake alarm..."
echo 0 > "$RTC_DEVICE"

WAKEUP_TIME="07:00"
CURRENT_HOUR=$(date +%H)

# Schedule the next wake-up at 07.00 AM
# If the current time is before 07.00, use today.
# Otherwise, schedule it for tomorrow.
if [ "$CURRENT_HOUR" -lt 7 ]; then
    WAKE_TIME=$(date -d "${WAKEUP_TIME} today" +%s)
else
    WAKE_TIME=$(date -d "${WAKEUP_TIME} tomorrow" +%s)
fi

# Configure the RTC wake alarm.
echo "[INFO] Setting wake alarm to: $(date -d "@$WAKE_TIME")"
echo "$WAKE_TIME" > "$RTC_DEVICE"

#!/bin/bash

set -euo pipefail

RTC_DEVICE="/sys/class/rtc/rtc0/wakealarm"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/colors.sh"

# Clear any existing RTC wake alarm.
echo "[INFO] Clearing existing wake alarm..."
echo 0 > "$RTC_DEVICE"

WAKEUP_TIME="07:00"
CURRENT_HOUR=$(date +%H)

# Schedule the next wake-up at 07.00 AM
# If the current time is before 07.00, use today.
# Otherwise, schedule it for tomorrow.
if [ "$CURRENT_HOUR" -lt 7 ]; then
    WAKE_TIME=$(date -d "${WAKEUP_TIME} today" +%s)
else
    WAKE_TIME=$(date -d "${WAKEUP_TIME} tomorrow" +%s)
fi

# Configure the RTC wake alarm.
echo "[INFO] Setting wake alarm to: $(date -d "@$WAKE_TIME")"
echo "$WAKE_TIME" > "$RTC_DEVICE"

echo "${COLOR_GREEN}[INFO] Alarm set successfully.${NO_COLOR}"

# Allow testing without shutting down the machine.
if [[ "${1:-}" == "--dry-run" ]]; then
    exit 0
fi

echo "${COLOR_BLUE}[INFO]Shuting down...${NO_COLOR}"
systemctl poweroff


# Allow testing without shutting down the machine.
if [[ "${1:-}" == "--dry-run" ]]; then
    exit 0
fi


echo "${COLOR_BLUE}[INFO]Shuting down...${NO_COLOR}"
systemctl poweroff


# Allow testing without shutting down the machine.
if [[ "${1:-}" == "--dry-run" ]]; then
	exit 0
fi


echo "${COLOR_BLUE}[INFO] Shuting down...${NO_COLOR}"
systemctl poweroff
