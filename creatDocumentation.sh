#!/bin/bash
green=`tput setaf 2`
reset=`tput sgr0`
echo "html data cleaning"
rm *.html

echo "images cleanup file"
rm -rf img/

# shellcheck disable=SC2045
for file in `ls source/*.adoc`
do
        printf "integration of : $file --> "
        htmlfile="${file%.adoc}.html"
        asciidoctor -r asciidoctor-diagram $file -o $htmlfile -a stylesheet=stylesheet.css
        echo "${green}ok${reset}"
done
mv source/*.html .
echo "images integration in images file"
mkdir img
cp source/img/* img/
echo "html documentation ready to be deployed to the world"
