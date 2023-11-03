#!/bin/bash
#
# Define your name and the directory 
 clear
read -p "Enter your name: " Name
directory="/home/$USER"

# Find the maximum number in the existing files.
MAX=0
for file in "$directory"/"$Name"*; do
    filename="${file##*/}" # Extract the filename
    fileNumber="${filename#"${Name}"}" # Remove yourName from the filename
    fileNumber="${fileNumber%.*}" # Remove the extension, if any

    # Check if the fileNumber is a valid positive integer
    if [[ $fileNumber =~ ^[0-9]+$ ]]; then
        if ((fileNumber > MAX)); then
            MAX=$fileNumber
        fi
    fi
done

# Create the next batch of 25 files
for ((i = 1; i <= 25; i++)); do
    ((MAX++))
    filename="$Name$MAX"
    touch "$directory/$filename"
done
echo "Hello, $Name!"
