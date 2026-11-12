#!/usr/bin/env bash
set -euo pipefail

cd -- "$(dirname -- "$0")"
mkdir -p build/wut build/texmf-var build/texmf-config
export TEXMFHOME="$PWD/build/texmf"
export TEXMFVAR="$PWD/build/texmf-var"
export TEXMFCONFIG="$PWD/build/texmf-config"

pdflatex -interaction=nonstopmode -halt-on-error -output-directory=build/wut main.tex
biber --input-directory=build/wut --output-directory=build/wut main
pdflatex -interaction=nonstopmode -halt-on-error -output-directory=build/wut main.tex
pdflatex -interaction=nonstopmode -halt-on-error -output-directory=build/wut main.tex
