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

    destination="$target_dir/$name"

    if [[ -e "$destination" || -L "$destination" ]]; then
        printf 'Replacing: %s with a copy of %s\n' "$destination" "$dir"
        rm -rf -- "$destination"
    else
        printf 'Copying: %s to %s\n' "$dir" "$destination"
    fi

    cp -a -- "$dir" "$destination"
done
