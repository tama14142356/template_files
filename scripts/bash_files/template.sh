#!/bin/bash
readonly program=$(basename $0)
readonly args=(tex_filename template_kind tar_dir)
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

git_root=$(git rev-parse --show-toplevel | head -1)
tar_dir_abs=$(
    cd "$tar_dir" || exit
    pwd
)
template_dir="$git_root/latex/$template_kind"
copy_dir="$tar_dir_abs/$template_kind"
cp -r "$template_dir" "$tar_dir_abs"
pushd "$tar_dir_abs"
pushd "$copy_dir"
mv .vscode "$tar_dir_abs/.vscode"
mv .latexmkrc "$tar_dir_abs"
mv "$tex_filename" "$tar_dir_abs"
rm -rf build
rm -f *.sh
rm -f *.tex
mv *.* "$tar_dir_abs"
popd
rmdir "$copy_dir"
mv "$tex_filename" main.tex
popd
