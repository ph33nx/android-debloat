#!/bin/bash

# Ensure adb is installed and adb devices is running
if ! command -v adb &> /dev/null
then
    echo "adb could not be found, please install it first."
    exit 1
fi

# Check if apps.txt exists in the current directory
if [ ! -f "apps.txt" ]; then
    echo "apps.txt not found in the current directory."
    exit 1
fi

# Count the number of apps in apps.txt
app_count=$(wc -l < apps.txt)
echo "Number of apps in apps.txt: $app_count"

# Check adb connection (this will list connected devices)
adb_devices=$(adb devices)
echo "Checking ADB connection..."
echo "$adb_devices"

# Use readarray to load all the package names into an array
mapfile -t packages < apps.txt

# Loop through each package in the array and uninstall the app
for package_name in "${packages[@]}"
do
    # Ensure the package name is not empty or just whitespace
    if [[ -n "$package_name" ]]; then
        echo "Attempting to uninstall $package_name..."
        uninstall_output=$(adb shell pm uninstall --user 0 "$package_name" 2>&1)
        
        # Check the uninstall command output and print result
        if [[ "$uninstall_output" == *"Success"* ]]; then
            echo "Successfully uninstalled: $package_name"
        else
            echo "Failed to uninstall $package_name. Reason: $uninstall_output"
        fi
        
        sleep 1  # Sleep for 1 second between uninstalls
    fi
done

echo "Uninstallation process completed for all apps."
