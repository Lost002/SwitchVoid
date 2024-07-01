#!/bin/sh
echo -ne '\033c\033]0;SwitchVoid\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/SwitchVoid_EXEC.x86_64" "$@"
