@echo off
setlocal enabledelayedexpansion
@REM change folder to folder which this file exist
pushd %~dp0

@REM script file basename
set program=%~nx0

@REM get git root folder
for /f "usebackq" %%A in (`git rev-parse --show-toplevel`) do set git_root=%%A
set git_root=%git_root:/=\%

@REM get args
set template_kind=%1
set tex_filename=%2
set tar_dir=%3
pushd %3
set tar_dir=%CD%
popd

set template_dir=%git_root%\%template_kind%

@REM copy template folder to target folder
xcopy /s /e /i /y %template_dir% %tar_dir%

pushd %tar_dir%
mkdir tmp
@REM stash tex_filename to tmp folder
move %tex_filename% tmp
rd /s /q build > NUL 2>&1
del /q *.tex > NUL 2>&1
del /q *.sh > NUL 2>&1
move tmp\%tex_filename% %tar_dir%
rmdir tmp
ren %tex_filename% main.tex
popd

popd
