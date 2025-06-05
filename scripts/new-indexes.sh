#!/bin/bash

# Hugo site root relative to this script
SITE_ROOT="../"

# Accept target folder, start, and end as arguments
TARGET_FOLDER=${1}
START=${2}
END=${3}

# Prompt for start and end if not provided
if [[ -z "$START" ]]; then
  read -p "Enter start number: " START
fi
if [[ -z "$END" ]]; then
  read -p "Enter end number: " END
fi

# Remove leading/trailing slashes
TARGET_FOLDER="${TARGET_FOLDER#/}"
TARGET_FOLDER="${TARGET_FOLDER%/}"

# Remove leading 'content/' for Hugo section path
HUGO_SECTION="${TARGET_FOLDER#content/}"

for i in $(seq -w "$START" "$END"); do
  DIR="$SITE_ROOT$TARGET_FOLDER/$i"
  mkdir -p "$DIR"

  # Use hugo new with section path
  (cd "$SITE_ROOT" && hugo new "$HUGO_SECTION/$i/index.md")

  # Update frontmatter in the newly created index.md
  ./mod-frontmatter.sh "$DIR"

  echo "Created $DIR/index.md"
done
