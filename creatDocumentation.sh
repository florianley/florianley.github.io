#!/bin/bash

echo "html data cleaning"
rm *.html

echo "images cleanup file"
rm -rf img/


echo "asciidoctor -r asciidoctor-diagram source/designPattern.adoc -o designPattern.html -a stylesheet=stylesheet.css"
asciidoctor -r asciidoctor-diagram source/designPattern.adoc -o designPattern.html -a stylesheet=stylesheet.css

echo "asciidoctor -r asciidoctor-diagram source/index.adoc -o index.html -a stylesheet=stylesheet.css"
asciidoctor -r asciidoctor-diagram source/index.adoc -o index.html -a stylesheet=stylesheet.css
#asciidoctor -r asciidoctor-diagram source/index.adoc -o index.html

echo "asciidoctor -r asciidoctor-diagram source/asciidoc.adoc -o asciidoc.html -a stylesheet=stylesheet.css"
asciidoctor -r asciidoctor-diagram source/asciidoc.adoc -o asciidoc.html -a stylesheet=stylesheet.css

echo "images integration in images file"
cp source/img/* img/

echo "html documentation ready to be deployed to the world"
