@echo off
setlocal enabledelayedexpansion
pushd %~dp0

call template.bat template_platex template_toudai.tex %1
