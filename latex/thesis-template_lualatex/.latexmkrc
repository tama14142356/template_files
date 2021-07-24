#!/usr/bin/env perl

@default_files = ("thesisJp.tex");
$pdf_mode = 4; # 4 for lualatex
$lualatex = 'lualatex -synctex=1 %O %S';
$pdflatex = 'pdflatex -synctex=1 %O %S';
$bibtex = 'upbibtex %O %B';
#$makeindex = 'mendex %O -o %D %S';
$max_repeat = 20;

## viewer settings
$pvc_view_file_via_temporary = 0;
if ($^O eq 'darwin') {
    # OSX
    $pdf_previewer = 'open -a Preview';
} elsif ($^O eq 'linux') {
    # linux
    $pdf_previewer = 'evince';
} else {
    # Windows
    $pdf_previewer    = '"texworks.exe" -reuse-instance %O %S';
}

## output directory
$aux_dir          = "build/";
$out_dir          = "build/";
