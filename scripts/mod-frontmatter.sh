#!/bin/bash

BASE_DIR="$1"  # e.g. content/photos/year/album

if [[ -z "$BASE_DIR" || ! -d "$BASE_DIR" ]]; then
  echo "Usage: $0 <path-to-directory>"
  exit 1
fi

find "$BASE_DIR" -type f -name "index.md" | while read -r file; do
  dir=$(dirname "$file")
  folder_name=$(basename "$dir")

  echo "Updating $file with folder name '$folder_name'"

  sed -i -E "s|^title = .*|title = \"$folder_name\"|" "$file"
  sed -i -E "s|^slug = .*|slug = \"$folder_name\"|" "$file"
  sed -i -E "s|^image = .*|image = \"$folder_name.jpg\"|" "$file"
done
