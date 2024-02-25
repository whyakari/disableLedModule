#!/system/bin/sh

# wait a while to ensure the system has started completely
sleep 10

# Function to disable LED
disable_led() {
    chmod 644 "$1" # change permissions for modifications
    echo 0 > "$1" # disable the LED with 0
    chmod 444 "$1" # change permissions 
}

# Check different LED paths
if [ -e "/sys/class/leds/red/brightness" ]; then
    disable_led "/sys/class/leds/red/brightness"
elif [ -e "/sys/class/leds/led:flash_2/brightness" ]; then
    disable_led "/sys/class/leds/led:flash_2/brightness"
elif [ -e "" ]; then
    disable_led ""
else
    echo "No LED path found."
fi
