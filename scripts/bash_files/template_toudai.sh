#!/bin/bash
git_root=$(git rev-parse --show-toplevel | head -1)
tar_dir=$(
    cd "$1" || exit
    pwd
)
template_filename="template_toudai.tex"
template_kind="template_platex"
template_dir="$git_root/$template_kind"
copy_dir="$tar_dir/$template_kind"
cp -r "$template_dir" "$tar_dir"
pushd "$tar_dir"
pushd "$copy_dir"
mv .vscode "$tar_dir/.vscode"
mv .latexmkrc "$tar_dir"
mv *.tex "$tar_dir"
rm -rf build
rm -f *.sh
popd
rmdir "$copy_dir"
mv "$template_filename" main.tex
popd
