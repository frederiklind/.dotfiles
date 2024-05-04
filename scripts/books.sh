#!/bin/bash

#!/bin/bash

# Initialize an empty array
BOOKS=()

# Directory containing the books
BOOK_DIR="${HOME}/Books"

# Loop through all files in the directory
for f in "$BOOK_DIR"/*; do
    file_name="$(basename "$f" "${f##*.}")"
    BOOKS+=("\"$file_name\"")
done

# Use gum choose to select a book from the list
# Note the use of "${BOOKS[@]}" to properly handle spaces in filenames
selected_book=$(gum choose --limit 1 --height ${#BOOKS[@]} "${BOOKS[@]}")

# Remove the surrounding quotes from the selected book
selected_book="${selected_book%\"}"
selected_book="${selected_book#\"}"
