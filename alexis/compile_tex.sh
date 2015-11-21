#!/bin/bash
rm -Rf ./tmp/*
rm -f ./output/CV_Alexis_Paris.pdf
latex ./CV_Alexis_Paris.tex
mv CV_Alexis_Paris.dvi ./tmp
# > tmp/CV_Alexis_Paris.latex.log
dvipdf ./tmp/CV_Alexis_Paris.dvi ./output/CV_Alexis_Paris.pdf
# > ./tmp/CV_Alexis_Paris.dvipdf.log

open ./output/CV_Alexis_Paris.pdf
