#!/system/bin/sh

# Re-enable LED
enable_led() {
    chmod 644 "$1"
    echo 1 > "$1"
    chmod 444 "$1"
}

# Check different LED paths
if [ -e "/sys/class/leds/red/brightness" ]; then
    enable_led "/sys/class/leds/red/brightness"
elif [ -e "/sys/class/leds/led:flash_2/brightness" ]; then
    enable_led "/sys/class/leds/led:flash_2/brightness"
elif [ -e "" ]; then
    enable_led ""
else
    echo "No LED path found."
fi