#!/bin/bash
chmod +x $1/test.sh

subdirectory="$1/subprojects"
filename="$subdirectory/test.wrap"

# Create the subdirectory if it doesn't exist
if [ ! -d "$subdirectory" ]; then
    mkdir -p "$subdirectory"
fi

# Check if the file already exists in the subdirectory, and create it if not
if [ ! -e "$filename" ]; then
    touch "$filename"
fi

# Use a heredoc to replace text in the file
cat > "$filename" <<EOL
[wrap-svn]
url = $2
revision = $3
EOL