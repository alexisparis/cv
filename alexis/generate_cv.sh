#!/bin/bash
rm -Rf ./tmp/*
rm -f ./output/*

generate () {
	java -jar ../cvelocity-1.0-SNAPSHOT-all.jar \
	-template=CV_Alexis_Paris_velocity.tex \
	-output=./tmp/$1.tex \
	-params=$2

	latex ./tmp/$1.tex -halt-on-error
	mv $1.dvi ./tmp
	# > tmp/$1.latex.log
	dvipdf ./tmp/$1.dvi ./output/$1.pdf
	# > ./tmp/$1.dvipdf.log
	#open ./output/$1.pdf	
}

# debug and all to check content concordance
generate "CV_Alexis_Paris_debug" "{french:true,english:true,qc:false,photo:false,anonymous:false,age:true,debug:true}"

#classic ones
generate "CV_Alexis_Paris_FR"    "{french:true,english:false,qc:false,photo:true,anonymous:false,age:true,debug:false}"
generate "CV_AP_FR"              "{french:true,english:false,qc:false,photo:false,anonymous:true,age:true,debug:false}"
generate "CV_Alexis_Paris_EN"    "{french:false,english:true,qc:false,photo:true,anonymous:false,age:true,debug:false}"
generate "CV_AP_EN"              "{french:false,english:true,qc:false,photo:false,anonymous:true,age:true,debug:false}"
generate "CV_Alexis_Paris_CA_EN" "{french:false,english:true,qc:true,photo:false,anonymous:false,age:false,debug:false}"
generate "CV_Alexis_Paris_CA_FR" "{french:true,english:false,qc:true,photo:false,anonymous:false,age:false,debug:false}"

rm *.aux
rm *.out
rm *.log
rm velocity.log*
