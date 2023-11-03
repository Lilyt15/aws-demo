#!/bin/bash
#
# Define your name and the directory where you want to create the files
 clear
read -p "Enter your name: " yourName
directory="/home/$USER"

# Find the maximum number in the existing files, if any
maxNumber=0
for file in "$directory"/"$yourName"*; do
    filename="${file##*/}" # Extract the filename
    fileNumber="${filename#"${yourName}"}" # Remove yourName from the filename
    fileNumber="${fileNumber%.*}" # Remove the extension, if any

    # Check if the fileNumber is a valid positive integer
    if [[ $fileNumber =~ ^[0-9]+$ ]]; then
        if ((fileNumber > maxNumber)); then
            maxNumber=$fileNumber
        fi
    fi
done

# Create the next batch of 25 files
for ((i = 1; i <= 25; i++)); do
    ((maxNumber++))
    filename="$yourName$maxNumber"
    touch "$directory/$filename"
done
echo "Hello, $yourName!"
# Display a long list of the directory and its contents
ls -l "$directory"
