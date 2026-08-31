#!/usr/bin/env bash

set -euo pipefail

if [[ $# -ne 2 ]]; then
    printf 'Usage: %s SOURCE_DIR TARGET_DIR\n' "${0##*/}" >&2
    exit 2
fi

source_dir=$1
target_dir=$2

[[ -d "$source_dir" ]] || {
    printf 'Error: source directory does not exist: %s\n' "$source_dir" >&2
    exit 1
}

mkdir -p "$target_dir"

for dir in "$source_dir"/*/; do
    [[ -d "$dir" ]] || continue

    name=${dir%/}
    name=${name##*/}

    link="$target_dir/$name"
    target="$dir"

    if [[ -L "$link" ]]; then
        if [[ "$(readlink "$link")" == "$target" ]]; then
            printf 'Skipping: %s -> %s\n' "$link" "$target"
        else
            printf 'Replacing: %s -> %s\n' "$link" "$target"
            ln -sfn -- "$target" "$link"
        fi
    elif [[ -e "$link" ]]; then
        printf 'Error: %s exists and is not a symlink\n' "$link" >&2
        exit 1
    else
        printf 'Creating: %s -> %s\n' "$link" "$target"
        ln -s -- "$target" "$link"
    fi
done
