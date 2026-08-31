#!/usr/bin/env bash

set -euo pipefail

usage() {
    printf 'Usage: %s SOURCE_DIR TARGET_DIR\n' "${0##*/}" >&2
    exit 2
}

[[ $# -eq 2 ]] || usage

source_dir=$1
target_dir=$2

[[ -d "$source_dir" ]] || {
    printf 'Error: source directory does not exist: %s\n' "$source_dir" >&2
    exit 1
}

mkdir -p "$target_dir"

for dir in "$source_dir"/*/; do
    [[ -d "$dir" ]] || continue
    ln -s "$dir" "$target_dir/"
done
