#!/usr/bin/env bash
#

result=${PWD##*/}

cp src-$1/main.idx src-$1/main.idx.bak
cp ./main.tex src-$1/main.tex

cd src-$1/
makeindex main.idx -s ../lib/std.ist
pdflatex -synctex=1 -interaction=nonstopmode main.tex

rm main.tex
mv main.pdf ../index-$1.pdf