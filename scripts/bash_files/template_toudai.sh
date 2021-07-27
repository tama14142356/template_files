#!/bin/bash
readonly program=$(basename $0)
readonly args=(tar_dir)
function print_usage_and_exit() {
    echo >&2 "Usage: ${program} $(IFS=' '; echo ${args[*]^^})"
    exit 1
}
if [ $# -ne ${#args[@]} ]; then
    print_usage_and_exit
fi
for arg in ${args[@]}; do
    eval "readonly ${arg}=$1"
    shift
done

script_dir=$(
    cd "$(dirname "$0")" || exit
    pwd
)

bash "$script_dir/template.sh" "template_platex" "template_toudai.tex" "$tar_dir"
