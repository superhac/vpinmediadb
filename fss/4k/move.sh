#!/bin/bash

# Set root directory (default to current directory if not specified)
ROOT_DIR="${1:-.}"

# Find all directories under root (including root itself)
find "$ROOT_DIR" -type d | while read -r dir; do
    # Skip if the directory is already "fss" or "4k"
    base="$(basename "$dir")"
    if [[ "$base" == "fss" || "$base" == "4k" ]]; then
        continue
    fi

    # Create the nested fss/4k directory
    TARGET="$dir/fss/4k"
    mkdir -p "$TARGET"

    # Move regular files (not directories) from current dir to fss/4k
    find "$dir" -maxdepth 1 -type f -exec mv -t "$TARGET" -- {} +
done
