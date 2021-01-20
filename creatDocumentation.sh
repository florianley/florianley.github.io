#!/bin/bash
green=`tput setaf 2`
red=`tput setaf 1`
reset=`tput sgr0`

error_function () {
   echo "${red}ko${reset}"
   echo "execution error  please find a correction or contact your administrator : exit of program"
   exit
}

sudo gem install coderay
sudo gem install pygments.rb
sudo gem install asciidoctor-diagram

echo "html data cleaning"
rm *.html

echo "images cleanup files"
rm -rf img/

# shellcheck disable=SC2045
for file in `ls source/*.adoc`
do
        printf "integration of : $file --> "
        htmlfile="${file%.adoc}.html"
        asciidoctor -r asciidoctor-diagram $file -o $htmlfile -a stylesheet=stylesheet.css >& logs
        if [ $? -eq 0 ]
        then
          grep -i error logs
          if [ $? != 0 ]
          then
            echo "${green}ok${reset}"
          else
            error_function
          fi
        else
          error_function
        fi

done
rm logs
mv source/*.html .
echo "images integration in images folder"
mkdir img
cp source/img/* img/
echo "html documentation ready to be deployed to the world"
