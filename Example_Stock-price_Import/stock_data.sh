#!/bin/bash
CheckDependency () {
  echo "$1 Check for Dependencies ===> Not Implemented till now" 
  
}

#-----------------------------
# Variables for text coulours
Red=$'\e[1;31m'
Green=$'\e[1;32m'
Blue=$'\e[1;34m'
Black=$'\e[1;30m'
Yellow=$'\e[1;33m'
#-----------------------------
CheckDependency $Red
choice=1
read -p "$Black Please type Company name or Code: " NAME
no=$(grep -i -e "$NAME" All_NSE_Companies.dat|wc -l)
if [ $no -eq 0 ]; then
	printf "$Red Not a valid keyword --> ${NAME} \n"
	exit
fi
if [ $no -gt 1 ]; then
	printf "$Blue seems like there are ${no} companies, pick any one: \n"
	grep -i -e "$NAME" All_NSE_Companies.dat|nl
	printf "\n"
	read -p "$Black Select a number between 1-${no}: " choice
	if [ $choice -gt $no ]; then
		printf "$Red Wrong choice for company selection\n"
		exit
	fi
fi

# Fetching data from YaHoo finance and plotting
CODE=$(grep -i -e "$NAME" All_NSE_Companies.dat|head -$choice|tail -1|awk '{printf $1}')
CODE=${CODE}".NS"
Stock_Name=$(grep -i -e "$NAME" All_NSE_Companies.dat|head -$choice|tail -1|awk '{ print substr($0, index($0,$2)) }' )
printf "$Black Fetching data from YAHOO-finance for --> ${Stock_Name}\n"
python3 Stock_Price_import.py<<EOF
$CODE
$Stock_Name
EOF
#----------------------------------------- NOT REQUIRED FOR NOW ----------------------------------------------------
#
#NSE_URL="https://www.nseindia.com/get-quotes/equity?symbol="
#wget --user-agent=Mozilla --random-wait --tries=5 "${NSE_URL}${CODE}" --output-document="${CODE}.html"
#status=$(echo $?)
#if [ $status -ne 0 ]; then
#	printf "\n Unable to connect to NSE server. check internet !!\n"
#fi
#
#-----------------------------------------------------------------------------------------------------------








