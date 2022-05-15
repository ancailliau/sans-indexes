#!/usr/bin/env bash
#

if test ! -d "build-$1"; then
	rm -rf build-$1
fi
cp -r src-$1 build-$1

cat src-$1/note.txt | awk 'NR!=1'| awk -F '\t' 'NR==FNR {
	x[$1] = $2; next;
} {
	ttt=0;
	if (index($1, "ttt_") == 1) {
		ttt=1;
		sub(/ttt_/, "", $1);
	}
	type=$1;
	category=$2;
	entry=$3;
	subentry=$4;
	book=$5;
	page=$6;

	preamble="";
	postamble="";

	content="";

	if (category != "") {
		preamble="\\indexentry{"x[category]"A@\\textbf{"category"}!1@";
	} else {
		preamble="\\indexentry{";
	}

	if (type == "goto") {
		content=entry" \\goto "subentry;
	} else {
		content=entry;
		if (subentry != "") {
			content=content"!"subentry;
		}
	}

	if (ttt) {
		content="\\texttt{"content"}"
	}

	if (type == "goto") {
		postamble="|comment}{0}";
	} else {
		postamble="|book{"book"}}{"page"}";
	}

	print preamble""content""postamble;

}' src-$1/map.txt - > build-$1/main.idx

cat src-$1/map.txt | awk '{print sprintf("\\indexentry{%sZ@\\blankline|comment}{0}",NR)}' >> build-$1/main.idx
echo "\indexentry{999ZZZ@\\\blankline|newpage\\\comment}{0}" >> build-$1/main.idx

result=${PWD##*/}

cp ./main.tex build-$1/main.tex

cd build-$1/
makeindex main.idx -s ../lib/std.ist
pdflatex -synctex=1 -interaction=nonstopmode main.tex

rm main.tex
mv main.pdf ../index-$1.pdf
