#!/bin/bash

print_header() {
   lightcyan='\033[1;36m'
   nocolor='\033[0m'
   echo -e "${lightcyan}$1${nocolor}"
}

print_header "Install dependeces"
sudo apt install libheif-examples

# print_header "Print repo structure"
# tree

print_header "Run script"
date=$(date +"%d-%m-%y-%T")
echo $date
mkdir output/$date
cd input
for f in *.heic; do heif-convert -q 100 $f ../output/$date/$f.jpg; done

print_header "Create zip file"
cd ../output/$date
zip output_$date *
