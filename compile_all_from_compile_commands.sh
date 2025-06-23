#!/usr/bin/env bash
set -euo pipefail

######################
# via copilot https://github.com/hn-88/OpenSpace-AppleSiliconMac/issues/34
######################

# Directory containing compile_commands.json
BUILD_DIR="${1:-build}"
OUTPUT_DIR="${2:-individual_build}"
COMPILE_COMMANDS="$BUILD_DIR/compile_commands.json"

if [ ! -f "$COMPILE_COMMANDS" ]; then
    echo "Error: $COMPILE_COMMANDS not found. Make sure you run cmake with -DCMAKE_EXPORT_COMPILE_COMMANDS=ON"
    exit 1
fi

mkdir -p "$OUTPUT_DIR"

ERROR_LOG="$OUTPUT_DIR/compile_errors.txt"
: > "$ERROR_LOG"

echo "Parsing compile_commands.json and compiling each file individually..."

# Parse JSON: for each entry, get 'file' and 'command'
# This works on macOS with jq installed (brew install jq)
COUNT=0
FAIL_COUNT=0

jq -c '.[]' "$COMPILE_COMMANDS" | while read -r entry; do
    SRC_FILE=$(echo "$entry" | jq -r '.file')
    COMMAND=$(echo "$entry" | jq -r '.command')

    # Output object file to OUTPUT_DIR instead of original output
    # Remove the -o <file> and replace with our own
    OBJ_FILE="$OUTPUT_DIR/$(basename "${SRC_FILE%.*}").o"
    CUSTOM_COMMAND=$(echo "$COMMAND" | sed -E "s/-o [^ ]+/-o \"$OBJ_FILE\"/")

    echo "Compiling $SRC_FILE"
    if ! eval "$CUSTOM_COMMAND" 2>>"$ERROR_LOG"; then
        echo "FAILED: $SRC_FILE" >> "$ERROR_LOG"
        ((FAIL_COUNT++))
    fi
    ((COUNT++))
done

echo "Compilation finished. $COUNT files processed. $FAIL_COUNT file(s) failed."
if (( FAIL_COUNT > 0 )); then
    echo "See $ERROR_LOG for details."
    exit 1
else
    echo "All files compiled successfully."
fi
