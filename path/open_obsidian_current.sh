#!/usr/bin/env sh

set -eu

VAULT_ROOT="/home/antonio/Documents/vault"
obsidian file >/tmp/obsCurrent.txt 2>/dev/null
OUTPUT_FILE="${1:-/tmp/obsCurrent.txt}"

if [ ! -f "$OUTPUT_FILE" ]; then
    printf 'Error: output file not found: %s\n' "$OUTPUT_FILE" >&2
    exit 1
fi

RELATIVE_PATH=$(
    awk -F '\t' '$1 == "path" { print $2; exit }' "$OUTPUT_FILE"
)

if [ -z "$RELATIVE_PATH" ]; then
    printf 'Error: could not find a path entry in %s\n' "$OUTPUT_FILE" >&2
    exit 1
fi

FULL_PATH="${VAULT_ROOT}/${RELATIVE_PATH}"

if [ ! -f "$FULL_PATH" ]; then
    printf 'Error: file does not exist: %s\n' "$FULL_PATH" >&2
    exit 1
fi

kitty --execute nvim "$FULL_PATH"
